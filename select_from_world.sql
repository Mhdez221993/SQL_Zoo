-- SELECT from WORLD Tutorial

SELECT name, continent, population FROM world

SELECT name
  FROM world
 WHERE population > 200000000

SELECT name, gdp/population FROM world
  where population > 200000000;

SELECT name, population/1000000 FROM world
  WHERE continent = 'South America'

SELECT name, population FROM world
  WHERE name IN ('France', 'Germany', 'Italy')

SELECT name FROM world
  WHERE name LIKE '%United%'

SELECT name, population, area FROM world
  WHERE area > 3000000 OR population > 250000000

SELECT name, population, area FROM world
  WHERE area > 3000000 AND population < 250000000 OR 
  area < 3000000 AND population > 250000000

SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000, 2) FROM world
  WHERE continent = 'South America'