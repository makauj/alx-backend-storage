-- SQL script that creates a stored procedure 'AddBonus' that adds a new correction for a student.
-- The procedure takes the following parameters:user_id, project_name, score
-- The procedure checks if the user exists in the database and if the project exists.
DELIMITER $$

CREATE PROCEDURE Addbonus (
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score INT
)
BEGIN
    INSERT INTO projects (name)
    SELECT project_name FROM DUAL
    WHERE NOT EXISTS (
        SELECT 1
        FROM projects
        WHERE name = project_name
    );
    INSERT INTO corrections (user_id, project_id, score)
    SELECT(user_id, (SELECT id FROM projects WHERE name = project_name), score);
END$$

DELIMITER ;
