-- show the population of Germany
SELECT population FROM world
  WHERE name = 'Germany'

-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- shows countries with an area of 200,000-350,000 sq. km.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000