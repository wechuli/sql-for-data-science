
-- Null numbers = 0
select Name,ISNULL(TRY_CAST(Size as Integer),0)  as NumericSize --we can put functions inside other functions
from Production.Product;

-- Null strings  = blank string

select ProductNumber, ISNULL(Color,'') + ',' + ISNULL(Size,'') as ProductDetails
from Production.Product;

--Multi color = NULL set null if a certain value is found

select Name,NULLIF(Color,'Multi') as SingleColor
from Production.Product;

-- find first non-null date
select Name, coalesce(DiscontinuedDate,SellEndDate,SellStartDate) as LastActivity
from Production.Product;

-- searched case
select Name,
	case
		when SellEndDate is null then 'On Sale'
		else 'Discontinued'
	end as Salesstatus
from Production.Product;

-- Simple case
select Name,
	case Size
		when 'S' then 'Small'
		when 'M' then 'Medium'
		when 'L' then 'Large'
		when 'XL' then 'Extra-Large'
		else isnull(size,'n/a')
	end as ProductSize
from Production.Product;