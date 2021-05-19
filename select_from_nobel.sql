-- SELECT from Nobel Tutorial

SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1950

SELECT winner
  FROM nobel
 WHERE yr = 1962 AND subject = 'Literature'

SELECT yr, subject FROM nobel
  WHERE winner = 'Albert Einstein'

SELECT winner FROM nobel
  WHERE subject = 'Peace' AND yr >= 2000

SELECT yr, subject, winner FROM nobel 
  WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989

SELECT * FROM nobel
  WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')


SELECT winner FROM nobel
  WHERE winner LIKE 'John%'

SELECT yr, subject, winner FROM nobel
  WHERE subject = 'Physics' AND yr = 1980 OR subject = 'Chemistry' AND yr = 1984

SELECT yr, subject, winner FROM nobel
  WHERE yr = 1980 AND subject NOT IN('Chemistry', 'Medicine')

SELECT yr, subject, winner FROM nobel
  WHERE subject = 'Medicine' AND yr < 1910 OR subject = 'Literature' AND yr >= 2004

SELECT * FROM nobel WHERE winner = 'PETER GRÜNBERG'

SELECT * FROM nobel WHERE winner = 'EUGENE O''NEI'

SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%' ORDER BY yr DESC, winner


SELECT winner, subject
  FROM nobel
  WHERE yr=1984
  ORDER BY CASE WHEN subject IN ('Chemistry', 'Physics') THEN 1 ELSE 0 END, subject, winner

SELECT winner, subject
  FROM nobel
  WHERE yr=1984
  ORDER BY CASE WHEN subject IN ('Physics', 'Chemistry') THEN 1 ELSE 0 END, subject, winner;

-- Nobel Quiz
-- 1. Pick the code which shows the name of winner's names beginning with C and ending in n
SELECT winner FROM nobel
  WHERE winner LIKE 'C%' AND winner LIKE '%n'

-- 2. Select the code that shows how many Chemistry awards were given between 1950 and 1960
SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960

-- 3. Pick the code that shows the amount of years where no Medicine awards were given
SELECT COUNT(DISTINCT yr) FROM nobel
  WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

-- 4. Select the result that would be obtained from the following code:
SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%'

-- Medicine	Sir John Eccles
-- Medicine	Sir Frank Macfarlane Burnet


-- 5. Select the code which would show the year when neither a Physics or Chemistry award was given
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))

-- 6. Select the code which shows the years when a Medicine award was given but no Peace or Literature award was
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')

-- 7. Pick the result that would be obtained from the following code:
 SELECT subject, COUNT(subject) 
   FROM nobel 
  WHERE yr ='1960' 
  GROUP BY subject


-- Chemistry	1
-- Literature	1
-- Medicine	2
-- Peace	1
-- Physics	1
