USE ShippingDb;

-- Get address information for customer 1.
SELECT FirstName, LastName, Street, City, State, Zip
FROM Customers
WHERE CustomerId = 1;

-- Select order information for OrderId 101.
SELECT FirstName, LastName, OrderDate, ShippedDate, OrderStatus
FROM Customers, Orders
WHERE OrderId = 101
  AND Customers.CustomerId = Orders.CustomerId;

-- Select order detail for OrderId 101.
SELECT SequenceNumber, Description, Quantity, Price
FROM OrderItems, InventoryItems
WHERE OrderId = 101
  AND OrderItems.ItemId = InventoryItems.ItemId
ORDER BY SequenceNumber;

-- List the inventory.
SELECT *
FROM InventoryItems;

-- Remove items from inventory for OrderId 101.
UPDATE InventoryItems, OrderItems
SET InventoryItems.QuantityInStock = InventoryItems.QuantityInStock - OrderItems.Quantity
WHERE InventoryItems.ItemId = OrderItems.ItemId
  AND OrderId = 101;

-- Update the OrderStatus and ShippedDate.
UPDATE Orders
SET OrderStatus = 'Shipped',
    ShippedDate = CURRENT_DATE()
WHERE OrderId = 101;

-- Try something illegal.
SELECT CreditCardNumber
FROM Customers
WHERE CustomerId = 1;

-- Try something else illegal.
UPDATE Orders
SET OrderDate = CURRENT_DATE()
WHERE OrderId = 101;

-- Select the modified data.
-- Select order information for OrderId 101.
SELECT FirstName, LastName, OrderDate, ShippedDate, OrderStatus
FROM Customers, Orders
WHERE OrderId = 101
  AND Customers.CustomerId = Orders.CustomerId;

-- List the inventory.
SELECT *
FROM InventoryItems;
