-- SQL script that creates a stored procedure 'AddBonus' that adds a new correction for a student.
-- The procedure takes the following parameters:user_id, project_name, score
-- The procedure checks if the user exists in the database and if the project exists.
DELIMITER //
CREATE PROCEDURE AddBonus(
	IN user_id INTEGER,
	IN project_name VARCHAR(255),
	IN score INTEGER
)
BEGIN
    INSERT INTO projects (name)
    SELECT project_name from DUAL 
    WHERE NOT EXISTS (SELECT * FROM projects WHERE name=project_name LIMIT 1);

    INSERT INTO corrections (user_id, project_id, score)
    VALUES(user_id, (SELECT id from projects WHERE name=project_name), score);
END //
DELIMITER ;
