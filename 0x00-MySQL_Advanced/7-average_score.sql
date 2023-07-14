-- This script creates a stored procedure ComputeAverageScoreForUser
-- that computes and updates the average score for a given user.

-- The procedure ComputeAverageScoreForUser takes 1 argument:
-- - The user_id

DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(
    IN user_id INT
)
BEGIN
    DECLARE average_score FLOAT;
    
    -- Get the average score
    SELECT AVG(`score`) INTO average_score
    FROM `corrections`
    GROUP BY `corrections`.`user_id`
    HAVING `corrections`.`user_id` = user_id;

    -- Update users table
    UPDATE `users`
    SET `average_score` = average_score
    WHERE `id` = user_id;
END $$
DELIMITER ;
