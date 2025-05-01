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
    DECLARE user_exists INT DEFAULT 0;
    DECLARE project_exists INT DEFAULT 0;

    -- Check if the user exists
    SELECT COUNT(*) INTO user_exists
    FROM users
    WHERE id = user_id;

    -- Check if the project exists
    SELECT COUNT(*) INTO project_exists
    FROM projects
    WHERE name = project_name;

    -- If the user and project exist, insert the bonus
    IF user_exists > 0 AND project_exists > 0 THEN
        INSERT INTO bonuses (user_id, project_name, score)
        VALUES (user_id, project_name, score);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User or project does not exist';
    END IF;
END$$

DELIMITER ;
