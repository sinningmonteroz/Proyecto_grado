-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para proyecto_grado
CREATE DATABASE IF NOT EXISTS `proyecto_grado` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `proyecto_grado`;

-- Volcando estructura para tabla proyecto_grado.estaciones
CREATE TABLE IF NOT EXISTS `estaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `ubicacion` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `encargado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_estaciones_usuarios` (`encargado`),
  CONSTRAINT `FK_estaciones_usuarios` FOREIGN KEY (`encargado`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla proyecto_grado.estaciones: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `estaciones` DISABLE KEYS */;
INSERT INTO `estaciones` (`id`, `nombre`, `ubicacion`, `descripcion`, `encargado`) VALUES
	(1, 'equipo-01', 'Las Mercedes', 'Puente de Las Mercedes', 1);
/*!40000 ALTER TABLE `estaciones` ENABLE KEYS */;

-- Volcando estructura para tabla proyecto_grado.humedad_relativa
CREATE TABLE IF NOT EXISTS `humedad_relativa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estacion` int(11) NOT NULL,
  `valor` varchar(50) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_humedad_relativa_estaciones` (`estacion`),
  CONSTRAINT `FK_humedad_relativa_estaciones` FOREIGN KEY (`estacion`) REFERENCES `estaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla proyecto_grado.humedad_relativa: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `humedad_relativa` DISABLE KEYS */;
INSERT INTO `humedad_relativa` (`id`, `estacion`, `valor`, `fecha_hora`) VALUES
	(1, 1, '15', '2020-07-29 16:14:01'),
	(16, 1, '16', '2020-08-10 23:16:11'),
	(17, 1, '18\n', '2020-08-10 23:15:18'),
	(18, 1, '19\n', '2020-08-11 12:57:53'),
	(19, 1, '19\n', '2020-08-11 12:58:04'),
	(20, 1, '23\n', '2020-08-11 12:58:14'),
	(21, 1, '23\n', '2020-08-11 12:58:24'),
	(22, 1, '23\n', '2020-08-11 12:58:34'),
	(23, 1, '23\n', '2020-08-11 12:58:45'),
	(24, 1, '23\n', '2020-08-11 12:58:55'),
	(25, 1, '23\n', '2020-08-11 12:59:05'),
	(26, 1, '23\n', '2020-08-11 12:59:15'),
	(27, 1, '23\n', '2020-08-11 12:59:25'),
	(28, 1, '23\n', '2020-08-11 12:59:36'),
	(29, 1, '23\n', '2020-08-11 12:59:46'),
	(30, 1, '23\n', '2020-08-11 12:59:56'),
	(31, 1, '23\n', '2020-08-11 13:00:07'),
	(32, 1, '23\n', '2020-08-11 13:00:17'),
	(33, 1, '23\n', '2020-08-11 13:00:27'),
	(34, 1, '23\n', '2020-08-11 13:00:37'),
	(35, 1, '19\n', '2020-08-12 16:26:10'),
	(36, 1, '19', '2020-08-12 16:26:16'),
	(37, 1, '23\n', '2020-08-11 13:01:18'),
	(38, 1, '23\n', '2020-08-11 13:01:08');
/*!40000 ALTER TABLE `humedad_relativa` ENABLE KEYS */;

-- Volcando estructura para tabla proyecto_grado.pmten
CREATE TABLE IF NOT EXISTS `pmten` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estacion` int(11) NOT NULL,
  `valor` varchar(50) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_pmten_estaciones` (`estacion`),
  CONSTRAINT `FK_pmten_estaciones` FOREIGN KEY (`estacion`) REFERENCES `estaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla proyecto_grado.pmten: ~23 rows (aproximadamente)
