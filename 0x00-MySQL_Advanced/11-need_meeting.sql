-- This script creates a view need_meeting that lists all students
-- that have a score under 80 (strict) and no last_meeting or more than 1 month.

CREATE VIEW `need_meeting` AS
SELECT `students`.`name`
FROM `students`
WHERE `students`.`score` < 80
AND (`students`.`last_meeting` IS NULL
OR `students`.`last_meeting` < DATE_SUB(NOW(), INTERVAL 1 MONTH));
