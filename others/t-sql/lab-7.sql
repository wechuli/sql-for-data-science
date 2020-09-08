select *
from SalesLT.vProductModelCatalogDescription;

select * 
from SalesLT.Product;

select SP.ProductID,SP.Name as ProductName,SvPM.Name as ProductModelName,SvPM.Summary
from SalesLT.Product as SP
join SalesLT.vProductModelCatalogDescription as SvPM
on SP.ProductModelID = SvPM.ProductModelID
order by SP.ProductID;

Declare @Colors as Table (Color varchar(15));

Insert into @Colors 
select distinct(Color)
from SalesLT.Product;

select *
from @Colors;

select ProductID,Name,Color
from SalesLT.Product
where Color in (select Color from @Colors);


select *
from SalesLT.Product;

select * 
from dbo.ufnGetAllCategories();

select P.Name,P.ProductID,ACat.ProductCategoryName,ACat.ParentProductCategoryName
from SalesLT.Product as P
join dbo.ufnGetAllCategories() as ACat
on ACat.ProductCategoryID = P.ProductCategoryID
order by P.ProductID;


select  CONCAT(C.CompanyName,'(',FirstName,',',LastName,')') as Customer,SUM(SOH.TotalDue) as TotalRevenue
from SalesLT.Customer as C
left join SalesLT.SalesOrderHeader as SOH
on C.CustomerID = SOH.CustomerID
group by CONCAT(C.CompanyName,'(',FirstName,',',LastName,')')
order by SUM(SOH.TotalDue) desc;

select *
from SalesLT.SalesOrderHeader;

select *
from SalesLT.SalesOrderDetail;
