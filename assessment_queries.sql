-- Create a new table in tennis_db called “matches." Create columns to match the headers in the matches.csv file. Import the CSV into the new table. 
-- Write a query to display all of the matches where Serena Williams won. 
-- How many matches in the dataset has Serena Williams won?

select count(*)
from matches
where winner_name LIKE 'Serena%';

-- Using the tennis_db from questions 1 and 2, write a query that returns the count of players for each dominant hand group (i.e. right, left).
-- What is the distribution of the players’ dominant hands?

select count(*) --distinct hand
from players
group by hand;

-- Still using the tennis_db, write a query that returns the number of WINS for each dominant hand.
-- What is the distribution of wins for each dominant hand? 
-- HINT: This will require you to join two tables together.

select  count(*) --distinct hand
from matches, players
where matches.winner_id = players.player_id
group by hand;
