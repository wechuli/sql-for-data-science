select  ProductID,UPPER(Name) as ProductName,ROUND(Weight,0) as AprroxWeight
from SalesLT.Product;

select *
from SalesLT.Product;

select  ProductID,UPPER(Name) as ProductName,ROUND(Weight,0) as AprroxWeight,datename(mm, SellStartDate) as SellStartMonth,YEAR(SellStartDate) as SellStartYear
from SalesLT.Product;

select  ProductID,UPPER(Name) as ProductName,ROUND(Weight,0) as AprroxWeight,datename(mm, SellStartDate) as SellStartMonth,YEAR(SellStartDate) as SellStartYear,LEFT(ProductNumber,2) as ProductType
from SalesLT.Product;


select  ProductID, UPPER(Name) as ProductName,ROUND(Weight,0) as AprroxWeight,datename(mm, SellStartDate) as SellStartMonth,YEAR(SellStartDate) as SellStartYear,LEFT(ProductNumber,2) as ProductType,Size
from SalesLT.Product
where ISNUMERIC(Size) = 1;


select Cu.CompanyName,Soh.TotalDue, rank() over (order by Soh.TotalDue desc ) as Rank
from SalesLT.Customer as Cu
join SalesLT.SalesOrderHeader Soh
on Cu.CustomerID = Soh.CustomerID;


select *
from SalesLT.Product;

select *
from SalesLT.SalesOrderDetail;


select pr.Name,sum(sod.LineTotal) as TotalRevenue
from SalesLT.Product as pr
join SalesLT.SalesOrderDetail as sod
on pr.ProductID = sod.ProductID
group by pr.Name
order by TotalRevenue asc;


select pr.Name,sum(sod.LineTotal) as TotalRevenue
from SalesLT.Product as pr
join SalesLT.SalesOrderDetail as sod
on pr.ProductID = sod.ProductID
where pr.ListPrice > 1000
group by pr.Name
order by TotalRevenue asc;



select pr.Name,sum(sod.LineTotal) as TotalRevenue
from SalesLT.Product as pr
join SalesLT.SalesOrderDetail as sod
on pr.ProductID = sod.ProductID
where pr.ListPrice > 1000
group by pr.Name
having sum(sod.LineTotal) > 20000
order by TotalRevenue asc;



