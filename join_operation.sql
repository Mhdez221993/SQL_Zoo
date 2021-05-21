SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

SELECT id,stadium,team1,team2
  FROM game
  where id = 1012

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  where teamid = 'GER'

select team1, team2, player from game join goal on id = matchid
where player like 'Mario%'

SELECT player, teamid, coach, gtime
  FROM goal join eteam on id = teamid
  WHERE gtime<=10

select mdate, teamname from game 
  join eteam on team1=eteam.id
  where coach = 'Fernando Santos'

select player from game join goal on id = matchid
  where stadium = 'National Stadium, Warsaw'

SELECT distinct player
  FROM game JOIN goal ON matchid = id 
    WHERE team1='GER'  AND teamid <> 'GER' OR team2='GER' AND teamid <> 'GER'

SELECT teamname, count(gtime)
  FROM eteam JOIN goal ON id=teamid
  group by teamname

select stadium, count(gtime) from game
 join goal on id = matchid
 group by stadium


SELECT matchid,mdate, count(gtime) FROM game 
  JOIN goal ON matchid = id
  WHERE (team1 = 'POL' OR team2 = 'POL')
  group by matchid, mdate

select matchid, mdate, count(gtime) from game
  join goal on id = matchid
  where team1 = 'GER' AND teamid = 'GER' or team2 = 'GER' AND teamid = 'GER'
  group by matchid, mdate

SELECT mdate,
  team1,
  sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  sum(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
  FROM game LEFT JOIN goal ON matchid = id
  GROUP BY mdate, team1, team2
  ORDER BY mdate,matchid,team1,team2


-- JOIN Quiz
-- 1. You want to find the stadium where player 'Dimitris Salpingidis' scored. Select the JOIN condition to use:
--  game  JOIN goal ON (id=matchid)

-- 2. You JOIN the tables goal and eteam in an SQL statement. Indicate the list of column names that may be used in the SELECT line:
--  matchid, teamid, player, gtime, id, teamname, coach

-- 3. Select the code which shows players, their team and the amount of goals they scored against Greece(GRE).
SELECT player, teamid, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = "GRE" OR team2 = "GRE")
   AND teamid != 'GRE'
 GROUP BY player, teamid

-- 4. Select the result that would be obtained from this code:
SELECT DISTINCT teamid, mdate
  FROM goal JOIN game on (matchid=id)
 WHERE mdate = '9 June 2012'
-- DEN	9 June 2012
-- GER	9 June 2012

-- 5. Select the code which would show the player and their team for those who have scored against Poland(POL) in National Stadium, Warsaw.
  SELECT DISTINCT player, teamid 
   FROM game JOIN goal ON matchid = id 
  WHERE stadium = 'National Stadium, Warsaw' 
 AND (team1 = 'POL' OR team2 = 'POL')
   AND teamid != 'POL'

-- 6. Select the code which shows the player, their team and the time they scored, for players who have played in Stadion Miejski (Wroclaw) but not against Italy(ITA).
SELECT DISTINCT player, teamid, gtime
  FROM game JOIN goal ON matchid = id
 WHERE stadium = 'Stadion Miejski (Wroclaw)'
   AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))

-- 7. Select the result that would be obtained from this code:
SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON teamid = id
 GROUP BY teamname
HAVING COUNT(*) < 3
-- Netherlands	2
-- Poland	2
-- Republic of Ireland	1
-- Ukraine	2
