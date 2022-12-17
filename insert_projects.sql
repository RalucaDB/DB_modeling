INSERT INTO projects(nume, start_date, end_date, description, clients_id)
VALUES
	('Scanare LiDAR canalizare', NOW(), NOW(), 'Scanare conducte canal Aquatim si modelare 3D', 1),
	('Multifoto spectral Mun Timisoara', '2022-01-01', '2023-10-10', 'Realizare ortofoto pt Primaria TM, doar hiperspectral fara termic', 2),
	('Retea digitala a rutelor de transport', '2022-05-01', '2023-12-10', 'Realizare harta digitala a rutelor mijloacelor de transport din Mun Timisoara', 3);
	
	
	
SELECT * FROM projects;
SELECT * FROM clients;