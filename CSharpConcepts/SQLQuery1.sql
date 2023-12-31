CREATE DATABASE GAMEHUB;

USE GAMEHUB; -- Replace YourDatabaseName with the actual name of your database
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

SELECT DB_NAME() AS CurrentDatabaseName;



CREATE TABLE PLAYERS (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    PSWD VARCHAR(20) NOT NULL
);

CREATE TABLE GAMES (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    DESCRIPTION VARCHAR(500) NOT NULL
);

CREATE TABLE BATTLEHISTORY (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    PID INT NOT NULL,
    GID INT NOT NULL,
    SCORE INT,
    WITHP INT,
    FOREIGN KEY (PID) REFERENCES PLAYERS(ID),
    FOREIGN KEY (GID) REFERENCES GAMES(ID),
    FOREIGN KEY (WITHP) REFERENCES PLAYERS(ID)
);

INSERT INTO PLAYERS (NAME, PSWD) VALUES
('Ashish yadav', '123'),
('vijay yadav', '123'),
('Roshan yadav', '123');

select * from PLAYERS;

INSERT INTO GAMES (NAME, DESCRIPTION) VALUES
('Tic Tac Toe', 'Tic Tac Toe: A classic two-player game where players take turns marking X or O on a grid to form a line of three symbols horizontally, vertically, or diagonally.'),
('Rock Paper Scissor', 'Rock Paper Scissors: A hand game of chance where rock crushes scissors, scissors cuts paper, and paper covers rock.');

select * from GAMES;

INSERT INTO BATTLEHISTORY (PID, GID, SCORE, WITHP) VALUES
(1, 1, 5, 2),
(2, 2, 0, 1),
(3, 1, 5, 1);

INSERT INTO BATTLEHISTORY (PID, GID, SCORE, WITHP) VALUES(1, 2, 5, 2);

select * from BATTLEHISTORY;


SELECT P.NAME AS PlayerName, OP.NAME AS OpponentName, G.NAME AS GameName, BH.SCORE AS Score
FROM BATTLEHISTORY BH
JOIN PLAYERS P ON P.ID = BH.PID
JOIN PLAYERS OP ON OP.ID = BH.WITHP
JOIN GAMES G ON BH.GID = G.ID;



SELECT COUNT(*) FROM PLAYERS;

INSERT INTO PLAYERS (NAME, PSWD) VALUES('Tarun Yadav', '123');

SELECT * FROM PLAYERS WHERE NAME LIKE '%h%';


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'GETNAMEHAVINGCHARACTER')
    DROP PROCEDURE GETNAMEHAVINGCHARACTER
GO

CREATE PROCEDURE 
	GETNAMEHAVINGCHARACTER 
	@char VARCHAR(20)
AS
	SELECT * FROM PLAYERS WHERE NAME LIKE '%' + @char + '%'
GO

exec GETNAMEHAVINGCHARACTER @char='h';

select * from PLAYERS where name='Roshan Yadav' and pswd='1234';

SELECT CASE 
WHEN EXISTS(SELECT 1 FROM PLAYERS WHERE name = 'Roshan Yadav' AND pswd = '123')
THEN 1 
ELSE 0 
END;