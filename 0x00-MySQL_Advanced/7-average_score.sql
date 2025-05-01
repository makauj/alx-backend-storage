-- SQL script that creates a stored procedure ComputeAverageScoreForUser
--that computes and store the average score for a student.
--Note: An average score can be a decimal
DELIMITER $

CREATE PROCEDURE ComputeAverageScoreForUser (IN user_id INT)
BEGIN
    SELECT AVG (score) INTO average_score FROM corrections WHERE corrections.user_id = user_id;
    UPDATE users SET users.average_score = average_score WHERE id = user_id;
END$

DELIMITER ;
