-- SQL script that creates a stored procedure ComputeAverageScoreForUser
--that computes and store the average score for a student.
--Note: An average score can be a decimal
DELIMITER $

CREATE PROCEDURE ComputeAverageScoreForUser (IN user_id INT)
BEGIN
    DECLARE average_score DECIMAL(5,2);  -- Declare the local variable to store the average score

    -- Calculate the average score for the user
    SELECT AVG(score) INTO average_score
    FROM corrections
    WHERE user_id = user_id;

    -- If no score exists, set average_score to 0
    IF average_score IS NULL THEN
        SET average_score = 0;
    END IF;

    -- Update the user's average_score in the users table
    UPDATE users
    SET average_score = average_score
    WHERE id = user_id;
END$

DELIMITER ;
