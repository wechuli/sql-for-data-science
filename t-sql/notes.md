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

### Cross joins

- A cross join returns a Cartesian product that includes every combination of the selected columns from both tables.
- While not commonly used in typical application processing, cross joins can be useful in some specialized scenarios - such as generating test data.

### Self joins

- A self-join is an inner, outer, or cross join that matches rows in a table to other rows in the same table.
- When defining a self-join, you must specify an alias for at least one instance of the table being joined.

## UNION Queries

- Union returns a result set of distinct rows combined from all statements
- union removes duplicates during query processing(affects perfomance)
- Union all retains duplicates during query processing

### Guidelines to UNION

- Column aliases must be expressed in first query
- number of columns must be the same
- data types, must be compatible for implicit conversion(or converted explicitly)

## INTERSECT

- Intersect return only distinct rows that appear in both result set

## EXCEPT

- Except return only distinct rows that appear in the first set but not the second - order in which sets are specified matters

## Introduction to Functions

- Scalar Functions -
  - Configuration
  - Conversion
  - Cursor
  - Date and Time
- Aggregate Functions - operate on a single row, return a single value
- Logical Functions - scalar functions that compare multiple values to determine a single output
- Window Functions - Take one or more input values, return a single summarizing value
- Grouping with GROUP BY - Operate on a window(set) of rows
- Filtering with HAVING - Return a virtual table that can be used subsequently in a Transact-SQL statement

## SubQueries

### Scala subquery

Returns single value to outer query. Can be used anywhere wingle-valued expression is used

### Multi-Valued

Returns multiple values as a single column set to the outer query. Used with IN predicate.

### Correlated Subqueries

Most subqueries are self contained and have no connection with the outer query other than passing it results
Correlated subqueries refer to elemets of tables used in outer query

- Dependent on outer query, cannot be executed separately
- Behaves as if inner query is executed once per outer row
- May return scalar value or multiple values

## The Apply Operator

- The APPLY operator enables you to execute a table-valued function for each row in a rowset returned by a SELECT statement. Conceptually this approach is similar to a correlated subquery
- Cross Apply returns matching rows, similar to an inner join. OUTER APPLY returns all rows in the original SELECT query results with NULL values for rows where no match was found.

* Views
* Temporary Tables
* Table Variables
* Table-Valued Functions
* Derived Tables
* Common Table Expressions

### Querying Views

Views are named queries with definitions stored in a database.

- views can provide abstraction, encapsultation and simplification
- From an administrative perspective, views can provide a security layer to a database

Views may be referenced in a SELECT statement just like a table

### Temporary Tables

Temporary tables are used to hold temporary result sets within a user's session

- Created in tempdb and deleted automatically
- created with a # prefix
- Global temporary tables are created with ## prefix

Temporary tables are prefixed with a # symbol (You can also create global temporary tables that can be accessed by other processes by prefixing the name with ##)

Local temporary tables are automatically deleted when the session in which they were created ends. Global temporary tables are deleted when the last user sessions referencing them is closed.

### Table Variables

Introduced because temporary tables can cause recompilations
Used similarly to temporary tables but scoped to the batch
Use only on very small datasets. Table variables are prefixed with a @ symbol.Table variables are scoped to the batch in which they are created.

## Grouping Sets and Pivoting Data

### Grouping Sets
Grouping sets subclause builds on GROUP BY clause
Allows multiple groupings to be defined in the same query
```SQL
SELECT <column list with aggregates(s)>
FROM <source>
GROUP BY
GROUPING SETS
(
    <column_name>, --one or more columns
    <column_name>, --one or more columns
    () -- empty paranthesis if aggregating all rows

)
```
### Rollup and Cube

ROLLUP provides shortcut for defining grouping sets with combinations that assume input columns form a hierarchy

```SQL
SELECT StateProvince, City, COUNT(CustomerID) as Customers
from Sales.vCustomerDetails
GROUP BY ROLLUP(StateProvince,City)
ORDER BY StateProvince, City;
```

CUBE provides shortcut for defining grouping sets in which all possible combinations of grouping sets created.

```SQL
SELECT SalesPersonName, CustomerName, SUM(Amount) as TotalAmount
FROM Sales.vSalesOrders
GROUP BY CUBE(SalesPersonName,CustomerName)
ORDER BY SalesPersonName,CustomerName;
```

Multiple grouping sets present a problem in identifying the source of each row in the result set. NULL could come from the source data or could be a placeholder in the grouping set. The GROUPING_ID function provides a method to make a row with a 1 or 0 to identify which grouping set for the row.


## Pivoting Data and Unpivoting Data

Pivoting data is rotating data from a rows-based orientation to a columns-based orientation. Distinct values from a single column are projected across as headings for other columns - may include aggregation. Use PIVOT to re-orient a rowset by generating multiple columns from values in a single column

Unpivoting data is rotating data from a columns-based orientation to a rows-based orientation. Spreads or splits values from one source row into one or more target rows. Use UNPIVOT to re-orient multiple columns in an existing rowset into a single column.