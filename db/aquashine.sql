-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2024 a las 18:50:25
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aquashine`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npaquetes`
--

CREATE TABLE `npaquetes` (
  `id_Paquete` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` float NOT NULL,
  `imagen` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id-usuario` int(100) NOT NULL,
  `apellido_materno` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `nombre` varchar(140) NOT NULL,
  `correo` varchar(140) NOT NULL,
  `contrasenia` varchar(15) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `rol` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id-usuario`, `apellido_materno`, `apellido_paterno`, `nombre`, `correo`, `contrasenia`, `imagen`, `rol`) VALUES
(1, 'ruiz', 'hernandez', 'luis ', 'carlos@carlos.com', '123', '', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `npaquetes`
--
ALTER TABLE `npaquetes`
  ADD PRIMARY KEY (`id_Paquete`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id-usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `npaquetes`
--
ALTER TABLE `npaquetes`
  MODIFY `id_Paquete` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id-usuario` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
