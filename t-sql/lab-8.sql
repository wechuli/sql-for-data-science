select a.CountryRegion,a.StateProvince,sum(soh.TotalDue) as Revenue
from SalesLT.Address as a
join SalesLT.CustomerAddress as ca 
on a.AddressID = ca.AddressID
join SalesLT.Customer as c 
on ca.CustomerID = c.CustomerID
join SalesLT.SalesOrderHeader as soh
on c.CustomerID = soh.CustomerID
group by a.CountryRegion,a.StateProvince
order by a.CountryRegion,a.StateProvince;

select a.CountryRegion,a.StateProvince,sum(soh.TotalDue) as Revenue
from SalesLT.Address as a
join SalesLT.CustomerAddress as ca 
on a.AddressID = ca.AddressID
join SalesLT.Customer as c 
on ca.CustomerID = c.CustomerID
join SalesLT.SalesOrderHeader as soh
on c.CustomerID = soh.CustomerID
-- group by a.CountryRegion,a.StateProvince
group by grouping sets (
a.CountryRegion,a.StateProvince,()
)
order by a.CountryRegion,a.StateProvince;


select a.CountryRegion,a.StateProvince,sum(soh.TotalDue) as Revenue
from SalesLT.Address as a
join SalesLT.CustomerAddress as ca 
on a.AddressID = ca.AddressID
join SalesLT.Customer as c 
on ca.CustomerID = c.CustomerID
join SalesLT.SalesOrderHeader as soh
on c.CustomerID = soh.CustomerID
-- group by a.CountryRegion,a.StateProvince
group by rollup (
a.CountryRegion,a.StateProvince
)
order by a.CountryRegion,a.StateProvince;

select a.CountryRegion,a.StateProvince,sum(soh.TotalDue) as Revenue,choose(GROUPING_ID(a.CountryRegion,a.StateProvince) + 1,'State_Level','Country_Level','Country_level','Total') as Level
from SalesLT.Address as a
join SalesLT.CustomerAddress as ca 
on a.AddressID = ca.AddressID
join SalesLT.Customer as c 
on ca.CustomerID = c.CustomerID
join SalesLT.SalesOrderHeader as soh
on c.CustomerID = soh.CustomerID
-- group by a.CountryRegion,a.StateProvince
group by rollup (
a.CountryRegion,a.StateProvince
)
order by a.CountryRegion,a.StateProvince;

SELECT a.CountryRegion, a.StateProvince,
IIF(GROUPING_ID(a.CountryRegion) = 1 AND GROUPING_ID(a.StateProvince) = 1, 'Total', IIF(GROUPING_ID(a.StateProvince) = 1, a.CountryRegion + ' Subtotal', a.StateProvince + ' Subtotal')) AS Level,
SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca
ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c
ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh
ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince)
ORDER BY a.CountryRegion, a.StateProvince;


SELECT a.CountryRegion, a.StateProvince, a.City,
CHOOSE (1 + GROUPING_ID(a.CountryRegion) + GROUPING_ID(a.StateProvince) + GROUPING_ID(a.City), a.City + ' Subtotal', a.StateProvince + ' Subtotal', a.CountryRegion + ' Subtotal', 'Total') AS Level,
SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca
ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c
ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh
ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince, a.City)
ORDER BY a.CountryRegion, a.StateProvince, a.City;


select *
from SalesLT.Address;