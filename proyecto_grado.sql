-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-07-2020 a las 18:35:39
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_grado`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estaciones`
--

CREATE TABLE `estaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ubicacion` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `encargado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humedad_relativa`
--

CREATE TABLE `humedad_relativa` (
  `id` int(11) NOT NULL,
  `estacion` int(11) NOT NULL,
  `valor` varchar(50) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pmten`
--

CREATE TABLE `pmten` (
  `id` int(11) NOT NULL,
  `estacion` int(11) NOT NULL,
  `valor` varchar(50) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pmtwo`
--

CREATE TABLE `pmtwo` (
  `id` int(11) NOT NULL,
  `estacion` int(11) NOT NULL,
  `valor` varchar(50) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presion_atmosferica`
--

CREATE TABLE `presion_atmosferica` (
  `id` int(11) NOT NULL,
  `estacion` int(11) NOT NULL,
  `valor` varchar(50) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temperatura`
--

CREATE TABLE `temperatura` (
  `id` int(11) NOT NULL,
  `estacion` int(11) NOT NULL,
  `valor` varchar(50) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `usuarios` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `identificacion` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `celular` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estaciones`
--
ALTER TABLE `estaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_estaciones_usuarios` (`encargado`);

--
-- Indices de la tabla `humedad_relativa`
--
ALTER TABLE `humedad_relativa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_humedad_relativa_estaciones` (`estacion`);

--
-- Indices de la tabla `pmten`
--
ALTER TABLE `pmten`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_pmten_estaciones` (`estacion`);

--
-- Indices de la tabla `pmtwo`
--
ALTER TABLE `pmtwo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_pmtwo_estaciones` (`estacion`);

--
-- Indices de la tabla `presion_atmosferica`
--
ALTER TABLE `presion_atmosferica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_presion_atmosferica_estaciones` (`estacion`);

--
-- Indices de la tabla `temperatura`
--
ALTER TABLE `temperatura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_temperatura_estaciones` (`estacion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estaciones`
--
ALTER TABLE `estaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `humedad_relativa`
--
ALTER TABLE `humedad_relativa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pmten`
--
ALTER TABLE `pmten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pmtwo`
--
ALTER TABLE `pmtwo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presion_atmosferica`
--
ALTER TABLE `presion_atmosferica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `temperatura`
--
ALTER TABLE `temperatura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estaciones`
--
ALTER TABLE `estaciones`
  ADD CONSTRAINT `FK_estaciones_usuarios` FOREIGN KEY (`encargado`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `humedad_relativa`
--
ALTER TABLE `humedad_relativa`
  ADD CONSTRAINT `FK_humedad_relativa_estaciones` FOREIGN KEY (`estacion`) REFERENCES `estaciones` (`id`);

--
-- Filtros para la tabla `pmten`
--
ALTER TABLE `pmten`
  ADD CONSTRAINT `FK_pmten_estaciones` FOREIGN KEY (`estacion`) REFERENCES `estaciones` (`id`);

--
-- Filtros para la tabla `pmtwo`
--
ALTER TABLE `pmtwo`
  ADD CONSTRAINT `FK_pmtwo_estaciones` FOREIGN KEY (`estacion`) REFERENCES `estaciones` (`id`);

--
-- Filtros para la tabla `presion_atmosferica`
--
ALTER TABLE `presion_atmosferica`
  ADD CONSTRAINT `FK_presion_atmosferica_estaciones` FOREIGN KEY (`estacion`) REFERENCES `estaciones` (`id`);

--
-- Filtros para la tabla `temperatura`
--
ALTER TABLE `temperatura`
  ADD CONSTRAINT `FK_temperatura_estaciones` FOREIGN KEY (`estacion`) REFERENCES `estaciones` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
