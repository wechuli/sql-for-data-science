
--Basic inner join
select SalesLT.Product.Name as ProductName, SalesLT.ProductCategory.Name as category
from SalesLT.Product 
inner join SalesLT.ProductCategory
on SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID;

-- Table aliases
select p.Name as ProductName, c.Name as Category
from SalesLT.Product as p
inner join SalesLT.ProductCategory as c
on p.ProductCategoryID = c.ProductCategoryID;

--Joining more than 2 tables

select oh.OrderDate,oh.SalesOrderNumber,p.Name,Od.OrderQty,od.UnitPrice,od.LineTotal
from SalesLT.SalesOrderHeader as oh
join SalesLT.SalesOrderDetail as od
on od.SalesOrderID = oh.SalesOrderID
join SalesLT.Product as p
on od.ProductID = p.ProductID
order by oh.Orderdate, oh.SalesOrderID,od.SalesOrderDetailID;

-- Multiple joins with predicates

select oh.OrderDate,oh.SalesOrderNumber,p.Name,Od.OrderQty,od.UnitPrice,od.LineTotal
from SalesLT.SalesOrderHeader as oh
join SalesLT.SalesOrderDetail as od
on od.SalesOrderID = oh.SalesOrderID
join SalesLT.Product as p
on od.ProductID = p.ProductID and od.UnitPrice = od.UnitPrice
order by oh.Orderdate, oh.SalesOrderID,od.SalesOrderDetailID;

