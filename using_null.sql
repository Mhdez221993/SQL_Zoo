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

select teacher.name, COALESCE(dept.name, 'None') from teacher
  left join dept on teacher.dept = dept.id

select COUNT(case when name then 1 else 0 end), COUNT(mobile) from teacher

select dept.name, count(teacher.name) from teacher right join dept on teacher.dept = dept.id
  group by dept.nam