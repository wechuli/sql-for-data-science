select *
from SalesLT.Customer;

select *
from SalesLT.SalesOrderHeader;

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

-- 

select cu.CompanyName, cu.FirstName, cu.LastName,soh.TotalDue,soh.SalesOrderID
from SalesLT.Customer as cu
left join SalesLT.SalesOrderHeader as soh
on soh.CustomerID = cu.CustomerID
order by soh.TotalDue desc;