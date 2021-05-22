-- Self join

-- 1.How many stops are in the database.
select count(name) from stops

-- 2.Find the id value for the stop 'Craiglockhart'
select id from stops where name = 'Craiglockhart'

-- 3.Give the id and the name for the stops on the '4' 'LRT' service.
select id, name from stops join route on id = stop
  where num = 4 AND company = 'LRT'
  order by pos

-- 4.The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
  FROM route WHERE stop=149 OR stop=53
  GROUP BY company, num
  having count(*) = 2

-- 5.Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes. Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
  FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  WHERE a.stop=53 and b.stop = 149
