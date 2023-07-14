-- This script creates a stored procedure AddBonus that
-- adds a new correction for a student.

-- The procedure AddBonus takes 3 arguments:
-- - The user_id
-- - The project_name
-- - The score

DELIMITER $$
CREATE PROCEDURE AddBonus(
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score INT
)
BEGIN
    DECLARE project_id INT;
    
    -- Get the project_id from the project_name if it exists
    IF `project_name` NOT IN (SELECT `name` FROM `projects`) THEN
        INSERT INTO `projects` (`name`) VALUES (project_name);
        SET project_id = LAST_INSERT_ID();
    ELSE
        SELECT `id` INTO project_id FROM `projects` WHERE `name` = project_name;
    END IF;

    -- Insert the new correction
    INSERT INTO `corrections` (`user_id`, `project_id`, `score`)
    VALUES (user_id, project_id, score);
END $$
DELIMITER ;
