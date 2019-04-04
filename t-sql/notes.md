## Key Points

- Use the SELECT statement to retrieve a rowset of data from tables and views in a database.
- **SELECT** statements are written with the following clauses: SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY. However, the query engine processes the clauses in this order: FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY.
- In the SELECT clause, you can use \* to return all columns, but generally you should specify explicit columns.
- You can specify expressions in the SELECT clause to return the results of calculations.
- You can use the AS keyword to specify aliases for columns in the rowset returned by the SELECT statement.

## Working with Data Types

Transact-SQL supports a wide range of data types, which can be broadly categorized as exact numeric, approximate numeric, character, date/time, binary, and other (which includes specialized data types for handling data such as XML and spatial data).
Some data types are compatible, and values can be implicitly converted between them. Conversion between other data types requires the use of explicit conversion functions.

### Exact Numeric

    - tinyint
    - smallint
    - int
    - bit
    - decimal/numeric
    - numeric
    - money
    - smallmoney

### Approximate Numeric

    - float
    - real

### Character

    - char
    - varchar
    - text
    - nchar
    - nvarchar
    - text

### Date/Time

    - date
    - time
    - datetime
    - datetime2
    - smalldatetime
    - datetimeoffset

### Binary

    - binary
    - varbinary
    - image

### Other

    - cursor
    - hierarchyid
    - sql_variant
    - table
    - timestamp

## Conversion

Implicit Conversion

Explicit Conversion - requires an explicit conversion function - CAST/TRY_CAST - CONVERT/TRY_CONVERT - PARSE/TRY_PARSE - STR

## Working with Nulls

NULL represents a missing or unknown value
ANSI behaviour of NULL values - The result of any expression containing NULL value is NULL - Equality comparisons always return false for NULL values
-NULL = NULL returns false
-NULL is NULL returns true

### NULL Functions

- ISNULL(column/variable,value)- Returns value if the column or variable is NULL
- NULLIF(column/variable,value) - Returns NULL if the column or variable is value
- COALESCE(column/variable1,column/variable2,..)-Returns the value of the first non_NULL column or variable in the list

* NULL is used to indicate an unknown or missing value. NULL is not equivalent to zero or an empty string.
* Arithmetic or string concatenation operations involving one or more NULL operands return NULL. For example, 12 + NULL = NULL.
* If you need to compare a value to NULL, use the IS operator instead of the = operator.
* The ISNULL function returns a specified alternative value for NULL columns and variables.
* The NULLIF function returns NULL when a column or variable contains a specified value.
* The COALESCE function returns the first non-NULL value in a specified list of columns or variables).

## Removing duplicates

- By default, the SELECT statement returns all rows. If mulitple rows contain the same values for every column, they are duplicated in the results. Using the DISTINCT keyword eliminates duplicates, ensuring that only one row for each distinct combination of column values is returned.
- The order of rows in the result of a SELECT statement is not guaranteed unless you explicitly specify one or more columns in an ORDER BY clause. You can specify sort direction as ASC (the default) or DESC.
- You can combine the ORDER BY clause with the TOP keyword to retrict the results so that they include only the top n rows (where n is the number or percentage of rows you want to return).
- You can implement a query to retrieve a specified "page" of results by using the OFFSET and FETCH keywords with the ORDER BY clause.

##Filtering with predicates

- Use the WHERE clause to filter the results returned by a SELECT query based on a search condition.
- A search condition is composed of one or more predicates.
- Predicates include conditional operators (such as =, >, and <), IN, LIKE, and NOT.
- You can use AND and OR to combine predicates based on Boolean logic.

## Joins

- inner joins - return only rows where a match is found in both input tables
- outer joins
- cross joins
- self joins

combine rows from multiple tables by specifying matching criteria, usually based on primary key- foreign key relationships

### Outer joins

- Use a Left Outer Join to include all rows from the first table and values from matched rows in the second table. Columns in the second table for which no matching rows exist are populated with NULLs.
- Use a Right Outer Join to include all rows from the second table and values from matched rows in the first table. Columns in the first table for which no matching rows exist are populated with NULLs.
- Use a Full Outer Join to include all rows from the first and second tables. Columns in the either table for which no matching rows exist are populated with NULLs.
