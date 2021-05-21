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

select id from movie
  where title = 'Casablanca'

select name from actor
  join casting on id = actorid
  where movieid= 11768

select name from actor
  join casting on id = actorid
  join movie on movie.id = movieid
  where title = 'Alien'

select title from movie
  join casting on movie.id = movieid
  join actor on actor.id = actorid
  where name = 'Harrison Ford'

select title from movie
  join casting on movie.id = movieid
  join actor on actor.id = actorid
  where name = 'Harrison Ford' AND ord <> 1

select title, name from movie
  join casting on movie.id = movieid
  join actor on actor.id = actorid
  where ord = 1 AND yr = 1

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
  WHERE name='Rock Hudson'
  GROUP BY yr
  HAVING COUNT(title) > 2

SELECT title, name FROM movie join casting on movie.id = movieid
      join actor on actor.id = actorid
  WHERE movie.id IN(
    select movieid from casting where actorid IN (
    select id from actor where name = 'Julie Andrews'))
  and ord=1

SELECT actor.name
   FROM actor JOIN casting ON actor.id = casting.actorid
   WHERE ord = 1
   GROUP BY name
   HAVING COUNT(name) >= 15
   ORDER BY name

select title, count(actorid) from movie join casting on movie.id = movieid join actor on 
  actor.id = actorid
  where yr = 1978
  group by title
  order by count(actorid) DESC, titl  

select name from actor join casting on id = actorid 
  where actorid in (
    select movieid from casting where actorid in (
      select id from actor where name = 'Art Garfunkel'))

select name from actor join casting on id = actorid 
  where movieid in (
    select movieid from casting where actorid in (
      select id from actor where name = 'Art Garfunkel')) AND name <> 'Art Garfunkel'