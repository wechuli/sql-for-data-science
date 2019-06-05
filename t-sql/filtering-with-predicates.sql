 -- List information aboout product model 6
 select * 
 from SalesLT.Product
 where ProductModelID = 6;

 --List information about products that have a product number beginning FR
select *
from SalesLT.Product
where ProductNumber like 'FR%';

--Filter the previous query to ensure that the product number contains two sets of two digits
select *
from SalesLT.Product
where ProductNumber like 'FR-_[0-9][0-9]_-[0-9][0-9]';

-- Find the products that have no sell end date
select *
from SalesLT.Product
where SellEndDate is null;


--Find product that have a sell end date in 2006
select *
from SalesLT.Product
where SellEndDate between '2006/1/1' and '2006/12/31'; -- yyyy-mm-dd

--Find products that have a category ID of 5,6 or 7
select * 
from SalesLT.Product
where ProductCategoryID in (5,6,7);

--find products that have a category Id of 5,6,7 and have a sell end date
select * 
from SalesLT.Product
where ProductCategoryID in (5,6,7) and SellEndDate is not null
order by ProductID;

--select products that have a category ID of 5,6,or 7 and a product number that begins FR
select *
from SalesLT.Product
where ProductCategoryID in (5,6,7) and ProductNumber like 'FR%';


--select products that have a category ID of 5,6,or 7 or a product number that begins FR

select *
from SalesLT.Product
where ProductCategoryID in (5,6,7) or ProductNumber like 'FR%';
