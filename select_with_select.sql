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