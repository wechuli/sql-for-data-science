-- sql setup script for the IoT Smart Grid demo
--
-- Requires a database with the name PowerConsumption
--
-- Applies To: SQL Server 2016 (or higher); Azure SQL Database
-- Author: Perry Skountrianos (Microsoft)
-- Last Updated: 2016-06-13

USE [PowerConsumption]
GO

SET NOCOUNT ON;
SET XACT_ABORT ON;


-- 1. validate that In-Memory OLTP is supported
IF SERVERPROPERTY(N'IsXTPSupported') = 0 
BEGIN                                    
    PRINT N'Error: In-Memory OLTP is not supported for this server edition or database pricing tier.';
END 
IF DB_ID() < 5
BEGIN                                    
    PRINT N'Error: In-Memory OLTP is not supported in system databases. Connect to a user database.';
END 
ELSE 
BEGIN 
	BEGIN TRY;
-- 2. add MEMORY_OPTIMIZED_DATA filegroup when not using Azure SQL DB
	IF SERVERPROPERTY('EngineEdition') != 5 
	BEGIN
		DECLARE @SQLDataFolder nvarchar(max) = cast(SERVERPROPERTY('InstanceDefaultDataPath') as nvarchar(max))
		DECLARE @MODName nvarchar(max) = DB_NAME() + N'_mod';
		DECLARE @MemoryOptimizedFilegroupFolder nvarchar(max) = @SQLDataFolder + @MODName;

		DECLARE @SQL nvarchar(max) = N'';

		-- add filegroup
		IF NOT EXISTS (SELECT 1 FROM sys.filegroups WHERE type = N'FX')
		BEGIN
			SET @SQL = N'
ALTER DATABASE CURRENT 
ADD FILEGROUP ' + QUOTENAME(@MODName) + N' CONTAINS MEMORY_OPTIMIZED_DATA;';
			EXECUTE (@SQL);

		END;

		-- add container in the filegroup
		IF NOT EXISTS (SELECT * FROM sys.database_files WHERE data_space_id IN (SELECT data_space_id FROM sys.filegroups WHERE type = N'FX'))
		BEGIN
			SET @SQL = N'
ALTER DATABASE CURRENT
ADD FILE (name = N''' + @MODName + ''', filename = '''
						+ @MemoryOptimizedFilegroupFolder + N''') 
TO FILEGROUP ' + QUOTENAME(@MODName);
			EXECUTE (@SQL);
		END
	END

	-- 3. set compat level to 130 if it is lower
	IF (SELECT compatibility_level FROM sys.databases WHERE database_id=DB_ID()) < 130
		ALTER DATABASE CURRENT SET COMPATIBILITY_LEVEL = 130 

	-- 4. enable MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT for the database
	ALTER DATABASE CURRENT SET MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = ON;


    END TRY
    BEGIN CATCH
        PRINT N'Error enabling In-Memory OLTP';
		IF XACT_STATE() != 0
			ROLLBACK;
        THROW;
    END CATCH;
END
GO

-- DROP EXISTING OBJECTS
DROP PROCEDURE IF EXISTS [dbo].[InsertMeterMeasurement] 
GO
DROP TYPE IF EXISTS [dbo].[udtMeterMeasurement] 
GO
DROP VIEW IF EXISTS [dbo].[vwMeterMeasurement] 
GO
IF OBJECT_ID('dbo.MeterMeasurement', 'U') IS NOT NULL
	ALTER TABLE [dbo].[MeterMeasurement] SET ( SYSTEM_VERSIONING = OFF )
GO
DROP TABLE IF EXISTS [dbo].[MeterMeasurement]
GO
DROP TABLE IF EXISTS [dbo].[MeterMeasurementHistory]
GO

