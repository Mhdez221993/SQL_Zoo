SELECT SUM(population)
FROM world

select distinct continent from world

select sum(gdp) from world where continent = 'Africa'

select count(name) from world where area > 1000000