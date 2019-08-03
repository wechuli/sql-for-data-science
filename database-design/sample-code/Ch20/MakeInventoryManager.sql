CREATE USER InventoryManager IDENTIFIED BY 'secret';

-- Revoke all privileges for the user.
REVOKE ALL PRIVILEGES, GRANT OPTION FROM InventoryManager;

-- Grant needed privileges.
GRANT SELECT (OrderId, OrderStatus) ON ShippingDb.Orders TO InventoryManager;
GRANT UPDATE (OrderStatus) ON ShippingDb.Orders TO InventoryManager;
GRANT SELECT (OrderId, ItemId, Quantity) ON ShippingDb.OrderItems TO InventoryManager;

GRANT INSERT, DELETE ON ShippingDb.InventoryItems TO InventoryManager;
GRANT UPDATE (Description, Price, QuantityInStock) ON ShippingDb.InventoryItems TO InventoryManager;
GRANT SELECT ON ShippingDb.OrderStatuses TO InventoryManager;
