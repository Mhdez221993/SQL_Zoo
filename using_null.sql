select name from teacher where dept is null

SELECT teacher.name, dept.name
  FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
  FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)