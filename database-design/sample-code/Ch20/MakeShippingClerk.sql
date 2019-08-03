-- -----------------------------------------------------
-- Create the user.
-- -----------------------------------------------------
CREATE USER ShippingClerk IDENTIFIED BY 'secret';

-- Revoke all privileges for the user.
REVOKE ALL PRIVILEGES, GRANT OPTION FROM ShippingClerk;

-- To prepare and ship orders, the user must see all fields in the Orders,
-- OrderItems, and InventoryItems tables. The clerk must also see the name
-- and address information in the Customers table.
GRANT SELECT ON ShippingDb.Orders TO ShippingClerk;
GRANT SELECT ON ShippingDb.OrderItems TO ShippingClerk;
GRANT SELECT (ItemId, Description, QuantityInStock) ON ShippingDb.InventoryItems TO ShippingClerk;
GRANT SELECT (CustomerId, FirstName, LastName, Street, City, State, Zip, Phone) ON ShippingDb.Customers TO ShippingClerk;

-- The clerk must update the InventoryItems table's QuantityInStock field.
GRANT UPDATE (QuantityinStock) ON ShippingDb.InventoryItems TO ShippingClerk;

-- The clerk must update the Orders table's OrderStatus and ShippedDate fields.
GRANT UPDATE (OrderStatus, ShippedDate) ON ShippingDb.Orders TO ShippingClerk;
