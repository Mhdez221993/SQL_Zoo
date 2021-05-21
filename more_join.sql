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

-- JOIN Quiz 2

-- 1. Select the statement which lists the unfortunate directors of the movies which have caused financial loses (gross < budget)
SELECT JOIN(name FROM actor, movie
       ON actor.id:director WHERE gross < budget)
 GROUP BY name

-- 2. Select the correct example of JOINing three tables
SELECT *
  FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid

-- 3. Select the statement that shows the list of actors called 'John' by order of number of movies in which they acted
SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC

-- 4. Select the result that would be obtained from the following code:
 SELECT title 
   FROM movie JOIN casting ON (movieid=movie.id)
              JOIN actor   ON (actorid=actor.id)
  WHERE name='Paul Hogan' AND ord = 1
--   Table-B
-- "Crocodile" Dundee
-- Crocodile Dundee in Los Angeles
-- Flipper
-- Lightning Jack

-- 5. Select the statement that lists all the actors that starred in movies directed by Ridley Scott who has id 351
SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
  WHERE ord = 1 AND director = 351

-- 6. There are two sensible ways to connect movie and actor. They are:
-- link the director column in movies with the primary key in actor
-- connect the primary keys of movie and actor via the casting table

-- 7. Select the result that would be obtained from the following code:
SELECT title, yr 
   FROM movie, casting, actor 
   WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3
-- Table-B
-- A Bronx Tale	1993
-- Bang the Drum Slowly	1973
-- Limitless	2011
