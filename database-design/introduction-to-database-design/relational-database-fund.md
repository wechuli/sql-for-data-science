# Relational Database Fundamentals

## Table, Rows and Columns

Informally you can think of a relational database as a collection of tables, each containing rows and columns. The set of the values that are allowed for a column is called the column's domain.

Domain is closely related to data type but it's not quite the same thing. A column's data type is the kind of data that the column can hold

## Relations, Attributes and Tuples

The values in a row are related by the fact that they apply to a particular person. Because of this fact, the formal term for a table is a relation. The formal term for a column is an attribute or data element. The formal term for a row is a tuple.

Don't confuse the formal term relation (meaning table) with the more general and less precise use of the term that means "related to" as in "these field form a relation between two tables".

Theoretically, a relation does not impose any ordering on the tuples that it contains nor does it give an ordering to its attributes.Generally the orderings don’t matter to mathematical database theory. In
practice, however, database applications usually sort the records selected from a table in some manner
to make it easier for the user to understand the results. It’s also a lot easier to write the program (and for
the user to understand) if the order of the fields remains constant, so database products typically return
fields in the order in which they were created in the table unless told otherwise.

## Keys

In the loosest sense, a key is a combination of one or more columns that you use to find rows in a table. A compound key or composite key is a key that includes more than one column.

A _superkey_ is a set of one or more columns in a table for which no two rows can have the exact same values. Because superkeys define fields that must be unique within a table, they are sometimes called unique keys.

Because no two rows in the table have the same values for a superkey, a superkey can uniquely identify
a particular row in the table. In other words, a program could use a superkey to find any particular
record.

A candidate key is a minimal superkey. That means if you remove any of the columns from the superkey,
it won’t be a superkey anymore.

Note that there may be more than one superkey or candidate key in a table

A unique key is a superkey that is used to uniquely identify the rows in a table. The difference between a
unique key and any other candidate key is in how it is used. A candidate key could be used to identify
rows if you wanted it to, but a unique key is used to constrain the data.A unique key is an implementation issue, not a more theoretical concept like a candidate
key is.

A primary key is a superkey that is actually used to uniquely identify or find the rows in a table. A table
can have only one primary key (hence the name ‘‘primary’’). Again, this is more of an implementation
issue than a theoretical concern. Database products generally take special action to make finding records
based on their primary keys faster than finding records based on other keys.

Some databases allow alternate key fields to have missing values, whereas all of the fields in a primary
key are required


An alternate key is a candidate key that is not the primary key. Some also call this a secondary key, although
others use the term secondary key to mean any set of fields used to locate records even if the fields don’t
define unique values.

- Compound key or composite key: A key that includes more than one field.
- Superkey: A set of columns for which no two rows can have the exact same values.
- Candidate key:Aminimal superkey.
- Unique key: A superkey used to require uniqueness by the database.
- Primary key: A unique key that is used to quickly locate records by the database.
- Alternate key: A candidate key that is not the primary key.
- Secondary key: A key used to look up records but that may not guarantee uniqueness.

## Indexes

An index is a database structure that makes it quicker and easier to find records based on the values in one or more fields.Indexes are not the same as keys.

Building and maintaining an index takes the database some extra time, so you shouldn't make indexes gratuitously. Place indexes on the fields that you are most likely to need to search.

## Constraints

A constraint places restrictions on the data allowed in a table.

### Basic Constraints

Relational database let you specify some simple basic constraints on a particular field.
- required field (not null)
- datatype and domain

### Check Constraints

A check constraint is a more complicated type of restriction that evaluates a Boolean expression to see if certain data should be allowed. If the expression evaluates to true, the data is allowed.

**A field level** check contraint validates a single column.
**A table-level** check constraint can examine more than one of a record's fields to see if the data is valid.

### Primary Key Constraints
By definition, no two records can have identical values for the fields that define the table's primary key. That greatly constraints the data.

### Unique Constraints

A unique constraint requires that the values in one or more fields be unique. Note that it only makes sense to place a uniqueness constraint on a superkey.

### Foreign Key Constraints
A *foreign key* is not quite the same kind of key defined previously. Instead of defining fields that you use to locate records, foreign key refers to a key in another (foreign) table. The database uses it to locate records in the other table but you don't. Because it defines a reference from one table to another, this kind of constraint is also called a referential integrity constraint.

A foreign key constraint requires that a record’s values in one or more fields in one table (the referencing
table) must match the values in another table (the foreign or referenced table). The fields in the referenced
table must form a candidate key in that table. Usually they are that table’s primary key, and most
database products try to use the foreign table’s primary key by default when you make a foreign key
constraint.

## Database Operations

Eight operations were originally defined for relational databases and they form the core of modern database operations

- **Selection** - This selects some or all of the records in a table
- **Projection** - This drops columns from a table.
- **Union** - This combines tables with similar columns and removes duplicates.
- **Intersection** - This finds the records that are the same in two tables.
- **Difference** - This finds the records that are the same in two tables.
- **Cartesian Product** - This created a new table containing every record in a first table combined with every record in a second table
- **Join** -This is similar to a Cartesian product except records in one table are paired only with those
in the second table if they meet some condition.
- **Divide** - This operation is the opposite of the Cartesian product. It uses one table to partition the
records in another table

