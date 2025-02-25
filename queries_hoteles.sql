INSERT INTO hoteles (nombre, direccion, clasificacion)
VALUES
     ('hotel windsor', 'calle 84 # 46-07', 4),
     ('hotel sonesta', 'calle 106 # 50-11', 5),
     ('hotel majestic', 'cra 53 # 54-41', 3),
     ('hotel marriott', 'calle 1A # 25-40', 5),
     ('hotel hilton', 'cra 53 # 100-86', 4);
     
SELECT * FROM hoteles;

     
INSERT INTO clientes (nombre, telefono, correo)
VALUES	
	 ('franco armani', '3013674088', 'armanif@hotmail.com'),
     ('guillermo ochoa', '3004567890', 'guillermito@gmail.com'),
     ('juana de arco', '300343340', 'dearcojuana@hotmail.com'),
     ('zohan dvir', '3188457543', 'zohantheboss@gmail.com'),
     ('alejandro calero', '3242347654', 'charsito@hotmail.com');
	

INSERT INTO habitaciones (numero, tipo, precio, hotel_id)
VALUES	
	('205', 'doble', '360000', 20),
    ('810', 'doble', '490000', 16),
	('715', 'presidencial', '640000', 16),
    ('314', 'sencilla', '589000', 19),
	('467', 'doble', '654000', 17),
	('101', 'doble', '730000', 20),
	('389', 'presidencial', '856000', 20),
	('001', 'sencilla', '300000', 16),
	('510', 'doble', '530000', 17),
    ('890', 'presidencial', '1000000', 19);
    
SELECT * FROM habitaciones;


INSERT INTO reservas (fecha_inicio, fecha_fin, client_id, hotel_id, habitacion_id)
VALUES	
	('2021-06-14', '2021-06-21', 4, 16, 3),
    ('2022-08-10', '2022-09-10', 1, 20, 1),
    ('2023-04-18', '2023-04-26', 1, 17, 5),
    ('2024-12-10', '2024-12-22', 3, 20, 7),
    ('2025-01-08', '2025-01-17', 4, 19, 4);
	
 SELECT * FROM reservas;
 

-- Consultar todos los clientes   
SELECT * FROM clientes;

    
-- Consultar todos los hoteles cuya calificación sea mayor a 3
SELECT * FROM hoteles
WHERE hoteles.clasificacion > 3;

    
 -- Consultar todas los habitaciones individuales
 SELECT habitaciones.numero, habitaciones.tipo,hoteles.nombre AS nombre_hotel
 FROM habitaciones
 JOIN hoteles ON habitaciones.hotel_id = hoteles.id
 WHERE habitaciones.tipo = 'sencilla';

 
  -- Consultar todas las habitaciones presidenciales cuyo precio sea mayor a $200,000
 SELECT habitaciones.numero, habitaciones.tipo,habitaciones.precio,hoteles.nombre AS nombre_hotel
 FROM habitaciones
 JOIN hoteles ON habitaciones.hotel_id = hoteles.id
 WHERE habitaciones.precio > 200000 AND habitaciones.tipo = 'presidencial';

 
  -- Consultar todas las reservas de Zohan Dvir
 SELECT fecha_inicio, fecha_fin,client_id,hotel_id,habitacion_id,hoteles.nombre AS nombre_hotel,clientes.nombre AS nombre_cliente
 FROM reservas
 JOIN hoteles ON reservas.hotel_id = hoteles.id
 JOIN clientes ON reservas.client_id = clientes.id
 WHERE clientes.nombre = 'zohan dvir';


/*Consultar todas las reservas que Franco Armani tiene en el Hotel hilton. Se debe
mostrar nombre de cliente y nombre del hotel en la consulta*/
SELECT fecha_inicio, fecha_fin,client_id,hotel_id,habitacion_id,hoteles.nombre AS nombre_hotel,clientes.nombre AS nombre_cliente
 FROM reservas
 JOIN hoteles ON reservas.hotel_id = hoteles.id
 JOIN clientes ON reservas.client_id = clientes.id
 WHERE clientes.nombre = 'franco armani' AND hoteles.nombre LIKE '%hilton';

 
  -- Consultar todas las reservas cuya fecha de inicio sea mayor al 15 de junio de 2023( 2023-06-15 ).
 SELECT fecha_inicio, fecha_fin,client_id,hotel_id,habitacion_id,hoteles.nombre,clientes.nombre AS nombre_cliente
 FROM reservas
 JOIN hoteles ON reservas.hotel_id = hoteles.id
 JOIN clientes ON reservas.client_id = clientes.id
 WHERE fecha_inicio > '2023-06-15';
 

-- Deleting because I ran it three times by mistake
-- DELETE FROM hoteles WHERE id IN (1, 2, 3, 4, 11, 12, 13, 14, 15);