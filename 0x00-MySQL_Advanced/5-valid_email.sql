-- SQL script that creates a trigger that resets the attribute valid_email
-- only when the email has been changed.
CREATE TRIGGER valid_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    -- Check if the email has changed
    IF OLD.email <> NEW.email THEN
        -- Reset the valid_email attribute to NULL
        SET NEW.valid_email = NULL;
    END IF;
END;
