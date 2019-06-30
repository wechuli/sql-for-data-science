## Creating Databases with SQL Server

Whether you create a database graphically using the designer or using a query, the following 2 files get generated
.MDF file - data File(Contains actual data)
.LDF file - Transaction Log file(Used to recover the database)

When dropping a database, it should not be used. Dropping a database deletes the LDF and MDF files. If other users are connected , you need to put the database in asingle user mode and then drop the database.

        Alter Database DatabaseName Set SINGLE_USER with Rollback Immediate

With Rollback Immediate option, will rollback all incomplete transactions and closes the connection to the database.

System databases cannot be dropped.

Primary Key is used to uniquely identify each row in a table. Foreign keys are used to enforce database integrity. A foreign key in one table points to a primary key in another table. The foreign key constarint prevents invalid data from being inserted into the foreign key column. The values that you enter into the foreign key column, has to be one of the values contrained in the table it points to.

## Adding a Foreign Key Constraint

\*\*Alter table ForeignKeyTable add constrain ForeignKeyTable_ForeignKeyColumn_FK foreign key (ForeignKeyColumn) references PrimaryKeyTable(PriamryKeyColumn)

## Adding a Default Contraint

## Cascading referential integrity

Cascading referential integrity constraint allows us to define the sctions SQL server should take when a user attempts to delete or update a key to which an existing foreign keys points.

Options to handle Cascading referential integrity

1. **No Action** - This is the default behaviour. No Action specifies that if an attempt is made to delete or update a row with a key referenced by foreign keys in existing rows in other tables, an error os raised and the DELETE or UPDATE is rolled back.
2. **Cascade** - Specifies that if an attempt is made to delete or update a row with a key referenced by foreign keys in existing rows in other tables, all rows containng those foreign keys are also deleted or updated.
3. **Set Null** - specifies that if an attempt is made to delete or update a row with a key referenced by foreign keys in existing rows in other tables, all rows containing those foreng keys are set to null.
4. **Set Default** - Specifies that if an attempt is made to delete or update a row with a key referenced by foreign keys in existing rows in other tables, all rows containing those foreign keys are set to default values.
