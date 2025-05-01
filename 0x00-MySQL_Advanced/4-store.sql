-- SQL script that creates a trigger that decreases the quantity of an item
-- after adding a new order
CREATE TRIGGER decrease_item_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    DECLARE item_id INT;
    DECLARE item_quantity INT;

    -- Get the item ID from the new order
    SET item_id = NEW.item_id;

    -- Get the current quantity of the item
    SELECT quantity INTO item_quantity FROM items WHERE id = item_id;

    -- Decrease the quantity of the item by 1
    UPDATE items SET quantity = item_quantity - 1 WHERE id = item_id;
END;
