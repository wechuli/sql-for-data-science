-- retrieve all customers
select * from 
SalesLT.Customer;


-- Create a list of all customercontactnames that includes the title, first name, middle name (if any), last name, and suffix (if any) of all customers.
select isnull(Title,'') +
 isnull (FirstName,'') + ' ' +
 isnull (MiddleName,'') + ' '+
 isnull(LastName,'') + ' '+
 isnull (Suffix,'') as ContactNames
from SalesLT.Customer;

select isnull(Title,'') + FirstName as CustomerName, Phone,SalesPerson
from SalesLT.Customer;

-- You have been asked to provide a list of all customer companies 
-- in the format <CustomerID> : <CompanyName> -for example, 78: Preferred Bikes
select cast(CustomerID as varchar) + ':' + CompanyName as CustomerCompany
from SalesLT.Customer;


select *
from SalesLT.SalesOrderHeader;

-- The sales order number and revision number in the format 
--<Order Number> (<Revision>) –for example SO71774 (2).
select cast(SalesOrderNumber as varchar) + '(' + cast(RevisionNumber as varchar) + ')'
from SalesLT.SalesOrderHeader

-- The order date converted to ANSI standard format (yyyy.mm.dd –for example 2015.01.31)
select CONVERT(nvarchar(50),OrderDate,102) as OrderDate
from SalesLT.SalesOrderHeader;

select FirstName + ' '+isnull(MiddleName,'')+' '+LastName as customerName
from SalesLT.Customer;

update SalesLT.Customer
set EmailAddress = NULL
where CustomerID % 7 = 1

-- using coalesce
select CustomerID,coalesce(EmailAddress,Phone) as PrimaryContact
from SalesLT.Customer


UPDATE SalesLT.SalesOrderHeader
SET ShipDate = NULL
WHERE SalesOrderID > 71899;

select *
from SalesLT.SalesOrderHeader


select SalesOrderID, OrderDate,
case 
	when ShipDate is null then 'Awaiting Shipment'	
	else 'Shipped'
	end as ShippingStatus
	
from SalesLT.SalesOrderHeader;