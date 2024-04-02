-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2024 a las 03:39:19
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `angel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agregados`
--

CREATE TABLE `agregados` (
  `id_agregados` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_carrito` int(11) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `nombre_prod` varchar(200) DEFAULT NULL,
  `precio` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `agregados`
--

INSERT INTO `agregados` (`id_agregados`, `id_producto`, `id_carrito`, `imagen`, `nombre_prod`, `precio`) VALUES
(141, 2, 51, 'img/catalogo/papel.jpg', 'Papel', 20),
(142, 1, 51, 'img/catalogo/aguacate.jpg', 'Popotes', 1),
(143, 3, 51, 'img/catalogo/vasoz.jpg', 'vasos', 120),
(145, 2, 1, 'img/catalogo/papel.jpg', 'Papel', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id_carrito`, `id_usuario`) VALUES
(1, 1),
(50, 2),
(51, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio` decimal(8,0) NOT NULL,
  `imagen` varchar(140) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `imagen`) VALUES
(1, 'Popotes', 'Los popotes biodegradables son objetos hechos con diferentes materiales 100% naturales, los cuales pueden desecharse sin preocupación de generar grandes cantidades de basura, ya que se degradan gracia', 1, 'img/catalogo/aguacate.jpg'),
(2, 'Papel', 'Los popotes biodegradables son objetos hechos con diferentes materiales 100% naturales', 20, 'img/catalogo/papel.jpg'),
(3, 'vasos', 'Estas copas o vasos reciclados no solo se pueden utilizar para tomar sino que pueden usarse para servir postres o para adorno. ¿Qué les parecieron las ideas? Útiles y económicas!', 120, 'img/catalogo/vasoz.jpg'),
(4, 'bolsas', 'Manejamos cuatro materiales con los cuales podemos fabricar bolsas ecológicas, es importante que conozca a fondo sus características, en caso de requerir asesoría sobre las ventajas de cada material, ', 5, 'img/catalogo/bolsas.jpg'),
(5, 'libretas', 'ecologicas!', 10, 'img/catalogo/libretareciclable.jpg'),
(7, 'Macetas', 'ecologicas!', 10, 'img/catalogo/maseta.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(122) NOT NULL,
  `correo` varchar(122) NOT NULL,
  `contrasenia` varchar(122) NOT NULL,
  `edad` int(3) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `correo`, `contrasenia`, `edad`, `fecha`) VALUES
(1, 'carlos', 'carlos@carlos.com', '123', 25, '2022-06-24'),
(2, 'juan', 'juan@juan.com', '123', 23, '2022-06-21'),
(3, 'dsdsd', 'ventas@blm.com', '1234', 11, '2022-06-22'),
(4, 'carlos', 'c@c.com', '123', 12, '2024-04-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_ventas` int(11) NOT NULL,
  `id_carrito` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `total` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_ventas`, `id_carrito`, `id_usuario`, `cantidad`, `total`) VALUES
(2, 1, 1, 7, 64),
(3, 51, 3, 3, 141),
(4, 51, 3, 3, 141);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agregados`
--
ALTER TABLE `agregados`
  ADD PRIMARY KEY (`id_agregados`),
  ADD KEY `fk_agregados_carrito` (`id_carrito`),
  ADD KEY `fk_agregados_producto` (`id_producto`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `fk_usuarios_carrito` (`id_usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_ventas`),
  ADD KEY `fk_ventas_usuarios` (`id_usuario`),
  ADD KEY `fk_ventas_carrito` (`id_carrito`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agregados`
--
ALTER TABLE `agregados`
  MODIFY `id_agregados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_ventas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_ventas_carrito` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id_carrito`),
  ADD CONSTRAINT `fk_ventas_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
