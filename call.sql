INSERT INTO drona(model, timp_zbor, inaltime_zbor, sarcina_utila) VALUES ('Agras T10','2:10:10', 70, 2)

CALL AddDrones ('Agras T11','2:10:10', 70, 2);

SELECT * FROM projects;

CALL UpdateDroneModel ('Agras T10','Drotest');

CALL UpdateProjectDates (4,'2023-01-13','2023-12-15');

CALL DeleteProjectsfromrange ('2023-01-12','2023-12-16');

DELETE FROM projects
WHERE start_date>='2023-01-12' AND end_date<='2023-12-17';

SELECT GetProjectsCount();
--SAU
SELECT * FROM GetProjectsCount();

SELECT * FROM GetProjectsInfoforID(5);
--SAU
SELECT GetProjectsInfoforID(5);
SELECT nume, description FROM GetProjectsInfoforID(5);

SELECT * FROM generated;

Call AddNewEntryToGenerated('1234567890123');

CALL UpdateName ('1234567890123', 'Sibiu');

CALL DeleteFromGenerated ('1234567890123');


