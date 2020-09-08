select *
from SalesLT.Product;

select *
from SalesLT.SalesOrderDetail;

select ProductID,avg(UnitPrice) as AverageUnitPrice
from SalesLT.SalesOrderDetail
group by ProductID;

select avg(UnitPrice)
from SalesLT.SalesOrderDetail;

select ProductID,Name,ListPrice
from SalesLT.Product
where ListPrice > (select avg(UnitPrice) from SalesLT.SalesOrderDetail);

select P.ProductID,P.Name,P.ListPrice
from SalesLT.Product as P
where ListPrice > 100 and ListPrice > 
(select avg(UnitPrice) 
from SalesLT.SalesOrderDetail as SOH
where  SOH.ProductID = P.ProductID
having avg(UnitPrice) < 100)
order by P.ListPrice asc;

select ProductID, avg(UnitPrice)
from SalesLT.SalesOrderDetail
group by ProductID;

select P.ProductID,P.Name,P.ListPrice
from SalesLT.Product as P
where P.ProductID in (
select SOH.ProductID
from SalesLT.SalesOrderDetail as SOH
where P.ListPrice > 100 and UnitPrice <100
)
order by P.ListPrice;


select P.Name,P.ProductID,P.ListPrice,P.StandardCost,
(select avg(UnitPrice) 
from SalesLT.SalesOrderDetail as SOH
 where P.ProductID = SOH.ProductID
 ) as AverageUnitPrice
from SalesLT.Product as P
order by P.ListPrice;

select P.Name,P.ProductID,P.ListPrice,P.StandardCost,
(select avg(UnitPrice) 
from SalesLT.SalesOrderDetail as SOH
 where P.ProductID = SOH.ProductID
 having avg(UnitPrice) < P.StandardCost 
 ) as AverageUnitPrice
from SalesLT.Product as P
order by P.ListPrice;

--Find products where the average selling price is less than cost
SELECT ProductID, Name, StandardCost, ListPrice,
(SELECT AVG(UnitPrice)
 FROM SalesLT.SalesOrderDetail AS SOD
 WHERE P.ProductID = SOD.ProductID) AS AvgSellingPrice
FROM SalesLT.Product AS P
WHERE StandardCost >
(SELECT AVG(UnitPrice)
 FROM SalesLT.SalesOrderDetail AS SOD
 WHERE P.ProductID = SOD.ProductID)
ORDER BY P.ProductID;