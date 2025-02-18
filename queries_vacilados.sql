INSERT INTO ciudades (nombre)
VALUES
     ('barranquilla'),
     ('bogota'),
     ('cartagena');


INSERT INTO conjuntos (nombre, ciudad_id)
VALUES
     ('Torres de Yatedigo', 1),
     ('Altamar Volqueta', 1),
     ('San Vacacino', 1),
	 ('Torres del Prado', 2),
     ('Torres de Chonca', 2),
     ('Bogota Towers', 2),
	 ('Cartacho Buildings', 3),
     ('Torres de balurdeces', 3),
     ('San Germán', 3);

SELECT * FROM ciudades;

-- Deleting because I ran it three times by mistake
-- DELETE FROM ciudades WHERE id IN (4, 5, 6, 7, 8, 9);

SELECT * FROM conjuntos;

SELECT conjuntos.id, conjuntos.nombre, ciudades.nombre AS ciudad
FROM conjuntos
JOIN ciudades ON conjuntos.ciudad_id = ciudades.id;

-- CONJUNTOS DE CIUDADES QUE COMIENZAN POR "B"
SELECT conjuntos.id, conjuntos.nombre, ciudades.nombre AS ciudad
FROM conjuntos
JOIN ciudades ON conjuntos.ciudad_id = ciudades.id
WHERE ciudades.nombre LIKE 'b%';

-- CUÁNTOS CONJUNTOS HAY EN BARRANQUILLA
SELECT COUNT(*) AS conteo
FROM conjuntos
JOIN ciudades ON conjuntos.ciudad_id = ciudades.id
WHERE ciudades.nombre = 'barranquilla';


-- CUÁNTOS CONJUNTOS HAY POR CADA CIUDAD
SELECT ciudades.nombre AS ciudad, COUNT(*) AS cantidad
FROM conjuntos
JOIN ciudades ON conjuntos.ciudad_id = ciudades.id
GROUP BY ciudad;