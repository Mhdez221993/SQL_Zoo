select name from teacher where dept is null

SELECT teacher.name, dept.name
  FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
  FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
  FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

select name, COALESCE(mobile, '07986 444 2266') from teacher