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

SELECT name, ROUND(gdp/population, -3) FROM world
  WHERE gdp > 1000000000000

SELECT name, capital
  FROM world
  WHERE LEN(name) = LEN(capital)

SELECT name, capital
  FROM world
  WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital

SELECT name
  FROM world
  WHERE name LIKE '%a%' AND name LIKE '%e%' AND
  name LIKE '%i%' AND name LIKE '%o%' AND
  name LIKE '%u%' AND name NOT LIKE '% %'


-- BBC QUIZ

SELECT name
  FROM world
  WHERE name LIKE 'U%'

SELECT population
  FROM world
  WHERE name = 'United Kingdom'

 SELECT continent 
   FROM world 
   WHERE name = 'France'

SELECT name, population
  FROM world
  WHERE continent IN ('Europe', 'Asia')

SELECT name FROM world
  WHERE name IN ('Cuba', 'Togo')

SELECT name FROM world
 WHERE continent = 'South America'
   AND population > 40000000