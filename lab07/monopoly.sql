--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp,
	inprogress boolean
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE Property (
	ID integer PRIMARY KEY,
	name varchar(50),
	color varchar(50),
	price integer,
	rent integer,
	rentHouse1 integer,
	rentHouse2 integer,
	rentHouse3 integer,
	rentHouse4 integer,
	rentHotel integer,
	houseCost integer
	);

CREATE TABLE GameProperty (
	gameID integer REFERENCES Game(ID),
	propertyID integer REFERENCES Property(ID),
	playerID integer REFERENCES Player(ID),
	houses integer,
	mortgaged boolean
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer,
	cash integer,
	location integer REFERENCES Property(ID)
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00', TRUE);
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00', TRUE);
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00', TRUE);

INSERT INTO Player(ID, emailAddress) VALUES (1, 'mrv47@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO Property VALUES (0, 'GO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO Property VALUES (5, 'Pennsylvania Railroad', 'railroad', 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO Property VALUES (9, 'Massachusetts Avenue', 'lightBlue', 16, 30, 90, 270, 400, 550, 600, 50);

INSERT INTO PlayerGame VALUES (1, 1, 0, 1050, 0);
INSERT INTO PlayerGame VALUES (1, 2, 50, 950, 5);
INSERT INTO PlayerGame VALUES (1, 3, 360, 900, 8);
INSERT INTO PlayerGame VALUES (2, 1, 400, 580, 4);
INSERT INTO PlayerGame VALUES (2, 2, 50, 800, 13);
INSERT INTO PlayerGame VALUES (2, 3, 500, 650, 11);
INSERT INTO PlayerGame VALUES (3, 2, NULL, 260, 3);
INSERT INTO PlayerGame VALUES (3, 3, NULL, 580, 2);

INSERT INTO GameProperty VALUES (3, 5, 2, 0, FALSE);
INSERT INTO GameProperty VALUES (3, 9, 0, 1, FALSE);
