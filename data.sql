CREATE TABLE Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    joindate DATE NOT NULL DEFAULT CURRENT_DATE(),
    password VARCHAR(255) NOT NULL,
    points INT DEFAULT 0
);

CREATE TABLE Deeds (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    pointvalue INT DEFAULT 0,
    location VARCHAR(100)
);

DELIMITER $$
CREATE FUNCTION complete_deed(userId INT, deedId INT)
RETURNS BOOL
BEGIN
    DECLARE deedPoints INT;
    SELECT pointvalue INTO deedPoints FROM Deeds WHERE id = deedId;
    UPDATE Users
    SET points = points + deedPoints
    WHERE id = userId;
    RETURN TRUE;
END$$
DELIMITER;