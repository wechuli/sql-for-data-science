select *
from SalesLT.Customer;

select *
from SalesLT.SalesOrderHeader;

select * 
from SalesLT.SalesOrderDetail;

select *
from SalesLT.Product;

select *
from SalesLT.Address;

select *
from SalesLT.CustomerAddress;

select c.CompanyName,oh.SalesOrderID,oh.TotalDue,ad.City,ad.StateProvince,ad.PostalCode,ad.CountryRegion,ad.AddressLine1,isnull(ad.AddressLine2,'NA') as AdresssLine2
from SalesLT.Customer as c
join SalesLT.SalesOrderHeader as oh
on c.CustomerID = oh.CustomerID
join SalesLT.CustomerAddress as ca
on ca.CustomerID = c.CustomerID
join SalesLT.Address as ad
on ad.AddressID = ca.AddressID
where ca.AddressType = 'Main Office';


-- Customer Orders with Addresses
SELECT c.CompanyName, a.AddressLine1, ISNULL(a.AddressLine2, '') AS AddressLine2,
	   a.City, a.StateProvince, a.PostalCode, a.CountryRegion, oh.SalesOrderID, oh.TotalDue
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS oh
ON oh.CustomerID = c.CustomerID
JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID AND AddressType = 'Main Office'
JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID;

-- 1
select cu.CompanyName, cu.FirstName, cu.LastName,soh.TotalDue,soh.SalesOrderID
from SalesLT.Customer as cu
left join SalesLT.SalesOrderHeader as soh
on soh.CustomerID = cu.CustomerID
order by soh.TotalDue desc;

-- 2
select cu.CustomerID,cu.CompanyName,cu.FirstName,cu.LastName,cu.Phone
from SalesLT.Customer as cu
left join SalesLT.CustomerAddress as ca
on ca.CustomerID = cu.CustomerID
where ca.AddressID is null;

-- 3
select c.CustomerID,prod.ProductID
from SalesLT.Customer as c
left join SalesLT.SalesOrderHeader as oh
on c.CustomerID = oh.CustomerID
left join SalesLT.SalesOrderDetail as od
on oh.SalesOrderID = od.SalesOrderID
full outer join SalesLT.Product as prod
on prod.ProductID = od.ProductID
where oh.SalesOrderID is null
order by prod.ProductID,c.CustomerID;


-- Customers and products for which there are no orders
SELECT c.CustomerID, p.ProductID
FROM SalesLT.Customer AS c
FULL JOIN SalesLT.SalesOrderHeader AS oh
ON c.CustomerID = oh.CustomerID
FULL JOIN SalesLT.SalesOrderDetail AS od
ON od.SalesOrderID = oh.SalesOrderID
FULL JOIN SalesLT.Product AS p
ON p.ProductID = od.ProductID
WHERE oh.SalesOrderID IS NULL
ORDER BY ProductID, CustomerID;