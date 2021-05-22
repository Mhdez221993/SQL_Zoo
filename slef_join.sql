-- Self join

select count(name) from stops

select id from stops where name = 'Craiglockhart'

select id, name from stops join route on id = stop
  where num = 4 AND company = 'LRT'
  order by pos

SELECT company, num, COUNT(*)
  FROM route WHERE stop=149 OR stop=53
  GROUP BY company, num
  having count(*) = 2