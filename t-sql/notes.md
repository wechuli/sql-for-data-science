## Key Points
- Use the SELECT statement to retrieve a rowset of data from tables and views in a database.
- **SELECT** statements are written with the following clauses: SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY. However, the query engine processes the   clauses in this order: FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY.
- In the SELECT clause, you can use * to return all columns, but generally you should specify explicit columns.
- You can specify expressions in the SELECT clause to return the results of calculations.
- You can use the AS keyword to specify aliases for columns in the rowset returned by the SELECT statement.

## Working with Data Types

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
    - CAST/TRY_CAST
    - CONVERT/TRY_CONVERT
