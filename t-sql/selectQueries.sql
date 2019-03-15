select * from Production.Product;


select Name,ListPrice from Production.Product where ListPrice > 0 order by ListPrice asc;

select Name as Product,ListPrice * 0.9 as SalePrice
 from Production.Product;

select ProductID,Name,ListPrice,StandardCost,ListPrice-StandardCost as Margin -- we can do calculations when returning the results
from Production.Product;

select ProductID,Name,Color+Size,Color
--NULL values are not treated as empty string , you can't add numbers to a string
from Production.Prod



