UPDATE employee SET  adresa='Mun. Arad, Jud. Arad';

UPDATE employee SET  adresa='Mun. Timisoara, Jud. Timis' WHERE id=1;
UPDATE employee SET  adresa='Mun. Timisoara, Jud. Timis' WHERE id IN (1,3,6);

UPDATE employee SET  adresa='Mun. Buzias, Jud. Timis' WHERE nume='Ceapa' AND sex='F';


UPDATE drona SET timp_zbor='01:30:00' WHERE model='Agras T10';

UPDATE drona 
SET timp_zbor='02:00:00', 
	inaltime_zbor=50, 
	sarcina_utila=2 
WHERE model='Matrice 30';

UPDATE employee SET  adresa='Mun. Timisoara, Jud. Timis' WHERE id IN (1,3,6);

SELECT * FROM employee where id in(
SELECT employee_id FROM operator_drona WHERE drona_id=1
);


SELECT * FROM employee WHERE id IN --STEP 3
(
	SELECT employee_id FROM operator_drona WHERE drona_id=  --STEP 2
	(
		SELECT id FROM drona WHERE model='Agras T10' --STEP 1
	)
);

UPDATE employee SET  adresa='Mun. Sibiu, Jud. Sibiu' WHERE id IN --step 3 update
(
	SELECT employee_id FROM operator_drona WHERE drona_id= --step 2
	(
		SELECT id FROM drona WHERE model='Agras T10' --step 1
	)
);

DELETE FROM operator_drona WHERE employee_id IN 
(
	SELECT employee_id FROM operator_drona WHERE drona_id= 
	(
		SELECT id FROM drona WHERE model='Agras T10' 
	)
);


SELECT * FROM drona;


