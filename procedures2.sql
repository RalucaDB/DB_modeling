CREATE OR REPLACE PROCEDURE AddDrones(
model_p VARCHAR(50),
timp_zbor_p TIME,
inaltime_zbor_p INTEGER,
sarcina_utila_p INTEGER
)
LANGUAGE plpgsql
AS 
$$
BEGIN
INSERT INTO drona(model, timp_zbor, inaltime_zbor, sarcina_utila) VALUES (model_p, timp_zbor_p, inaltime_zbor_p, sarcina_utila_p);
END
$$;

CREATE OR REPLACE PROCEDURE UpdateDroneModel(
old_name VARCHAR(50),
new_name VARCHAR(50)
)
LANGUAGE plpgsql
AS 
$$
BEGIN
UPDATE drona
SET model=new_name
WHERE model=old_name;
END
$$;

CREATE OR REPLACE PROCEDURE UpdateProjectDates(
ID_p INTEGER,
start_date_p DATE,
end_date_p DATE
)
LANGUAGE plpgsql
AS 
$$
BEGIN
UPDATE projects
SET start_date=start_date_p, end_date=end_date_p
WHERE id=id_p;
END
$$;

CREATE OR REPLACE PROCEDURE DeleteProjectsfromrange(
start_date_p DATE,
end_date_p DATE
)
LANGUAGE plpgsql
AS 
$$
BEGIN
DELETE FROM projects
WHERE start_date>=start_date_p AND end_date<=end_date_p;
END
$$;

CREATE OR REPLACE FUNCTION GetProjectsCount()
RETURNS BIGINT
LANGUAGE SQL
AS
$$
SELECT COUNT(*) AS nr_proiecte FROM projects;
$$;

CREATE OR REPLACE FUNCTION GetProjectsInfoforID(proiect_id_p INTEGER)
RETURNS projects
LANGUAGE SQL
AS
$$
SELECT * FROM projects WHERE id=proiect_id_p;
$$;

CREATE OR REPLACE PROCEDURE AddNewEntryToGenerated(CNP_p VARCHAR(13))
LANGUAGE plpgsql
AS
$$
BEGIN
INSERT INTO generated
SELECT av.*,e.adresa FROM 
(
	select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
	inner join operator_drona
	on e.id=operator_drona.employee_id
	inner join operator_drona_projects
	on operator_drona.id=operator_drona_projects.operator_drona_id
	inner join projects p
	on operator_drona_projects.projects_id=p.id
	) AS av
	inner join employee as e
	on av.cnp=Cnp_p
	WHERE e.cnp=CNP_p;
END
$$;


CREATE OR REPLACE PROCEDURE UpdateName(cnp_p VARCHAR(13), adresa_p VARCHAR(30))
LANGUAGE plpgsql
AS
$$
BEGIN
UPDATE generated SET adresa = 'Mun. Timisoara, Jud. Timis' 
WHERE nume_angajat IN (
					SELECT nume_angajat FROM angajati_proiecte_view WHERE cnp =cnp_p
					);
END
$$;

CALL UpdateName ('1234567890123', 'Sibiu');

SELECT * FROM generated;

CREATE OR REPLACE PROCEDURE DeleteFromGenerated(cnp_p VARCHAR(13))
LANGUAGE plpgsql
AS
$$
BEGIN
DELETE FROM generated WHERE nume_angajat IN(
					SELECT nume_angajat FROM angajati_proiecte_view WHERE cnp=cnp_p
					);
END
$$;

CALL DeleteFromGenerated ('1234567890123');

CREATE TABLE drona_history AS
SELECT * FROM drona_history;

DELETE FROM drona_history;
ALTER TABLE drona_history ADD column changed_on timestamp;

SELECT * FROM drona_history;

CREATE OR REPLACE FUNCTION drona_history_changes()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS
	$$
	BEGIN
	IF OLD.model<>NEW.model THEN
		INSERT INTO drona_history(id, model, timp_zbor, inaltime_zbor, sarcina_utila)
		VALUES (OLD.id, OLD.model, OLD.timp_zbor, OLD.inaltime_zbor, OLD.sarcina_utila,now());
	END IF;
	RETURN NEW;
	END;
	$$;
	
CREATE TRIGGER change_detection
BEFORE UPDATE 
ON drona
FOR EACH ROW
EXECUTE PROCEDURE drona_history_changes();

SELECT * FROM drona_history;
SELECT * FROM drona;

UPDATE drona SET model ='My new drona model' where id=7;