/*!40000 ALTER TABLE `pmten` DISABLE KEYS */;
INSERT INTO `pmten` (`id`, `estacion`, `valor`, `fecha_hora`) VALUES
	(1, 1, '25', '2020-07-29 16:14:18'),
	(2, 1, '24\n', '2020-08-10 23:15:18'),
	(3, 1, '19\n', '2020-08-11 12:57:53'),
	(4, 1, '19\n', '2020-08-11 12:58:04'),
	(5, 1, '19\n', '2020-08-11 12:58:14'),
	(6, 1, '19\n', '2020-08-11 12:58:24'),
	(7, 1, '19\n', '2020-08-11 12:58:34'),
	(8, 1, '19\n', '2020-08-11 12:58:45'),
	(9, 1, '19\n', '2020-08-11 12:58:55'),
	(10, 1, '19\n', '2020-08-11 12:59:05'),
	(11, 1, '19\n', '2020-08-11 12:59:15'),
	(12, 1, '19\n', '2020-08-11 12:59:25'),
	(13, 1, '19\n', '2020-08-11 12:59:36'),
	(14, 1, '19\n', '2020-08-11 12:59:46'),
	(15, 1, '19\n', '2020-08-11 12:59:57'),
	(16, 1, '19\n', '2020-08-11 13:00:07'),
	(17, 1, '19\n', '2020-08-11 13:00:17'),
	(18, 1, '19\n', '2020-08-11 13:00:27'),
	(19, 1, '19\n', '2020-08-11 13:00:37'),
	(20, 1, '19\n', '2020-08-11 13:00:47'),
	(21, 1, '20', '2020-08-12 16:26:10'),
	(22, 1, '20', '2020-08-12 16:26:16'),
	(23, 1, '19\n', '2020-08-11 13:01:18'),
	(24, 1, '19\n', '2020-08-11 13:01:08');
/*!40000 ALTER TABLE `pmten` ENABLE KEYS */;

-- Volcando estructura para tabla proyecto_grado.pmtwo
CREATE TABLE IF NOT EXISTS `pmtwo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estacion` int(11) NOT NULL,
  `valor` varchar(50) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_pmtwo_estaciones` (`estacion`),
  CONSTRAINT `FK_pmtwo_estaciones` FOREIGN KEY (`estacion`) REFERENCES `estaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla proyecto_grado.pmtwo: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `pmtwo` DISABLE KEYS */;
INSERT INTO `pmtwo` (`id`, `estacion`, `valor`, `fecha_hora`) VALUES
	(1, 1, '12', '2020-07-29 16:14:30'),
	(2, 1, '14\n', '2020-08-10 23:15:18'),
	(3, 1, '19\n', '2020-08-11 12:57:53'),
	(4, 1, '19\n', '2020-08-11 12:58:04'),
	(5, 1, '19\n', '2020-08-11 12:58:14'),
	(6, 1, '19\n', '2020-08-11 12:58:24'),
	(7, 1, '19\n', '2020-08-11 12:58:34'),
	(8, 1, '19\n', '2020-08-11 12:58:45'),
	(9, 1, '19\n', '2020-08-11 12:58:55'),
	(10, 1, '19\n', '2020-08-11 12:59:05'),
	(11, 1, '19\n', '2020-08-11 12:59:15'),
	(12, 1, '19\n', '2020-08-11 12:59:25'),
	(13, 1, '19\n', '2020-08-11 12:59:36'),
	(14, 1, '19\n', '2020-08-11 12:59:46'),
	(15, 1, '19\n', '2020-08-11 12:59:56'),
	(16, 1, '19\n', '2020-08-11 13:00:07'),
	(17, 1, '19\n', '2020-08-11 13:00:17'),
	(18, 1, '19\n', '2020-08-11 13:00:27'),
	(19, 1, '19\n', '2020-08-11 13:00:37'),
	(20, 1, '19\n', '2020-08-11 13:00:47'),
	(21, 1, '19\n', '2020-08-11 13:00:58'),
	(22, 1, '19\n', '2020-08-11 13:01:08'),
	(23, 1, '19\n', '2020-08-11 13:01:18'),
	(24, 1, '19\n', '2020-08-11 13:01:28');
/*!40000 ALTER TABLE `pmtwo` ENABLE KEYS */;

-- Volcando estructura para tabla proyecto_grado.presion_atmosferica
CREATE TABLE IF NOT EXISTS `presion_atmosferica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estacion` int(11) NOT NULL,
  `valor` varchar(50) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_presion_atmosferica_estaciones` (`estacion`),
  CONSTRAINT `FK_presion_atmosferica_estaciones` FOREIGN KEY (`estacion`) REFERENCES `estaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla proyecto_grado.presion_atmosferica: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `presion_atmosferica` DISABLE KEYS */;
