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