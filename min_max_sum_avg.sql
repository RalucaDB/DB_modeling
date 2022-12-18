ALTER TABLE employee
ADD COLUMN age INTEGER NOT NULL DEFAULT 0;

SELECT AVG(age)::INTEGER AS medie FROM employee;

SELECT COUNT(*) AS nr_angajati FROM  employee;
SELECT COUNT(id) AS nr_angajati FROM  employee;
SELECT COUNT(distinct id) AS nr_angajati FROM  employee;
SELECT COUNT(nume) AS nr_angajati FROM  employee;
SELECT COUNT(distinct nume) AS nr_angajati FROM  employee;

SELECT MIN(age) AS varsta_minima FROM  employee;
SELECT MAX(age) AS varsta_maxima FROM  employee;

SELECT SUM(age)/COUNT(*) AS medie FROM  employee;

SELECT AVG(age)::INTEGER AS medie_varsta, COUNT(*) AS nr_angajati,
	MIN(age) AS varsta_minima, MAX(age) AS varsta_maxima, SUM(age) AS total
FROM employee;

SELECT COUNT(*) AS nr_angajati FROM  employee WHERE age<50;
SELECT COUNT(*) AS nr_angajati FROM  employee WHERE age<50 AND sex='F';

SELECT * FROM  employee;

SELECT sex,COUNT(*) FROM  employee
WHERE age<50
GROUP BY sex;

SELECT COUNT(*), age FROM  employee
GROUP BY sex, age
HAVING age<50;

SELECT sex,COUNT(id) FROM  employee
WHERE age < 50 AND sex='F'
GROUP BY sex;
--HAVING COUNT(id)>1;

SELECT sex,COUNT(id) FROM  employee
WHERE age < 50 
GROUP BY sex
HAVING COUNT(id)>1 AND sex='F';

SELECT * FROM operator_drona;

--inner join
SELECT * FROM employee
INNER JOIN operator_drona
ON employee.id=operator_drona.employee_id;

--left join
SELECT * FROM employee
LEFT OUTER JOIN operator_drona
ON employee.id=operator_drona.employee_id;

--right join
SELECT * FROM employee
RIGHT OUTER JOIN operator_drona
ON employee.id=operator_drona.employee_id;

--full join
SELECT * FROM employee
FULL JOIN operator_drona
ON employee.id=operator_drona.employee_id;




