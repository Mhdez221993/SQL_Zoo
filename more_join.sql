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