select * from SalesLT.Address;

select * 
from SalesLT.Product


-- select disntinct rows
select distinct isnull(Color,'None') as Color from SalesLT.Product;

--Display a list
select distinct isnull(Color,'None') as Color from SalesLT.Product order by Color;

--Display a list of product colors with the word 'None' if the value is null and a dash if the size is null sorted by color

select distinct isnull(Color,'None') as color,isnull(Size,'-') as size
from SalesLT.Product order by Color;

--display the top 100 products by list price
select top 100 *
from SalesLT.Product
order by ListPrice desc;

--Display the first ten products by product number
select * from
SalesLT.Product
order by ProductNumber 
offset 0 rows fetch next 10 rows only;

--Display the next ten products by the product number
select * from 
SalesLT.Product
order by ProductNumber
offset 10 rows fetch next 10 rows only;


--another 10

select * from 
SalesLT.Product
order by ProductNumber
offset 20 rows fetch next 10 rows only;