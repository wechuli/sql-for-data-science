## Creating Databases with SQL Server

Whether you create a database graphically using the designer or using a query, the following 2 files get generated
.MDF file - data File(Contains actual data)
.LDF file - Transaction Log file(Used to recover the database)

When dropping a database, it should not be used. Dropping a database deletes the LDF and MDF files. If other users are connected , you need to put the database in asingle user mode and then drop the database.

        Alter Database DatabaseName Set SINGLE_USER with Rollback Immediate

With Rollback Immediate option, will rollback all incomplete transactions and closes the connection to the database.

System databases cannot be dropped.

Primary Key is used to uniquely identify each row in a table. Foreign keys are used to enforce database integrity.  A foreign key in one table points to a primary key in another table. The foreign key constarint prevents invalid data from being inserted into the foreign key column. The values that you enter into the foreign key column, has to be one of the values contrained in the table it points to.

## Adding a Foreign Key Constraint

**Alter table ForeignKeyTable add constrain ForeignKeyTable_ForeignKeyColumn_FK foreign key (ForeignKeyColumn) references PrimaryKeyTable(PriamryKeyColumn)