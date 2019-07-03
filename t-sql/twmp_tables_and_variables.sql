create view salesview
as 
select oh.SalesOrderID,oh.OrderDate,oh.CustomerID,od.LineTotal,od.ProductID,od.OrderQty
from SalesLT.SalesOrderHeader as oh
join SalesLT.SalesOrderDetail as od
on od.SalesOrderID = oh.SalesOrderID;

select *
from salesview;


-- create a view
create view myView
as
select C.CustomerID,FirstName,LastName,AddressLine1,City,StateProvince
from SalesLT.Customer as C
join SalesLT.CustomerAddress as CA
on C.CustomerID = CA.CustomerID
join SalesLT.Address as A
on CA.AddressID = A.AddressID;

-- query a view
select *
from myView;


-- join the view to a table
select c.StateProvince, c.City,isnull(sum(s.TotalDue),0.00) as Revenue
from myView as c
left join SalesLT.SalesOrderHeader as s
on s.CustomerID = c.CustomerID
group by c.StateProvince,c.City
order by c.StateProvince,Revenue desc;

-- Temporary table
create table #Colors
(Color varchar(15));

insert into #Colors
select distinct Color from SalesLT.Product;

select * from #Colors;

-- Table variable

declare @Colors as Table ( Color varchar(15));

insert into @Colors
select distinct Color from SalesLT.Product;

select * from @Colors;

--New Batch
select * from #Colors;
select * from @Colors;

