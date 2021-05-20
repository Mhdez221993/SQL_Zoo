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