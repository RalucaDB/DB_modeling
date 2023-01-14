--CREATE VIEW
CREATE VIEW first_view AS 
SELECT * FROM employee;

--SELECT FROM VIEW
SELECT * FROM first_view;

create view angajati_proiecte_view as
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id;

--SELECT FROM PREVIOUS VIEW
SELECT * FROM angajati_proiecte_view;

SELECT nume_angajat, cnp FROM angajati_proiecte_view;

--EQUIVALENT WITH PREVIOUS
SELECT nume_angajat, cnp FROM
(
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id
) AS t;

SELECT * FROM angajati_proiecte_view
INNER JOIN employee
on angajati_proiecte_view.cnp=employee.cnp;

SELECT av.*,e FROM angajati_proiecte_view AS av
INNER JOIN employee AS e
on av.cnp=e.cnp;
--sau
SELECT * FROM
(
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id
) AS av
INNER JOIN employee AS e
on av.cnp=e.cnp;

CREATE TABLE GENERATED AS
SELECT av.*,e.adresa FROM angajati_proiecte_view AS av
INNER JOIN employee AS e
on av.cnp=e.cnp;
--SAU
CREATE TABLE GENERATED AS
SELECT av.*,e.adresa FROM angajati_proiecte_view AS av
(
SELECT e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id
) AS av
INNER JOIN employee AS e
on av.cnp=e.cnp;

--view for insert
INSERT INTO generated
SELECT av.*,e.adresa FROM angajati_proiecte_view AS av
INNER JOIN employee AS e
on av.cnp=e.cnp;

SELECT * FROM public.generated;

--view for update
UPDATE GENERATED SET adresa='Mun. Timisoara, Jud. Timis' WHERE nume_angajat='Vasile';

--view for update
UPDATE GENERATED SET adresa='Mun. Arad, Jud. Arad' 
WHERE nume_angajat=(
					SELECT DISTINCT nume_angajat FROM angajati_proiecte_view WHERE cnp='1234567890123'
	          		);
--equivalent with previous
UPDATE GENERATED SET adresa='Mun. Arad, Jud. Arad' 
WHERE nume_angajat IN
					SELECT nume_angajat FROM angajati_proiecte_view WHERE cnp='1234567890123'
	          		);
--equivalent with previous
UPDATE GENERATED SET adresa='Mun. Arad, Jud. Arad' 
WHERE nume_angajat =(
SELECT nume_angajat FROM 
(
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id
) AS t
WHERE t.cnp='1234567890123'
);

--DELETE FROM GENERATED
DELETE FROM generated WHERE nume_angajat IN(
					SELECT nume_angajat FROM angajati_proiecte_view WHERE cnp='1234567890123'
					);
					
CREATE TABLE GENERATED AS
SELECT av.*,e.adresa FROM angajati_proiecte_view AS av
INNER JOIN employee AS e
on av.cnp=e.cnp;

SELECT * FROM generated;

SELECT * FROM drona_senzori;
SELECT * FROM drona;

CREATE VIEW drona_cu_senzori AS
SELECT d.*, ds.senzori_id FROM drona AS d
LEFT JOIN drona_senzori AS ds
ON d.id=ds.drona_id;
SELECT * FROM drona_cu_senzori;

SELECT model,COUNT(*) senzori FROM drona_cu_senzori
GROUP BY model;

SELECT * FROM drona_senzori;

SELECT model, nume FROM drona_cu_senzori AS ds
INNER JOIN senzori AS s
ON ds.senzori_id=s.id;

SELECT DISTINCT model, nume FROM drona_cu_senzori AS ds
LEFT JOIN operator_drona_projects AS odp 
ON ds.id=odp.id
LEFT JOIN projects AS p
ON odp.projects_id=p.id;

SELECT * FROM drona_cu_senzori;

create view operatori_pentru_drone as
select e.nume, e.prenume, e.cnp, e.id, od.drona_id, p.nume as project from employee as e
left join operator_drona as od
on e.id=od.employee_id
left join operator_drona_projects as odp
on od.id=odp.operator_drona_id
left join projects as p
on odp.projects_id=p.id;

select * from operatori_pentru_drone;

SELECT DISTINCT nume, COUNT(*) nr_licente FROM operatori_pentru_drone
GROUP BY drona_id, nume;

CREATE TABLE proiecte_cu_drona AS 
SELECT * FROM operatori_pentru_drone WHERE project IS NOT NULL;

INSERT INTO proiecte_cu_drona  
SELECT * FROM operatori_pentru_drone WHERE project IS NULL;

select * from proiecte_cu_drona;


SELECT DISTINCT id FROM operatori_pentru_drone WHERE project IS NULL;
DELETE FROM proiecte_cu_drona WHERE id IN (SELECT DISTINCT id FROM operatori_pentru_drone WHERE project IS NULL
);














