SELECT * FROM projects;

--inner join
SELECT * FROM clients
INNER JOIN projects
ON clients.id=projects.clients_id;

--left join
SELECT * FROM projects
LEFT OUTER JOIN clients
ON projects.clients_id=clients.id;

--right join
SELECT * FROM projects
RIGHT OUTER JOIN clients
ON projects.clients_id=clients.id;

--full join
SELECT * FROM employee
FULL JOIN operator_drona
ON employee.id=operator_drona.employee_id;

SELECT * FROM operator_drona_projects;

SELECT * FROM clients
INNER JOIN operator_drona
ON employee.id=operator_drona.employee_id
INNER JOIN operator_drona_projects
ON operator_drona.id=operator_drona_projects.operator_drona_id
INNER JOIN projects
ON operator_drona_projects.operator_drona_id=projects.id;

SELECT * FROM employee
INNER JOIN operator_drona
ON employee.id=operator_drona.employee_id
LEFT JOIN operator_drona_projects
ON operator_drona.id=operator_drona_projects.operator_drona_id
RIGHT JOIN projects
ON operator_drona_projects.operator_drona_id=projects.id;

SELECT * FROM employee
LEFT JOIN operator_drona
ON employee.id=operator_drona.employee_id
LEFT JOIN operator_drona_projects
ON operator_drona.id=operator_drona_projects.operator_drona_id
LEFT JOIN projects
ON operator_drona_projects.operator_drona_id=projects.id;

SELECT * FROM employee
RIGHT JOIN operator_drona
ON employee.id=operator_drona.employee_id
RIGHT JOIN operator_drona_projects
ON operator_drona.id=operator_drona_projects.operator_drona_id
RIGHT JOIN projects
ON operator_drona_projects.operator_drona_id=projects.id;

SELECT * FROM employee
RIGHT JOIN operator_drona
ON employee.id=operator_drona.employee_id
RIGHT JOIN operator_drona_projects
ON operator_drona.id=operator_drona_projects.operator_drona_id
RIGHT JOIN projects
ON operator_drona_projects.operator_drona_id=projects.id;


SELECT * FROM clients;
SELECT * FROM projects;

--ALIAS & FILTRARE
SELECT c.nume nume_client, p.nume nume_proiect, p.start_date from clients as c
INNER JOIN projects as p
ON c.id=p.clients_id;

SELECT c.nume nume_client, p.nume nume_proiect, p.start_date from clients as c
LEFT JOIN projects as p
ON c.id=p.clients_id;

SELECT c.nume nume_client, p.nume nume_proiect, p.start_date from clients as c
RIGHT JOIN projects as p
ON c.id=p.clients_id;

SELECT c.nume "Nume client", p.nume "Nume proiect", p.start_date "Start date" from clients as c
RIGHT JOIN projects as p
ON c.id=p.clients_id;

SELECT COUNT (*) FROM projects
RIGHT OUTER JOIN clients
ON projects.clients_id=clients.id;

SELECT * FROM employee
INNER JOIN operator_drona
ON employee.id=operator_drona.employee_id
INNER JOIN operator_drona_projects
ON operator_drona.id=operator_drona_projects.operator_drona_id
INNER JOIN projects
ON operator_drona_projects.operator_drona_id=projects.id
WHERE employee.sex='M';

SELECT * FROM operator_drona
INNER JOIN 
(
	SELECT * FROM employee WHERE sex='M'
) e
ON e.id=operator_drona.employee_id
INNER JOIN operator_drona_projects
ON operator_drona.id=operator_drona_projects.operator_drona_id
INNER JOIN projects
ON operator_drona_projects.operator_drona_id=projects.id;

select * from employee
inner join operator_drona
on employee.id=operator_drona.employee_id and employee.sex='M'
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects
on operator_drona_projects.projects_id=projects.id;

CREATE TABLE angajati_proiecte_masculin as
SELECT e.nume "Nume angajat", e.prenume "Prenume angajat", e.cnp "CNP", p.nume AS "Nume proiect", p.start_date "Start date", p.end_date "end date" FROM employee AS e
INNER JOIN operator_drona
ON e.id=operator_drona.employee_id
INNER JOIN operator_drona_projects
ON operator_drona.id=operator_drona_projects.operator_drona_id
INNER JOIN projects p
ON operator_drona_projects.operator_drona_id=p.id
WHERE e.sex='M';

CREATE TABLE angajati_proiecte_masculin_view as
SELECT e.nume "Nume angajat", e.prenume "Prenume angajat", e.cnp "CNP", p.nume AS "Nume proiect", p.start_date "Start date", p.end_date "end date" FROM employee AS e
INNER JOIN operator_drona
ON e.id=operator_drona.employee_id
INNER JOIN operator_drona_projects
ON operator_drona.id=operator_drona_projects.operator_drona_id
INNER JOIN projects p
ON operator_drona_projects.operator_drona_id=p.id
WHERE e.sex='M';

SELECT * FROM angajati_proiecte_masculin_view;

SELECT COUNT(*), p.start_date "Start date" FROM employee AS e
RIGHT JOIN operator_drona
ON e.id=operator_drona.employee_id
RIGHT JOIN operator_drona_projects
ON operator_drona.id=operator_drona_projects.operator_drona_id
RIGHT JOIN projects p
ON operator_drona_projects.operator_drona_id=p.id
WHERE e.sex='M'
GROUP BY start_date
HAVING p.start_date >'2021-01-01';


