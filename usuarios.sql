-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-09-2025 a las 18:02:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `academia_stem`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `voto_realizado` tinyint(1) NOT NULL DEFAULT 0,
  `institucion_votada` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `contrasena`, `fecha_registro`, `voto_realizado`, `institucion_votada`) VALUES
(1, 'spider1234@gmail.com', '$2y$10$TgRQMq49lRyLA', '2025-09-01 05:08:25', 1, 'URN'),
(2, 'elchavo10@gmail.com', '$2y$10$2OcdqvH5uqZTv', '2025-09-01 05:09:26', 1, 'UACH'),
(3, 'fernandofederico@gmail.com', '$2y$10$VL.YoSQXXe7sZ', '2025-09-01 05:10:27', 1, 'ITCJ'),
(4, 'applications200@gmail.com', '$2y$10$OSRr/0UMwwiW6', '2025-09-01 05:11:12', 1, 'TEC'),
(5, 'nintendo23@gmail.com', '$2y$10$BPI/QDGjMsZ9T', '2025-09-01 05:11:34', 1, 'UACJ'),
(6, 'sonypictures23@gmail.com', '$2y$10$NCFBA0w71A6yj', '2025-09-01 05:12:09', 1, 'URN'),
(7, 'xboxmmm@gmail.com', '$2y$10$GWOgabnmXTplK', '2025-09-01 05:13:30', 1, 'UACJ'),
(8, 'netflixD999@gmail.com', '$2y$10$RHjcpaILk39UV', '2025-09-01 05:14:03', 1, 'ITCJ'),
(9, 'primevideo7677@gmail.com', '$2y$10$s8sf82Q5dl7F4', '2025-09-01 05:14:32', 1, 'UACJ'),
(10, 'webofshadows88@gmail.com', '$2y$10$j4tKRz9lDmROo', '2025-09-01 05:15:04', 1, 'UACJ'),
(22, 'betancio934@gmail.com', '$2y$10$HMiyBdR9bi5I6', '2025-09-01 15:25:52', 1, 'UACJ'),
(23, 'brayan@gmail.com', '$2y$10$YOZT44/Pv7oNn', '2025-09-01 15:30:01', 1, 'UACJ'),
(24, 'Uziel@gmail.com', '$2y$10$603V8elrFeKLG', '2025-09-01 15:31:45', 1, 'UACJ');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
