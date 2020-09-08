select *
from SalesLT.CustomerAddress;

select *
from SalesLT.Address;

select *
from SalesLT.Customer;

-- Write a query that retrieves the company name, first line of the street address, city, and a column named AddressType with the value ‘Billing’ for customers where the address type in the SalesLT.CustomerAddress table is ‘Main Office’.

select c.CompanyName,ad.AddressLine1,ad.City,'Billing' as AddressType
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as ad
on ca.AddressID = ad.AddressID
where ca.AddressType = 'Main Office';

--Write a similar query that retrieves the company name, first line of the street address, city, and a column named AddressType with the value ‘Shipping’ for customers where the address type in the SalesLT.CustomerAddress table is ‘Shipping’.


select c.CompanyName,ad.AddressLine1,ad.City,'Shipping' as AddressType
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as ad
on ca.AddressID = ad.AddressID
where ca.AddressType = 'Shipping';


--Combine the results returned by the two queries to create a list of all customer addresses that is sorted by company name and then address type.


select c.CompanyName,ad.AddressLine1,ad.City,'Billing' as AddressType
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as ad
on ca.AddressID = ad.AddressID
where ca.AddressType = 'Main Office'
union all
select c.CompanyName,ad.AddressLine1,ad.City,'Shipping' as AddressType
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as ad
on ca.AddressID = ad.AddressID
where ca.AddressType = 'Shipping'
order by c.CompanyName,AddressType;


--Write a query that returns the company name of each company that appears in a table of customers with a ‘Main Office’ address, but not in a table of customers with a ‘Shipping’ address.

select c.CompanyName
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as ad
on ca.AddressID = ad.AddressID
where ca.AddressType = 'Main Office'
except
select c.CompanyName
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as ad
on ca.AddressID = ad.AddressID
where ca.AddressType = 'Shipping';

--Write a query that returns the company name of each company that appears in a table of customers with a ‘Main Office’ address, and also in a table of customers with a ‘Shipping’ address.
select c.CompanyName
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as ad
on ca.AddressID = ad.AddressID
where ca.AddressType = 'Main Office'
intersect
select c.CompanyName
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as ad
on ca.AddressID = ad.AddressID
where ca.AddressType = 'Shipping';