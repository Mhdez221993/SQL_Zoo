-- SELECT within SELECT Tutorial

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name FROM WORLD
  WHERE continent = 'Europe' AND 
  gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom')

SELECT name, continent FROM world
  WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina','Australia'))

SELECT name, population FROM world
  WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND
  population < (SELECT population FROM world WHERE name = 'Poland')

SELECT name, 
  CONCAT(ROUND(100 * population/(SELECT population FROM world WHERE name = 'Germany')),'%')
  FROM world
  WHERE continent = 'Europe'

SELECT name FROM world
  WHERE gdp > ALL
   (SELECT gdp FROM world
   WHERE continent = 'Europe' AND gdp IS NOT NULL)

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND population>0)

Select continent, name
  From world x
  Where name <= ALL (select y.name from world y where x.continent=y.continent)
  ORDER BY continent

Select continent, MIN(name) AS country
From world
GROUP BY continent

SELECT name, continent, population FROM world 
  WHERE not continent in 
  (select distinct continent from world where population > 25000000)

SELECT x.name, x.continent FROM world x
  WHERE 
    population/3 > ALL
      (SELECT population FROM world y WHERE x.continent = y.continent AND x.name != y.name)


-- Nested SELECT Quiz

-- 1. Select the code that shows the name, region and population of the smallest country in each region
 SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)


-- 2. Select the code that shows the countries belonging to regions with all populations over 50000
 SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)

-- 3. Select the code that shows the countries with a less than a third of the population of the countries around it
SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)

-- 4. Select the result that would be obtained from the following code:
SELECT name FROM bbc
 WHERE population >
       (SELECT population
          FROM bbc
         WHERE name='United Kingdom')
   AND region IN
       (SELECT region
          FROM bbc
         WHERE name = 'United Kingdom')
-- Table-D
-- France
-- Germany
-- Russia
-- Turkey


-- 5. Select the code that would show the countries with a greater GDP than any country in Africa (some countries may have NULL gdp values).
SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')

-- 6. Select the code that shows the countries with population smaller than Russia but bigger than Denmark
SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')

-- 7. >Select the result that would be obtained from the following code:
SELECT name FROM bbc
 WHERE population > ALL
       (SELECT MAX(population)
          FROM bbc
         WHERE region = 'Europe')
   AND region = 'South Asia'

-- Table-B
-- Bangladesh
-- India
-- Pakistan