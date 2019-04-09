 -- combine each row from the first table with each row from the second table
 -- all possible combinations output

 select  p.Name,c.FirstName,c.LastName,c.Phone
 from SalesLT.Product as p
 cross join SalesLT.Customer as c;