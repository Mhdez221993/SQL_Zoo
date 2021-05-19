-- SELECT basics

-- show the population of Germany
SELECT population FROM world
  WHERE name = 'Germany'

-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- shows countries with an area of 200,000-350,000 sq. km.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000



-- SELECT Quiz
SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000

SELECT name, population
  FROM world
  WHERE name LIKE 'Al%'

SELECT name FROM world
  WHERE name LIKE '%a' AND name LIKE '%l'

SELECT name,length(name)
  FROM world
  WHERE length(name)=5 and continent='Europe'

SELECT name,length(name)
  FROM world
  WHERE length(name)=5 and continent='Europe'

SELECT name, area*2 FROM world WHERE population = 64000

SELECT name, area, population
  FROM world
  WHERE area > 50000 AND population < 10000000