INSERT INTO `presion_atmosferica` (`id`, `estacion`, `valor`, `fecha_hora`) VALUES
	(1, 1, '13', '2020-07-29 16:15:16'),
	(2, 1, '30\n', '2020-08-10 23:15:18'),
	(3, 1, '29\n', '2020-08-11 12:57:53'),
	(4, 1, '29\n', '2020-08-11 12:58:04'),
	(5, 1, '29\n', '2020-08-11 12:58:14'),
	(6, 1, '29\n', '2020-08-11 12:58:24'),
	(7, 1, '29\n', '2020-08-11 12:58:34'),
	(8, 1, '29\n', '2020-08-11 12:58:45'),
	(9, 1, '29\n', '2020-08-11 12:58:55'),
	(10, 1, '29\n', '2020-08-11 12:59:05'),
	(11, 1, '29\n', '2020-08-11 12:59:15'),
	(12, 1, '29\n', '2020-08-11 12:59:25'),
	(13, 1, '29\n', '2020-08-11 12:59:36'),
	(14, 1, '29\n', '2020-08-11 12:59:46'),
	(15, 1, '29\n', '2020-08-11 12:59:56'),
	(16, 1, '29\n', '2020-08-11 13:00:07'),
	(17, 1, '29\n', '2020-08-11 13:00:17'),
	(18, 1, '29\n', '2020-08-11 13:00:27'),
	(19, 1, '29\n', '2020-08-11 13:00:37'),
	(20, 1, '29\n', '2020-08-11 13:00:47'),
	(21, 1, '28', '2020-08-12 16:26:10'),
	(22, 1, '27\n', '2020-08-12 16:26:16'),
	(23, 1, '29\n', '2020-08-11 13:01:18'),
	(24, 1, '29\n', '2020-08-11 13:01:08');
/*!40000 ALTER TABLE `presion_atmosferica` ENABLE KEYS */;

-- Volcando estructura para tabla proyecto_grado.temperatura
CREATE TABLE IF NOT EXISTS `temperatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estacion` int(11) NOT NULL,
  `valor` varchar(50) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_temperatura_estaciones` (`estacion`),
  CONSTRAINT `FK_temperatura_estaciones` FOREIGN KEY (`estacion`) REFERENCES `estaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla proyecto_grado.temperatura: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `temperatura` DISABLE KEYS */;
INSERT INTO `temperatura` (`id`, `estacion`, `valor`, `fecha_hora`) VALUES
	(1, 1, '30', '2020-07-29 16:15:29'),
	(2, 1, '25', '2020-08-10 23:16:00'),
	(3, 1, '20\n', '2020-08-10 23:15:18'),
	(4, 1, '21\n', '2020-08-11 12:57:53'),
	(5, 1, '21\n', '2020-08-11 12:58:04'),
	(6, 1, '21\n', '2020-08-11 12:58:14'),
	(7, 1, '21\n', '2020-08-11 12:58:24'),
	(8, 1, '21\n', '2020-08-11 12:58:34'),
	(9, 1, '21\n', '2020-08-11 12:58:45'),
	(10, 1, '21\n', '2020-08-11 12:58:55'),
	(11, 1, '21\n', '2020-08-11 12:59:05'),
	(12, 1, '21\n', '2020-08-11 12:59:15'),
	(13, 1, '21\n', '2020-08-11 12:59:25'),
	(14, 1, '21\n', '2020-08-11 12:59:36'),
	(15, 1, '21\n', '2020-08-11 12:59:46'),
	(16, 1, '21\n', '2020-08-11 12:59:56'),
	(17, 1, '21\n', '2020-08-11 13:00:07'),
	(18, 1, '21\n', '2020-08-11 13:00:17'),
	(19, 1, '21\n', '2020-08-11 13:00:27'),
	(20, 1, '21\n', '2020-08-11 13:00:37'),
	(21, 1, '21\n', '2020-08-11 13:00:47'),
	(22, 1, '22\n', '2020-08-11 16:34:24'),
	(23, 1, '21\n', '2020-08-11 13:01:08'),
	(24, 1, '25', '2020-08-11 16:34:00'),
	(25, 1, '23\n', '2020-08-11 16:34:14');
/*!40000 ALTER TABLE `temperatura` ENABLE KEYS */;

-- Volcando estructura para tabla proyecto_grado.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `identificacion` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `celular` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla proyecto_grado.usuarios: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `identificacion`, `password`, `email`, `celular`) VALUES
	(1, 'Ronaldo Aldair', 'Sinning Montero', '1102872306', '1102872306', 'ronalsimon_77@hotmail.es', '3045349268'),
	(11, 'Yenny', 'Sinning', '1312938126', '123', 'leidis_dianis@hotmail.com', '3027768768');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
