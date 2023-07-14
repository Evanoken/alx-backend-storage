-- This script creates a trigger that resets the attribute valid_email
-- only when the email has been changed.

-- Create the trigger
DELIMITER $$
CREATE TRIGGER `valid_email`
BEFORE UPDATE ON `users`
-- The trigger will be executed for each row
FOR EACH ROW
-- The trigger will be executed only if the email has been changed
BEGIN
    IF `NEW`.`email` != `OLD`.`email` THEN
        SET `NEW`.`valid_email` = 0;
    END IF;
END$$
DELIMITER ;
