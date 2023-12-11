-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-12-2023 a las 13:56:48
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_sit`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE `distrito` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`id`, `nombre`) VALUES
(1, 'Alto Selva Alegre'),
(2, 'Arequipa'),
(3, 'Cayma'),
(4, 'Cerro Colorado'),
(5, 'Characato'),
(6, 'Chiguata'),
(7, 'Jacobo Hunter'),
(8, 'Jose Luis Bustamante Y Rivero'),
(9, 'La Joya'),
(10, 'Mariano Melgar'),
(11, 'Miraflores'),
(12, 'Mollebaya'),
(13, 'Paucarpata'),
(14, 'Pocsi'),
(15, 'Polobaya'),
(16, 'Quequeña'),
(17, 'Sabandia'),
(18, 'Sachaca'),
(19, 'San Juan De Siguas'),
(20, 'San Juan De Tarucani'),
(21, 'Santa Isabel De Siguas'),
(22, 'Santa Rita De Sihuas'),
(23, 'Socabaya'),
(24, 'Tiabaya'),
(25, 'Uchumayo'),
(26, 'Vitor'),
(27, 'Yanahuara'),
(28, 'Yarabamba'),
(29, 'Yura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora_salida` time NOT NULL,
  `hora_retorno` time NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id`, `fecha`, `hora_salida`, `hora_retorno`, `estado`) VALUES
(1, '2023-01-01', '05:00:00', '07:30:00', 0),
(2, '2023-01-01', '05:15:00', '07:45:00', 0),
(3, '2023-01-01', '05:30:00', '08:00:00', 0),
(4, '2023-01-01', '05:45:00', '08:15:00', 0),
(5, '2023-01-01', '06:00:00', '08:30:00', 0),
(6, '2023-01-01', '06:15:00', '08:45:00', 0),
(7, '2023-01-01', '06:30:00', '09:00:00', 0),
(8, '2023-01-01', '06:45:00', '09:15:00', 0),
(9, '2023-01-01', '07:00:00', '09:30:00', 0),
(10, '2023-01-01', '07:15:00', '09:45:00', 0),
(11, '2023-01-01', '07:30:00', '10:00:00', 0),
(12, '2023-01-01', '07:45:00', '10:15:00', 0),
(13, '2023-01-01', '08:00:00', '10:30:00', 0),
(14, '2023-01-01', '08:15:00', '10:45:00', 0),
(15, '2023-01-01', '08:30:00', '11:00:00', 0),
(16, '2023-01-01', '08:45:00', '11:15:00', 0),
(17, '2023-01-01', '09:00:00', '11:30:00', 0),
(18, '2023-01-01', '09:15:00', '11:45:00', 0),
(19, '2023-01-01', '09:30:00', '12:00:00', 0),
(20, '2023-01-01', '09:45:00', '12:15:00', 0),
(21, '2023-01-01', '10:00:00', '12:30:00', 0),
(22, '2023-01-01', '10:15:00', '12:45:00', 0),
(23, '2023-01-01', '10:30:00', '13:00:00', 0),
(24, '2023-01-01', '10:45:00', '13:15:00', 0),
(25, '2023-01-01', '11:00:00', '13:30:00', 0),
(26, '2023-01-01', '11:15:00', '13:45:00', 0),
(27, '2023-01-01', '11:30:00', '14:00:00', 0),
(28, '2023-01-01', '11:45:00', '14:15:00', 0),
(29, '2023-01-01', '12:00:00', '14:30:00', 0),
(30, '2023-01-01', '12:15:00', '14:45:00', 0),
(31, '2023-01-01', '12:30:00', '15:00:00', 0),
(32, '2023-01-01', '12:45:00', '15:15:00', 0),
(33, '2023-01-01', '13:00:00', '15:30:00', 0),
(34, '2023-01-01', '13:15:00', '15:45:00', 0),
(35, '2023-01-01', '13:30:00', '16:00:00', 0),
(36, '2023-01-01', '13:45:00', '16:15:00', 0),
(37, '2023-01-01', '14:00:00', '16:30:00', 0),
(38, '2023-01-01', '14:15:00', '16:45:00', 0),
(39, '2023-01-01', '14:30:00', '17:00:00', 0),
(40, '2023-01-01', '14:45:00', '17:15:00', 0),
(41, '2023-01-01', '15:00:00', '17:30:00', 0),
(42, '2023-01-01', '15:15:00', '17:45:00', 0),
(43, '2023-01-01', '15:30:00', '18:00:00', 0),
(44, '2023-01-01', '15:45:00', '18:15:00', 0),
(45, '2023-01-01', '16:00:00', '18:30:00', 0),
(46, '2023-01-01', '16:15:00', '18:45:00', 0),
(47, '2023-01-01', '16:30:00', '19:00:00', 0),
(48, '2023-01-01', '16:45:00', '19:15:00', 0),
(49, '2023-01-01', '17:00:00', '19:30:00', 0),
(50, '2023-01-01', '17:15:00', '19:45:00', 0),
(51, '2023-01-01', '17:30:00', '20:00:00', 0),
(52, '2023-01-01', '17:45:00', '20:15:00', 0),
(53, '2023-01-01', '18:00:00', '20:30:00', 0),
(54, '2023-01-01', '18:15:00', '20:45:00', 0),
(55, '2023-01-01', '18:30:00', '21:00:00', 0),
(56, '2023-01-01', '18:45:00', '21:15:00', 0),
(57, '2023-01-01', '19:00:00', '21:30:00', 0),
(58, '2023-01-01', '19:15:00', '21:45:00', 0),
(59, '2023-01-01', '19:30:00', '22:00:00', 0),
(60, '2023-01-01', '19:45:00', '22:15:00', 0),
(61, '2023-01-01', '20:00:00', '22:30:00', 0),
(62, '2023-01-01', '20:15:00', '22:45:00', 0),
(63, '2023-01-01', '20:30:00', '23:00:00', 0),
(64, '2023-01-01', '20:45:00', '23:15:00', 0),
(65, '2023-01-01', '21:00:00', '23:30:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario_viaje`
--

