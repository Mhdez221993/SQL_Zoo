SELECT SUM(population)
FROM world

select distinct continent from world

select sum(gdp) from world where continent = 'Africa'

select count(name) from world where area > 1000000

select sum(population) from world where name IN ('Estonia', 'Latvia', 'Lithuania')

select continent, count(name) from world
group by continent

select continent, count(name) from world
where population > 10000000
group by continent

select continent from world x
where 100000000 < ALL(select sum(population) from world y where x.continent = y.continent)
group by continent

-- SUM and COUNT Quiz

-- 1. Select the statement that shows the sum of population of all countries in 'Europe'
 SELECT SUM(population) FROM bbc WHERE region = 'Europe'

-- 2. Select the statement that shows the number of countries with population smaller than 150000
 SELECT COUNT(name) FROM bbc WHERE population < 150000

-- 3. Select the list of core SQL aggregate functions
AVG(), COUNT(), MAX(), MIN(), SUM()

-- 4. Select the result that would be obtained from the following code:
SELECT region, SUM(area)
   FROM bbc 
  WHERE SUM(area) > 15000000 
  GROUP BY region
-- No result due to invalid use of the WHERE function
 SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

-- 5. Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'
 SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

-- 6. Select the statement that shows the medium population density of each region
  SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

-- 7. Select the statement that shows the name and population density of the country with the largest population
 SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

-- 8. Pick the result that would be obtained from the following code:
 SELECT region, SUM(area) 
   FROM bbc 
  GROUP BY region 
  HAVING SUM(area)<= 20000000

-- Table-D
-- Americas	732240
-- Middle East	13403102
-- South America	17740392
-- South Asia	9437710
