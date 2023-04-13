-- # Football Matches - Tasks

-- Each of the questions/tasks below can be answered using a `SELECT` query. When you find a solution copy it into the code block under the question before pushing your solution to GitHub.

-- 1) Find all the matches from 2017.
SELECT * FROM matches WHERE season = 2017;

-- 2) Find all the matches featuring Barcelona.
SELECT * FROM matches WHERE (hometeam = 'Barcelona' OR awayteam = 'Barcelona');

-- 3) What are the names of the Scottish divisions included?
SELECT name FROM divisions WHERE country = 'Scotland';
-- result: Scottish Premiership, Scottish Championship, Scottish League One

-- 4) Find the value of the `code` for the `Bundesliga` division. Use that code to find out how many matches Freiburg have played in that division. HINT: You will need to query both tables
SELECT code FROM divisions WHERE name = 'Bundesliga'; -- Bundesliga division code: D1

SELECT COUNT(*) FROM matches 
WHERE division_code = 'D1' AND (hometeam = 'Freiburg' OR awayteam = 'Freiburg');
-- result: Freiburg have played 374 matches in the Bundesliga division

-- 5) Find the teams which include the word "City" in their name. 
SELECT DISTINCT hometeam FROM matches WHERE hometeam LIKE '%City%';
-- result: 4 teams which are Bath City, Man City, Edinburgh City and Bristol City

-- 6) How many different teams have played in matches recorded in a French division?
SELECT code FROM divisions WHERE country = 'France'; -- French division code: F1 and F2

SELECT COUNT(DISTINCT hometeam) FROM matches 
WHERE (division_code = 'F1') OR (division_code = 'F2'); 
-- result: 61 different teams

-- 7) Have Huddersfield played Swansea in any of the recorded matches?
SELECT * FROM matches 
WHERE (hometeam = 'Huddersfield' AND awayteam = 'Swansea') OR (hometeam = 'Swansea' AND awayteam = 'Huddersfield');
-- result: yes the two teams have played each other 12 times

-- 8) How many draws were there in the `Eredivisie` between 2010 and 2015?
SELECT code FROM divisions WHERE name = 'Eredivisie'; -- Eredivisie division code: N1

SELECT COUNT(*) FROM matches 
WHERE division_code = 'N1' AND ftr = 'D' AND (season BETWEEN 2010 AND 2015); 
-- result: 431 draws

-- 9) Select the matches played in the Premier League in order of total goals scored from highest to lowest. When two matches have the same total the match with more home goals should come first.
SELECT code FROM divisions WHERE name = 'Premier League'; -- Premier League divison code: E0

SELECT * FROM matches WHERE division_code = 'E0' 
ORDER BY (fthg + ftag) DESC, fthg DESC;

-- 10) In which division and which season were the most goals scored?
SELECT division_code, season, SUM (fthg + ftag) FROM matches 
GROUP BY division_code, season ORDER BY sum DESC LIMIT 1; 

SELECT name FROM divisions WHERE code = 'EC'; 
-- result: National League in 2013 had the most goals with 1592 goals made