CREATE TABLE `horario_viaje` (
  `id` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL,
  `id_viaje` int(11) NOT NULL,
  `hora_salida_registro` time NOT NULL,
  `hora_retorno_registro` time NOT NULL,
  `fecha_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `horario_viaje`
--

INSERT INTO `horario_viaje` (`id`, `id_horario`, `id_viaje`, `hora_salida_registro`, `hora_retorno_registro`, `fecha_registro`) VALUES
(1, 1, 2, '18:10:29', '20:10:29', '2023-12-03'),
(2, 39, 4, '18:10:29', '20:10:29', '2023-12-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidoPaterno` varchar(100) NOT NULL,
  `apellidoMaterno` varchar(100) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `dni` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `fechaNacimiento`, `dni`, `correo`) VALUES
(1, 'Diego e', 'Quispe', 'Rodriguez', '2001-12-04', 78811186, 'edson123'),
(2, 'Jose', 'Fernandez', 'Mendoza', '2023-10-10', 75894658, 'jose@'),
(3, 'Alex', 'Cordova', 'Huaracha', '2023-10-17', 67964351, 'alex@gmail.com'),
(7, 'Luis2', 'L1', 'L1', '2023-09-26', 30586181, 'luis123@gmail.com'),
(9, 'paola', 'gara', 'medina', '2023-10-25', 548976312, 'paola@gmail.com'),
(10, 'Prueba', 'Peruba', 'Prueba', '2023-11-09', 73011185, 'prueba1@gmail.com'),
(11, 'Prueba2', 'Peruba2', 'p2', '2023-11-30', 73011185, 'prueba2@gmail.com'),
(12, 'prueba', 'prueba', 'prueba', '2023-11-23', 30586181, 'prueba3@gmail.com'),
(13, 'Juan Diego', 'Torres', 'Malaga', '1996-06-12', 73548965, 'Juan_T@gmail.com'),
(14, 'Maria Juana', 'Peralez', 'Huaraz', '1998-01-14', 73045185, 'maria_t@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `rol`, `descripcion`) VALUES
(1, 'admin', 'Admin'),
(2, 'Transportista', 'Transportista de buses'),
(3, 'Cliente', 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `id` int(11) NOT NULL,
  `color` varchar(50) NOT NULL,
  `nombre_ruta` varchar(100) NOT NULL,
  `origen` varchar(100) NOT NULL,
  `destino` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `id_distrito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ruta`
--

INSERT INTO `ruta` (`id`, `color`, `nombre_ruta`, `origen`, `destino`, `estado`, `id_distrito`) VALUES
(3, 'Verde', 'Cayma-Cayma', 'Caymaa', 'Cayma', 1, 3),
(4, 'Azul', 'Cerro Colorado', 'Cerro Colorado', 'Cerro Colorado', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `id` int(11) NOT NULL,
  `codigo_tarjeta` varchar(30) NOT NULL,
  `numero_tarjeta` varchar(30) NOT NULL,
  `fecha_activacion` datetime NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `saldo` float NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`id`, `codigo_tarjeta`, `numero_tarjeta`, `fecha_activacion`, `fecha_vencimiento`, `estado`, `saldo`, `id_usuario`) VALUES
(2, '1234', '123456789', '2023-10-08 02:36:40', '2023-10-08', 1, 97, 2),
(3, '4321', '987654321', '2023-10-21 20:21:12', '2023-10-11', 1, 45, 2),
(4, '1234', '123123123', '2023-10-23 03:18:15', '2023-10-25', 1, 15, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_transporte`
--

CREATE TABLE `unidad_transporte` (
  `id` int(11) NOT NULL,
  `placa` varchar(20) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `unidad_transporte`
--

INSERT INTO `unidad_transporte` (`id`, `placa`, `marca`, `modelo`, `estado`) VALUES
(1, 'UVJ-459', 'Cotum2', 'Nuevito', 1),
(2, 'CJD-758', 'Cotum', 'Nuevo', 1),
(3, 'FTY-7851', 'Bus', 'Viejo', 1),
(4, 'UVW-X6Z', 'Cotum', 'Rain', 1),
(5, 'U2W-AAA', 'Cotum', 'Rain', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombreUsuario` varchar(255) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombreUsuario`, `contrasenia`, `idPersona`, `id_rol`, `estado`) VALUES
(2, 'diego@gmail.com', '1234', 1, 3, 1),
(3, 'jose123@gmail.com', '123', 2, 3, 1),
(7, 'alex_t@gmail.com', '1234', 3, 2, 1),
(8, 'luis123@gmail.com', '123', 7, 3, 1),
(10, 'paola@gmail.com', '1234', 9, 3, 1),
(11, 'prueba1@gmail.com', '1234', 10, 2, 1),
(12, 'prueba2@gmail.com', '1234', 11, 2, 1),
(13, 'prueba3@gmail.com', '1234', 12, 3, 1),
(14, 'Juan_T@gmail.com', '1234', 13, 2, 1),
(15, 'maria_t@gmail.com', '1234', 14, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje`
--

CREATE TABLE `viaje` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `tarifa` float NOT NULL,
  `reporte_viaje` varchar(255) NOT NULL,
  `id_ruta` int(11) NOT NULL,
  `id_transporte` int(11) NOT NULL,
  `id_transportista` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `viaje`
--

INSERT INTO `viaje` (`id`, `fecha`, `hora`, `tarifa`, `reporte_viaje`, `id_ruta`, `id_transporte`, `id_transportista`, `estado`) VALUES
(2, '2023-12-03', '17:02:33', 1.5, 'Reporte completo', 3, 1, 7, 1),
(4, '2023-12-03', '02:33:00', 1, 'Reporte completo', 3, 1, 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje_usuario`
--

CREATE TABLE `viaje_usuario` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_viaje` int(11) NOT NULL,
  `fecha_registro` date NOT NULL,
  `hora_registro` time NOT NULL,
  `monto_cobrado` float NOT NULL,
  `numero_tarjeta` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horario_viaje`
--
ALTER TABLE `horario_viaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_horario` (`id_horario`),
  ADD KEY `id_viaje` (`id_viaje`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_distrito` (`id_distrito`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `unidad_transporte`
--
ALTER TABLE `unidad_transporte`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `idPersona` (`idPersona`);

--
-- Indices de la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ruta` (`id_ruta`),
  ADD KEY `id_transporte` (`id_transporte`);

--
-- Indices de la tabla `viaje_usuario`
--
ALTER TABLE `viaje_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_viaje` (`id_viaje`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT de la tabla `horario_viaje`
--
ALTER TABLE `horario_viaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ruta`
--
ALTER TABLE `ruta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `unidad_transporte`
--
ALTER TABLE `unidad_transporte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `viaje`
--
ALTER TABLE `viaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `viaje_usuario`
--
ALTER TABLE `viaje_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `horario_viaje`
--
ALTER TABLE `horario_viaje`
  ADD CONSTRAINT `horario_viaje_ibfk_1` FOREIGN KEY (`id_viaje`) REFERENCES `viaje` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `horario_viaje_ibfk_2` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD CONSTRAINT `ruta_ibfk_1` FOREIGN KEY (`id_distrito`) REFERENCES `distrito` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `tarjeta_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD CONSTRAINT `viaje_ibfk_1` FOREIGN KEY (`id_transporte`) REFERENCES `unidad_transporte` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `viaje_ibfk_2` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `viaje_usuario`
--
ALTER TABLE `viaje_usuario`
  ADD CONSTRAINT `viaje_usuario_ibfk_1` FOREIGN KEY (`id_viaje`) REFERENCES `viaje` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `viaje_usuario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