-- CREATE OBJECTS
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterMeasurementHistory](
	[MeterID] [int] NOT NULL,
	[MeasurementInkWh] [decimal](9, 4) NOT NULL,
	[PostalCode] [nvarchar](10) NOT NULL,
	[MeasurementDate] [datetime2](7) NOT NULL,
	[SysStartTime] [datetime2](7) NOT NULL,
	[SysEndTime] [datetime2](7) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterMeasurement]
(
	[MeterID] [int] NOT NULL,
	[MeasurementInkWh] [decimal](9, 4) NOT NULL,
	[PostalCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MeasurementDate] [datetime2](7) NOT NULL,
	[SysStartTime] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[SysEndTime] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime]),

 PRIMARY KEY NONCLUSTERED 
(
	[MeterID] ASC
)
)WITH ( MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_AND_DATA, SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[MeterMeasurementHistory] , DATA_CONSISTENCY_CHECK = ON ) )

GO

CREATE VIEW [dbo].[vwMeterMeasurement]
AS
SELECT	PostalCode,
		DATETIMEFROMPARTS(
			YEAR(MeasurementDate), 
			MONTH(MeasurementDate), 
			DAY(MeasurementDate), 
			DATEPART(HOUR,MeasurementDate), 
			DATEPART(MINUTE,MeasurementDate), 
			DATEPART(ss,MeasurementDate)/1,
			0
		) AS MeasurementDate,
		count(*) AS MeterCount,
		AVG(MeasurementInkWh) AS AvgMeasurementInkWh
FROM	[dbo].[MeterMeasurement] FOR SYSTEM_TIME ALL WITH (NOLOCK)
GROUP BY
		PostalCode,
		DATETIMEFROMPARTS(
		YEAR(MeasurementDate), 
		MONTH(MeasurementDate), 
		DAY(MeasurementDate), 
		DATEPART(HOUR,MeasurementDate), 
		DATEPART(MINUTE,MeasurementDate), 
		DATEPART(ss,MeasurementDate)/1,0)
GO
CREATE TYPE [dbo].[udtMeterMeasurement] AS TABLE(
	[RowID] [int] NOT NULL,
	[MeterID] [int] NOT NULL,
	[MeasurementInkWh] [decimal](9, 4) NOT NULL,
	[PostalCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MeasurementDate] [datetime2](7) NOT NULL,
	INDEX [IX_RowID] NONCLUSTERED HASH 
(
	[RowID]
)WITH ( BUCKET_COUNT = 1024)
)
WITH ( MEMORY_OPTIMIZED = ON )
GO
CREATE PROCEDURE [dbo].[InsertMeterMeasurement] 
	@Batch AS dbo.udtMeterMeasurement READONLY,
	@BatchSize INT

WITH NATIVE_COMPILATION, SCHEMABINDING
AS
BEGIN ATOMIC WITH (TRANSACTION ISOLATION LEVEL=SNAPSHOT, LANGUAGE=N'English')
	DECLARE @i INT = 1
	DECLARE @MeterID INT
	DECLARE @MeasurementInkWh DECIMAL(9, 4)
	DECLARE @PostalCode NVARCHAR(10)
	DECLARE @MeasurementDate DATETIME2(7) 
	
	WHILE (@i <= @BatchSize)
	BEGIN	
	
		SELECT	@MeterID = MeterID,
				@MeasurementInkWh = MeasurementInkWh, 
				@MeasurementDate = MeasurementDate,
				@PostalCode = PostalCode
		FROM	@Batch
		WHERE	RowID = @i
		
		UPDATE	dbo.MeterMeasurement 
		SET		MeasurementInkWh += @MeasurementInkWh,
				MeasurementDate = @MeasurementDate,
				PostalCode = @PostalCode
		WHERE	MeterID = @MeterID							
		
		IF(@@ROWCOUNT = 0)
		BEGIN
			INSERT INTO dbo.MeterMeasurement (MeterID, MeasurementInkWh, PostalCode, MeasurementDate)
			VALUES (@MeterID, @MeasurementInkWh, @PostalCode, @MeasurementDate);			
		END 

		SET @i += 1
	END	
END
GO



