-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-03-2019 a las 19:34:53
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `museo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuadro`
--

CREATE TABLE `cuadro` (
  `id` int(10) UNSIGNED NOT NULL,
  `expo` int(11) NOT NULL,
  `titulo` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `autor` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `fecha` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `tecnica` varchar(50) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `cuadro`
--

INSERT INTO `cuadro` (`id`, `expo`, `titulo`, `autor`, `fecha`, `tecnica`) VALUES
(1, 1, 'Venus recreándose con el Amor y la Música', 'Tiziano', 'Hacia el 1554', 'Óleo'),
(2, 2, 'Saturno con el signo de Capricornio', 'Pietro Facchetti', 'Siglo XVI', 'Óleo'),
(3, 1, 'La muerte de Lucrecia', 'Luca Cambiaso', 'Último tercio del siglo XVI', 'Óleo'),
(4, 2, 'Diana Cazadora', 'Pedro Pablo Rubens', '1617 - 1620', 'Óleo'),
(5, 3, 'El bufón Calabacillas', 'Velázquez', '1635-1639', 'Óleo'),
(6, 3, 'Ceres y dos ninfas', 'Pedro Pablo Rubens', '1615-1617', 'Óleo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exposicion`
--

CREATE TABLE `exposicion` (
  `id` int(11) NOT NULL,
  `titulo` varchar(150) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `exposicion`
--

INSERT INTO `exposicion` (`id`, `titulo`) VALUES
(1, 'Velázquez y el Siglo de Oro'),
(2, 'Arte y mito. Los dioses del Prado'),
(3, 'De gira por España');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cuadro`
--
ALTER TABLE `cuadro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expo` (`expo`);

--
-- Indices de la tabla `exposicion`
--
ALTER TABLE `exposicion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuadro`
--
ALTER TABLE `cuadro`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `exposicion`
--
ALTER TABLE `exposicion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuadro`
--
ALTER TABLE `cuadro`
  ADD CONSTRAINT `expo` FOREIGN KEY (`expo`) REFERENCES `exposicion` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
