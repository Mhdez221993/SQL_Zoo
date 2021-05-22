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

-- 6.The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'London Road'

-- 7.Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
select r1.company, r1.num from route r1 join route r2 on r1.company = r2.company AND r1.num = r2.num
  join stops sta on sta.id = r1.stop
  join stops stb on stb.id = r2.stop
  where r1.stop = 115 and r2.stop=137
  group by r1.company, r1.num


-- 8.Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
select r1.company, r1.num from route r1 join route r2 on r1.company = r2.company AND r1.num = r2.num
  join stops sta on sta.id = r1.stop
  join stops stb on stb.id = r2.stop
  where sta.name = 'Craiglockhart' and stb.name='Tollcross'
  group by r1.company, r1.num

-- 9.Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services.
select sta.name, r1.company, r1.num from route r1 join route r2 on r1.company = r2.company AND r1.num = r2.num
  join stops sta on sta.id = r1.stop
  join stops stb on stb.id = r2.stop
  where stb.name = 'Craiglockhart' and r1.company='LRT'
  group by sta.name, r1.company, r1.num
  order by r1.num, r1.pos

-- 10.Find the routes involving two buses that can go from Craiglockhart to Lochend. Show the bus no. and company for the first bus, the name of the stop for the transfer, and the bus no. and company for the second bus.
SELECT S.num, S.company, S.name, T.num, T.company 
FROM 
    (SELECT DISTINCT a.num, a.company, sb.name 
     FROM route a JOIN route b ON (a.num = b.num and a.company = b.company) 
                  JOIN stops sa ON sa.id = a.stop 
                  JOIN stops sb ON sb.id = b.stop 
     WHERE sa.name = 'Craiglockhart' AND sb.name <> 'Craiglockhart'
)S

JOIN

    (SELECT x.num, x.company, sy.name 
     FROM route x JOIN route y ON (x.num = y.num and x.company = y.company) 
                  JOIN stops sx ON sx.id = x.stop 
                  JOIN stops sy ON sy.id = y.stop 
     WHERE sx.name = 'Lochend' AND sy.name <> 'Lochend'
    )T

ON (S.name = T.name)
ORDER BY S.num, S.name, T.num

  