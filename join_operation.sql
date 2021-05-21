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