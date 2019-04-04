select * 
from SalesLT.Customer;
select * 
from SalesLT.SalesOrderHeader;

-- Get all customers, with sales orders for those who've bought anything
select c.CustomerID,c.FirstName,c.LastName,sh.SalesOrderNumber
from SalesLT.Customer as c
left outer join SalesLT.SalesOrderHeader as sh
on c.CustomerID = sh.CustomerID
order by c.CustomerID;


-- Return only customer who haven't purchased anything
select  c.CustomerID,c.FirstName,c.LastName,sh.SalesOrderNumber
from SalesLT.Customer as c
left outer join SalesLT.SalesOrderHeader as sh
on c.CustomerID = sh.CustomerID
where sh.SalesOrderNumber is  null
order by c.CustomerID;

-- More than 2 tables
select p.Name as ProductName, oh.SalesOrderNumber
from SalesLT.Product as p
left join SalesLT.SalesOrderDetail as od
on p.ProductID = od.ProductID
left join SalesLT.SalesOrderHeader as oh
on od.SalesOrderID = oh.SalesOrderID
order by p.ProductID;


--
select p.Name as ProductName, c.Name as Category, oh.SalesOrderNumber
From SalesLT.Product as p
left outer join SalesLT.SalesOrderDetail as od
on p.ProductID = od.ProductID
left outer join SalesLT.SalesOrderHeader as oh
on od.SalesOrderID = oh.SalesOrderID
inner join SalesLT.ProductCategory as c
on p.ProductCategoryID = c.ProductCategoryID
order by p.ProductID;