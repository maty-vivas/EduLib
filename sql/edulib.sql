-- Se crea la BD con su respectivo nombre 
-- y se la selecciona para aplicar las consultas a la misma
CREATE SCHEMA IF NOT EXISTS `edulib`;
USE `edulib` ;

-- -----------------------------------------------------
-- LIBROS
-- -----------------------------------------------------

-- Creación de la tabla con sus respectivas columnas
DROP TABLE IF EXISTS `libros`;
CREATE TABLE `libros` (
  `id_libro` int NOT NULL AUTO_INCREMENT,
  `isbn` varchar(30) DEFAULT NULL,
  `cod_dewey` varchar(15) DEFAULT NULL,
  `titulo` tinytext NOT NULL,
  `subtitulo` tinytext,
  `autor` varchar(90) DEFAULT NULL,
  `num_item` int NOT NULL,
  PRIMARY KEY (`id_libro`),
  UNIQUE KEY `num_item_UNIQUE` (`num_item`),
  UNIQUE KEY `isbn_UNIQUE` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Consulta INSERT para probar el agregado de registros a la tabla
INSERT INTO `libros` 
VALUES (1,
'9872129908',
'HER 860A',
'El gaucho Martín Fierro',
NULL,
'Hernández, José',
1200);

-- -----------------------------------------------------
-- PRESTAMOS
-- -----------------------------------------------------

-- Creación de la tabla con sus respectivas columnas
DROP TABLE IF EXISTS `prestamos`;
CREATE TABLE `prestamos` (
  `id_prest` int NOT NULL AUTO_INCREMENT,
  `fecha_prest` datetime DEFAULT NULL,
  `nombre_prestatario` varchar(45) DEFAULT NULL,
  `apellido_prestatario` varchar(45) NOT NULL,
  `curso_prestatario` varchar(15) NOT NULL,
  `nombre_elem` varchar(30) NOT NULL,
  `fecha_dev_prevista` datetime DEFAULT NULL,
  `fecha_dev` datetime DEFAULT NULL,
  PRIMARY KEY (`id_prest`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Consulta INSERT para probar el agregado de registros a la tabla
INSERT INTO `prestamos` VALUES 
(1,'2024-11-12 07:45:00','Lucas','Ferrera','7°A','Netbook 17','2024-11-14 12:05:00',NULL),
(4,'2024-11-10 10:35:00','Alejandro','Torres','7°B','Proyector','2024-11-10 12:50:00',NULL),
(6,'2024-11-12 09:05:00','Pepe','Goméz','7°A','Notebook 4','2024-12-27 10:35:00',NULL),
(7,'2024-11-12 16:29:09','Matías','Vivas','PROFESOR','Televisor','2024-11-12 18:05:00',NULL),
(8,'2024-11-13 18:43:52','Rosa','Rodríguez','2°B','Parlante','2024-11-15 12:05:00',NULL);

-- -----------------------------------------------------
-- PRESTAMOS_LIBROS
-- -----------------------------------------------------

-- Creación de la tabla con sus respectivas columnas
DROP TABLE IF EXISTS `prestamos_libros`;
CREATE TABLE `prestamos_libros` (
  `id_prest` int NOT NULL AUTO_INCREMENT,
  `fecha_prest` datetime DEFAULT NULL,
  `nombre_prestatario` varchar(45) DEFAULT NULL,
  `apellido_prestatario` varchar(45) NOT NULL,
  `curso_prestatario` varchar(15) NOT NULL,
  `id_libro` int NOT NULL,
  `fecha_dev_prevista` datetime DEFAULT NULL,
  `fecha_dev` datetime DEFAULT NULL,
  PRIMARY KEY (`id_prest`),
  KEY `id_libro_idx` (`id_libro`),
  CONSTRAINT `id_libro` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Consulta INSERT para probar el agregado de registros a la tabla
INSERT INTO `prestamos_libros` VALUES 
(1,'2024-11-12 13:45:00','Lucas','Ferrera','7°A',1,'2024-11-13 07:45:00','2024-09-30 09:05:00');

-- -----------------------------------------------------
-- RESERVAS
-- -----------------------------------------------------

-- Creación de la tabla con sus respectivas columnas
DROP TABLE IF EXISTS `reservas`;
CREATE TABLE `reservas` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `nombre_prestatario` varchar(45) DEFAULT NULL,
  `apellido_prestatario` varchar(45) NOT NULL,
  `curso_prestatario` varchar(15) NOT NULL,
  `nombre_elem` varchar(30) NOT NULL,
  `fecha_reserva` datetime DEFAULT NULL,
  `fecha_dev` datetime DEFAULT NULL,
  PRIMARY KEY (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Consulta INSERT para probar el agregado de registros a la tabla
INSERT INTO `reservas` VALUES 
(2,'Pedro','Torres','3°A','Televisor','2024-12-18 15:05:00','2024-12-18 16:35:00');