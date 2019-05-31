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



