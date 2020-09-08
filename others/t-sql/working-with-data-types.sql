-- CAST
select CAST(ProductID as varchar(5)) + ':' + Name as ProductName
from Production.Product; -- casting the product id into a name

-- CONVERT
select CONVERT(varchar(5),ProductID) + ':' + Name as ProductName 
from Production.Product;

--Convert Dates
select SellStartDate,
CONVERT(nvarchar(30),SellStartDate) as Convertedate,
CONVERT(nvarchar(30),SellStartDate,126) as ISO8601FormatDate
from Production.Product;


--Try to CAST
select Name , CAST(Size as Integer) as NumericSize
from Production.Product; --this will fail as any string appearing will throw an error, we can use TRY/CAST though to get around this problem

select Name, TRY_CAST(Size as Integer) as NumericSize
from Production.Product; --will return null where it can't cast as required

