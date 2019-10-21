﻿--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
-- Modified by Elizabeth Koning for CS 262, Fall of 2019
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS GameProperty;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Game;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp,
	completed boolean
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY,
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE Property (
	ID integer PRIMARY KEY,
	name varchar(50),
	colorGroup varchar(50),
	price integer,
	rent integer,
	rent1House integer,
	rent2Houses integer,
	rent3Houses integer,
	rent4Houses integer,
	rentHotel integer,
	houseCost integer
	);

CREATE TABLE PlayerGame (
        gameID integer REFERENCES Game(ID),
        playerID integer REFERENCES Player(ID),
        score integer,
        cash integer,
        location integer REFERENCES Property(ID)
        );


CREATE TABLE GameProperty (
	gameID integer REFERENCES Game(ID),
	propertyID integer REFERENCES Property(ID),
	playerID integer REFERENCES Player(ID),
	houses integer,
	mortgaged boolean
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON GameProperty TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00', TRUE);
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00', TRUE);
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00', TRUE);
INSERT INTO Game VALUES (4, '2019-10-17 18:26:00', FALSE);

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO Property VALUES (0, 'GO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO Property VALUES (1, 'Mediterranean Avenue', 'brown', 60, 2, 10, 30, 90, 160, 250, 50);
INSERT INTO Property VALUES (2, 'Community Chest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO Property VALUES (3, 'Baltic Avenue', 'brown', 80, 4, 20, 60, 180, 320, 450, 50);
INSERT INTO Property VALUES (5, 'Reading Railroad', 'railroad', 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO Property VALUES (6, 'Oriental Avenue', 'lightBlue', 100, 6, 30, 90, 270, 400, 550, 50);
INSERT INTO Property VALUES (8, 'Vermont Avenue', 'lightBlue', 100, 6, 30, 90, 270, 400, 550, 50);
INSERT INTO Property VALUES (9, 'Conneticut Avenue', 'lightBlue', 120, 8, 40, 100, 300, 450, 600, 50);
INSERT INTO Property VALUES (10, 'St. Charles Place', 'lightBlue', 140, 10, 50, 150, 450, 625, 750, 50);

INSERT INTO PlayerGame VALUES (1, 1, 0.00, 0, 0);
INSERT INTO PlayerGame VALUES (1, 2, 0.00, 0, 0);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00, 0, 0);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00, 0, 0);
INSERT INTO PlayerGame VALUES (2, 2, 0.00, 0, 0);
INSERT INTO PlayerGame VALUES (2, 3, 500.00, 0, 0);
INSERT INTO PlayerGame VALUES (3, 2, 0.00, 0, 0);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00, 0, 0);
INSERT INTO PlayerGame VALUES (4, 3, NULL, 400, 1);
INSERT INTO PlayerGame VALUES (4, 2, NULL, 500, 3);
INSERT INTO PlayerGame VALUES (4, 1, NULL, 600, 10);

INSERT INTO GameProperty VALUES (4, 1, 3, 0, FALSE);
INSERT INTO GameProperty VALUES (4, 10, 1, 0, FALSE);
INSERT INTO GameProperty VALUES (4, 3, 2, 0, FALSE);