--LAB 8
--Exercises 1
--Retrieve a list of all the games, ordered by date with the most recent game coming first.
--SELECT *
--FROM Game
--ORDER BY time DESC
--;

--Retrieve all the games that occurred in the past week.
--SELECT *
--FROM Game
--WHERE time > (NOW() - interval '7 days')
--ORDER BY time DESC
--;

--Retrieve a list of players who have (non-NULL) names.
--SELECT *
--FROM Player
--WHERE name IS NOT NULL
--;

--Retrieve a list of IDs for players who have some game score larger than 2000.
--SELECT DISTINCT playerID
--FROM PlayerGame
--WHERE score > 2000
--;

--Retrieve a list of players who have GMail accounts.
--SELECT emailAddress
--FROM Player
--Where Player.emailAddress LIKE '%gmail%'
--;

--Exercises 2
--Retrieve all “The King”’s game scores in decreasing order.
--SELECT PlayerGame.score
--FROM Player, PlayerGame
--WHERE Player.ID = PlayerGame.playerID
--AND Player.name = 'The King'
--ORDER BY score DESC
--;

--Retrieve the name of the winner of the game played on 2006-06-28 13:20:00.
--SELECT Player.name AS winner
--FROM Player, PlayerGame, Game
--WHERE Game.ID = PlayerGame.gameID
--AND Player.ID = PlayerGame.playerID
--AND PlayerGame.score = (
--  SELECT MAX(PlayerGame.score)
--  FROM PlayerGame, Game
--  WHERE Game.inprogress = FALSE
--  AND PlayerGame.gameID = Game.ID
--  AND Game.time = '2006-06-28 13:20:00'
--)

--So what does that P1.ID < P2.ID clause do in the last example query?
--If we run the query without this clause, we would display duplicates twice.
--In this case we check if the P1 id is less than the P2 id, so that we don't
--display duplicates

--The query that joined the Player table to itself seems rather contrived. Can
--you think of a realistic situation in which you’d want to join a table to itself?
--If you want to compare either the same or different fields in the same table,
--two instances of the same table must be created in order for SQL to be able
--to compare. For example, if I want to compare the salaries of two employees on
--the same table
