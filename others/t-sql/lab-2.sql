select *
from SalesLT.Address;

select *
from SalesLT.Product;

select distinct City
from SalesLT.Address;

-- Write a Transact-SQL query that queries the Address table and retrieves all values for City and StateProvince, removing duplicates
select distinct City, StateProvince
from SalesLT.Address;

--Retrieve the names of the top ten percent of products by weight.
select top 10 Name,isnull (Weight,0) as Weight
from SalesLT.Product
order by Weight desc;

--list the heaviest 100 products not including the heaviest ten.
select Name,Weight
from SalesLT.Product
order by Weight desc
offset 10 rows fetch next 100 rows only;

-- you need to find the names, colors, and sizes of the products with a product model ID 1.
select Name,Color,Size
from SalesLT.Product
where ProductModelID = 1;


-- Retrieve the product number and name of the products that have a color of 'black', 'red', or 'white' and a size of 'S' or 'M'.
select ProductNumber,Name,Color,Size
from SalesLT.Product
where Color in ('Black','Red','White') and Size in ('S','M');

-- Retrieve the product number, name, and list price of products whose product number begins 'BK-'.
select ProductNumber,Name,ListPrice as Price
from SalesLT.Product
where ProductNumber like ('BK-%');


-- Modify your previous query to retrieve the product number, name, and list price of products whose product number begins 'BK-' followed by any character other than 'R’, and ends with a '-' followed by any two numerals.
select ProductNumber,Name,ListPrice as Price
from SalesLT.Product
where ProductNumber like ('BK-[^R]%-[0-9][0-9]');
