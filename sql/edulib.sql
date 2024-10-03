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
  `nombre_elem` varchar(30) NOT NULL,
  `nombre_prestatario` varchar(45) DEFAULT NULL,
  `apellido_prestatario` varchar(45) NOT NULL,
  `curso_prestatario` varchar(15) NOT NULL,
  `fecha_prest` datetime DEFAULT NULL,
  `fecha_dev_prevista` datetime DEFAULT NULL,
  `fecha_dev` datetime DEFAULT NULL,
  PRIMARY KEY (`id_prest`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Consulta INSERT para probar el agregado de registros a la tabla
INSERT INTO `prestamos` 
VALUES (1,
'Notebook',
'Lucas',
'Ferrera',
'7A',
'2024-12-02 07:45:00',
'2024-12-02 09:55:00',
NULL);

-- -----------------------------------------------------
-- PRESTAMOS_LIBROS
-- -----------------------------------------------------

-- Creación de la tabla con sus respectivas columnas
DROP TABLE IF EXISTS `prestamos_libros`;
CREATE TABLE `prestamos_libros` (
  `id_prest` int NOT NULL AUTO_INCREMENT,
  `id_libro` int NOT NULL,
  `nombre_prestatario` varchar(45) DEFAULT NULL,
  `apellido_prestatario` varchar(45) NOT NULL,
  `curso_prestatario` varchar(15) NOT NULL,
  `fecha_prest` datetime DEFAULT NULL,
  `fecha_dev_prevista` datetime DEFAULT NULL,
  `fecha_dev` datetime DEFAULT NULL,
  PRIMARY KEY (`id_prest`),
  KEY `id_libro_idx` (`id_libro`),
  CONSTRAINT `id_libro` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Consulta INSERT para probar el agregado de registros a la tabla
INSERT INTO `prestamos_libros` 
VALUES (1,
1,
'Lucas',
'Ferrera',
'7A',
'2024-09-17 00:00:00',
'2024-10-01 00:00:00',
'2024-09-30 09:05:00');

-- -----------------------------------------------------
-- RESERVAS
-- -----------------------------------------------------

-- Creación de la tabla con sus respectivas columnas
DROP TABLE IF EXISTS `reservas`;
CREATE TABLE `reservas` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `nombre_elem` varchar(30) NOT NULL,
  `nombre_prestatario` varchar(45) DEFAULT NULL,
  `apellido_prestatario` varchar(45) NOT NULL,
  `curso_prestatario` varchar(15) NOT NULL,
  `fecha_reserva` datetime DEFAULT NULL,
  `fecha_dev_prevista` datetime DEFAULT NULL,
  PRIMARY KEY (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Consulta INSERT para probar el agregado de registros a la tabla
INSERT INTO `reservas` 
VALUES (2,
'Televisor',
'Pedro',
'Torres',
'3A',
'2024-10-22 10:35:00',
'2024-10-22 12:05:00');