SELECT 2;

SELECT 2+2;

SELECT TRUE;

SELECT NOW();

SELECT * FROM employee;

SELECT nume AS "Nume angajat", prenume AS "Prenume angajat", cnp AS "CNP", NOW() AS "Data raport" FROM employee;

SELECT nume "Nume angajat", prenume "Prenume angajat", cnp "CNP", NOW() "Data raport" FROM employee;

SELECT nume "Nume angajat", prenume "Prenume angajat", cnp "CNP", NOW() "Data raport" FROM employee as e;

SELECT nume, prenume, cnp "CNP", NOW() "Data raport", (id*3)/2 as "Id angajat" FROM employee;


--filtrare rezultate cu WHERE

SELECT * FROM employee WHERE id=3;

SELECT nume, prenume, cnp FROM employee WHERE id=3;

SELECT nume, prenume FROM employee WHERE id=3;

SELECT * FROM  employee WHERE id in (3,5,6);

SELECT * FROM  employee WHERE id > 3;

SELECT * FROM  employee WHERE id >= 3;

SELECT * FROM  employee WHERE id <= 3;

SELECT * FROM  employee WHERE id=3 AND prenume='Ionescu';

SELECT * FROM  employee WHERE id=3 OR prenume='Ionescu';

SELECT * FROM  employee WHERE id !=3 OR prenume='Ionescu';
SELECT * FROM  employee WHERE id <> 3 OR prenume='Ionescu';

SELECT * FROM  employee WHERE id not in (3,5,6);

SELECT * FROM  employee WHERE nume in ('Vasile');
SELECT * FROM  employee WHERE nume not in ('Vasile');

SELECT * FROM  employee WHERE (nume='George' and id>2) or (id=5) AND adresa='Mun. Timisoara, Jud. Timis';

SELECT * FROM  employee WHERE nume LIKE('%r%');

SELECT * FROM  employee WHERE nume LIKE('C%');

SELECT * FROM  employee WHERE adresa LIKE('%Ar%');

SELECT nume "Nume angajat", prenume "Prenume angajat", cnp "CNP", NOW() "Data raport" FROM employee as e
WHERE nume='George';

SELECT nume "Nume angajat", e.prenume "Prenume angajat", cnp "CNP", NOW() "Data raport" FROM employee as e
WHERE e.nume='George';

SELECT employee.nume AS "Nume angajat", employee.prenume AS "Prenume angajat", employee.cnp AS "CNP", NOW() AS "Data raport" FROM employee;

SELECT e.nume AS "Nume angajat", e.prenume AS "Prenume angajat", e.cnp AS "CNP", NOW() AS "Data raport" FROM employee;

CREATE TABLE employee_extended AS
SELECT nume AS "Nume angajat", prenume AS "Prenume angajat", cnp AS "CNP", NOW() AS "Data raport" FROM employee;

CREATE VIEW employee_extended_view AS
SELECT nume AS "Nume angajat", prenume AS "Prenume angajat", cnp AS "CNP", NOW() AS "Data raport" FROM employee;

SELECT *, now() as "Acum" FROM  drona;

SELECT model, timp_zbor FROM
(
	select *, now() as "Acum" FROM  drona
) as temp;


