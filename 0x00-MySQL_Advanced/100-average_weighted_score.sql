-- SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser that computes and store the average weighted score for a student.
DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
    userId INT

)
BEGIN
    DECLARE averageWeightedScore FLOAT;

    -- Calculate the average weighted score for the user
    SELECT AVG(score * weight) INTO averageWeightedScore
    FROM (
        SELECT s.score, c.weight
        FROM Scores s
        JOIN Courses c ON s.courseId = c.id
        WHERE s.userId = userId
    ) AS weightedScores;

    -- Store the result in the UserScores table
    INSERT INTO UserScores (userId, averageWeightedScore)
    VALUES (userId, averageWeightedScore)
    ON DUPLICATE KEY UPDATE averageWeightedScore = averageWeightedScore;
END$$

DELIMITER ;
