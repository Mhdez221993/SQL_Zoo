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