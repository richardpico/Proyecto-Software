-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2021 a las 06:49:38
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestor_ruta_escolar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acudiente`
--

CREATE TABLE `acudiente` (
  `acu_id_acudiente` int(11) NOT NULL,
  `acu_numero_identificacion` int(11) NOT NULL,
  `acu_nombre` varchar(45) NOT NULL,
  `acu_primer_apellido` varchar(20) NOT NULL,
  `acu_segundo_apellido` varchar(20) DEFAULT NULL,
  `acu_fijo` varchar(15) DEFAULT NULL,
  `acu_movil` varchar(15) NOT NULL,
  `acu_mail` varchar(20) DEFAULT NULL,
  `acu_direccion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `acudiente`
--

INSERT INTO `acudiente` (`acu_id_acudiente`, `acu_numero_identificacion`, `acu_nombre`, `acu_primer_apellido`, `acu_segundo_apellido`, `acu_fijo`, `acu_movil`, `acu_mail`, `acu_direccion`) VALUES
(1, 13717084, 'Jose Ricardo', 'Pico', NULL, NULL, '3005698507', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acudiente_estudiante`
--

CREATE TABLE `acudiente_estudiante` (
  `acuest_id_acudiente_estudiante` int(11) NOT NULL,
  `fk_id_estudiante` int(11) NOT NULL,
  `acuest_id_parentesco` int(11) NOT NULL,
  `fk_id_acudiente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `acudiente_estudiante`
--

INSERT INTO `acudiente_estudiante` (`acuest_id_acudiente_estudiante`, `fk_id_estudiante`, `acuest_id_parentesco`, `fk_id_acudiente`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductor`
--

CREATE TABLE `conductor` (
  `con_id` int(11) NOT NULL,
  `con_numero_identificacion` varchar(15) NOT NULL,
  `con_nombre` varchar(32) NOT NULL,
  `con_primer_apellido` varchar(15) NOT NULL,
  `con_segundo_apellido` varchar(15) DEFAULT NULL,
  `con_movil` varchar(25) NOT NULL,
  `con_mail` varchar(30) DEFAULT NULL,
  `con_tipo_documento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `conductor`
--

INSERT INTO `conductor` (`con_id`, `con_numero_identificacion`, `con_nombre`, `con_primer_apellido`, `con_segundo_apellido`, `con_movil`, `con_mail`, `con_tipo_documento`) VALUES
(1, '13540550', 'Javier', 'Ayala', NULL, '3002784167', 'javier@gmail.com', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `cur_id_curso` int(11) NOT NULL,
  `cur_nombre_curso` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`cur_id_curso`, `cur_nombre_curso`) VALUES
(1, 'Primero'),
(2, 'Cuarto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `est_id_estudiante` int(11) NOT NULL,
  `est_numero_identificacion` varchar(15) NOT NULL,
  `est_nombre` varchar(45) NOT NULL,
  `est_primer_apellido` varchar(20) NOT NULL,
  `est_segundo_apellido` varchar(20) DEFAULT NULL,
  `est_direccion` varchar(50) NOT NULL,
  `est_movil` varchar(25) DEFAULT NULL,
  `est_mail` varchar(45) DEFAULT NULL,
  `curso_fk_estudiante` int(11) NOT NULL,
  `genero_fk_estudiante` int(11) NOT NULL,
  `tipo_documento_fk_estudiante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`est_id_estudiante`, `est_numero_identificacion`, `est_nombre`, `est_primer_apellido`, `est_segundo_apellido`, `est_direccion`, `est_movil`, `est_mail`, `curso_fk_estudiante`, `genero_fk_estudiante`, `tipo_documento_fk_estudiante`) VALUES
(1, '1016002607', 'Erika', 'Toro', NULL, 'Calle 101 # 12-32 San Franciso', NULL, NULL, 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_ruta`
--

CREATE TABLE `estudiante_ruta` (
  `estrut_id_estudiante_ruta` int(11) NOT NULL,
  `fk_id_estudiante` int(11) NOT NULL,
  `fk_id_ruta` int(11) NOT NULL,
  `estrut_fecha_ingreso` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante_ruta`
--

INSERT INTO `estudiante_ruta` (`estrut_id_estudiante_ruta`, `fk_id_estudiante`, `fk_id_ruta`, `estrut_fecha_ingreso`) VALUES
(1, 1, 2, '15/01/2021');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `gen_id` int(11) NOT NULL,
  `gen_nombre_genero` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`gen_id`, `gen_nombre_genero`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `mar_id` int(11) NOT NULL,
  `mar_nombre_marca` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`mar_id`, `mar_nombre_marca`) VALUES
(1, 'Ford'),
(2, 'Chevrolet'),
(3, 'Mercedes Benz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco`
--

CREATE TABLE `parentesco` (
  `par_id_parentesco` int(11) NOT NULL,
  `par_nombre_parentesco` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `parentesco`
--

INSERT INTO `parentesco` (`par_id_parentesco`, `par_nombre_parentesco`) VALUES
(1, 'Abuelo'),
(2, 'Padre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `ruta_id_ruta` int(11) NOT NULL,
  `ruta_cupo_disponible` int(11) DEFAULT NULL,
  `ruta_cupo_asignado` int(11) NOT NULL,
  `ruta_nombre_zona` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ruta`
--

INSERT INTO `ruta` (`ruta_id_ruta`, `ruta_cupo_disponible`, `ruta_cupo_asignado`, `ruta_nombre_zona`) VALUES
(1, NULL, 32, 'Occidente'),
(2, NULL, 30, 'Oriente'),
(3, NULL, 25, 'Sur');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `tip_id_tipo_documento` int(11) NOT NULL,
  `tip_nombre_documento` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`tip_id_tipo_documento`, `tip_nombre_documento`) VALUES
(1, 'Registro'),
(2, 'Cedula'),
(3, 'Tarjeta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `veh_id_vehiculo` int(11) NOT NULL,
  `veh_modelo` year(4) NOT NULL,
  `veh_capacidad` int(11) NOT NULL,
  `vah_matricula_placa` varchar(8) NOT NULL,
  `conductor_fk_vehiculo` int(11) NOT NULL,
  `marca_fk_vehiculo` int(11) NOT NULL,
  `veh_id_ruta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`veh_id_vehiculo`, `veh_modelo`, `veh_capacidad`, `vah_matricula_placa`, `conductor_fk_vehiculo`, `marca_fk_vehiculo`, `veh_id_ruta`) VALUES
(1, 2015, 40, 'XVH215', 1, 2, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acudiente`
--
ALTER TABLE `acudiente`
  ADD PRIMARY KEY (`acu_id_acudiente`);

--
-- Indices de la tabla `acudiente_estudiante`
--
ALTER TABLE `acudiente_estudiante`
  ADD PRIMARY KEY (`acuest_id_acudiente_estudiante`),
  ADD KEY `estudiante_fk_acudiente_estudiante` (`fk_id_estudiante`),
  ADD KEY `parentesco_fk_acudiente_estudiante` (`acuest_id_parentesco`),
  ADD KEY `acudiente_fk_acudiente_estudiante` (`fk_id_acudiente`);

--
-- Indices de la tabla `conductor`
--
ALTER TABLE `conductor`
  ADD PRIMARY KEY (`con_id`),
  ADD KEY `conductores_fk_tipo_documento1` (`con_tipo_documento`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`cur_id_curso`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`est_id_estudiante`),
  ADD KEY `estudiante_fk_curso` (`curso_fk_estudiante`),
  ADD KEY `estudiante_fk_genero` (`genero_fk_estudiante`),
  ADD KEY `estudiante_fk_tipo_documento1` (`tipo_documento_fk_estudiante`);

--
-- Indices de la tabla `estudiante_ruta`
--
ALTER TABLE `estudiante_ruta`
  ADD PRIMARY KEY (`estrut_id_estudiante_ruta`),
  ADD KEY `estudiante_fk_estudiante_ruta` (`fk_id_estudiante`),
  ADD KEY `ruta_fk_estudiante_ruta` (`fk_id_ruta`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`gen_id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`mar_id`);

--
-- Indices de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD PRIMARY KEY (`par_id_parentesco`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`ruta_id_ruta`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`tip_id_tipo_documento`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`veh_id_vehiculo`),
  ADD KEY `vehiculo_fk_conductor` (`conductor_fk_vehiculo`),
  ADD KEY `vehiculo_fk_marca` (`marca_fk_vehiculo`),
  ADD KEY `vehiculo_fk_ruta` (`veh_id_ruta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acudiente`
--
ALTER TABLE `acudiente`
  MODIFY `acu_id_acudiente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `acudiente_estudiante`
--
ALTER TABLE `acudiente_estudiante`
  MODIFY `acuest_id_acudiente_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `conductor`
--
ALTER TABLE `conductor`
  MODIFY `con_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `cur_id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `est_id_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estudiante_ruta`
--
ALTER TABLE `estudiante_ruta`
  MODIFY `estrut_id_estudiante_ruta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `gen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `mar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  MODIFY `par_id_parentesco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ruta`
--
ALTER TABLE `ruta`
  MODIFY `ruta_id_ruta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `tip_id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `veh_id_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acudiente_estudiante`
--
ALTER TABLE `acudiente_estudiante`
  ADD CONSTRAINT `acudiente_fk_acudiente_estudiante` FOREIGN KEY (`fk_id_acudiente`) REFERENCES `acudiente` (`acu_id_acudiente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `estudiante_fk_acudiente_estudiante` FOREIGN KEY (`fk_id_estudiante`) REFERENCES `estudiante` (`est_id_estudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `parentesco_fk_acudiente_estudiante` FOREIGN KEY (`acuest_id_parentesco`) REFERENCES `parentesco` (`par_id_parentesco`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `conductor`
--
ALTER TABLE `conductor`
  ADD CONSTRAINT `conductores_fk_tipo_documento1` FOREIGN KEY (`con_tipo_documento`) REFERENCES `tipo_documento` (`tip_id_tipo_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_fk_curso` FOREIGN KEY (`curso_fk_estudiante`) REFERENCES `curso` (`cur_id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `estudiante_fk_genero` FOREIGN KEY (`genero_fk_estudiante`) REFERENCES `genero` (`gen_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `estudiante_fk_tipo_documento1` FOREIGN KEY (`tipo_documento_fk_estudiante`) REFERENCES `tipo_documento` (`tip_id_tipo_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estudiante_ruta`
--
ALTER TABLE `estudiante_ruta`
  ADD CONSTRAINT `estudiante_fk_estudiante_ruta` FOREIGN KEY (`fk_id_estudiante`) REFERENCES `estudiante` (`est_id_estudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ruta_fk_estudiante_ruta` FOREIGN KEY (`fk_id_ruta`) REFERENCES `ruta` (`ruta_id_ruta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_fk_conductor` FOREIGN KEY (`conductor_fk_vehiculo`) REFERENCES `conductor` (`con_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vehiculo_fk_marca` FOREIGN KEY (`marca_fk_vehiculo`) REFERENCES `marca` (`mar_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vehiculo_fk_ruta` FOREIGN KEY (`veh_id_ruta`) REFERENCES `ruta` (`ruta_id_ruta`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
