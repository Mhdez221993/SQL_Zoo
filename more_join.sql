SELECT id, title
 FROM movie
 WHERE yr=1962

select yr from movie
  where title = 'Citizen Kane'

select id, title, yr from movie
  where title LIKE '%Star Trek%'
  order by yr

select actorid from actor
  join casting on actor.id = casting.actorid
  where name = 'Glenn Close'
  group by actorid