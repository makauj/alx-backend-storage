-- SQL script that creates a stored procedure ComputeAverageScoreForUser
--that computes and store the average score for a student.
--Note: An average score can be a decimal
DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser (
    IN user_id INT,
    in project_name VARCHAR(255),
    IN score INT
)
BEGIN
    INSERT INTO projects (name)
    SELECT project_name FROM DUAL
    WHERE NOT EXISTS (
        SELECT *
        FROM projects
        WHERE name = project_name
        LIMIT 1
    );
    INSERT INTO corrections (user_id, project_name, score)
    VALUES(user_id, (SELECT name FROM projects WHERE name = project_name), score);
END$$

DELIMITER ;
