-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 09-07-2018 a las 03:42:31
-- Versión del servidor: 5.7.22-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `posts`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfils`
--

CREATE TABLE `perfils` (
  `id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfils`
--

INSERT INTO `perfils` (`id`, `created`, `modified`, `description`, `name`) VALUES
(1, '2018-07-01 18:56:28', '2018-07-01 18:56:28', 'admins', 'Administrador'),
(2, '2018-07-03 02:09:33', '2018-07-03 02:09:33', 'gerente', 'Gerente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `projects`
--

INSERT INTO `projects` (`id`, `created`, `modified`, `description`, `name`) VALUES
(1, '2018-07-03 02:13:35', '2018-07-03 02:13:35', 'reportería', 'SAM'),
(2, '2018-07-08 19:31:39', '2018-07-08 19:31:39', 'WS-TEF', 'Ripley');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `duration` double NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `project_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`id`, `created`, `modified`, `description`, `duration`, `name`, `project_id`) VALUES
(1, '2018-07-03 02:16:23', '2018-07-08 22:07:04', 'reportería bcs para valenzuela', 5, 'BCS', 1),
(2, '2018-07-03 02:16:43', '2018-07-03 02:16:43', 'reportería caja para gutierrez', 3, 'CAJA', 1),
(4, '2018-07-08 21:10:28', '2018-07-08 21:54:41', 'crear SP vcalor cuota', 6, 'SP vcalor cuota', 1),
(5, '2018-07-08 21:12:11', '2018-07-08 21:12:11', 'crear ctm', 6, 'ctm', 2),
(6, '2018-07-08 21:12:28', '2018-07-08 21:12:28', 'migrar sp a rest', 2, 'ws', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks_users`
--

CREATE TABLE `tasks_users` (
  `user_id` bigint(20) NOT NULL,
  `task_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tasks_users`
--

INSERT INTO `tasks_users` (`user_id`, `task_id`) VALUES
(1, 1),
(2, 1),
(1, 2),
(3, 4),
(2, 5),
(3, 5),
(4, 6),
(5, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `perfil_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `created`, `modified`, `name`, `surname`, `perfil_id`) VALUES
(1, '2018-07-03 02:11:02', '2018-07-08 22:08:47', 'Rodrigo', 'Rivero', 1),
(2, '2018-07-03 02:11:23', '2018-07-08 22:11:01', 'Andrés', 'Sáez', 2),
(3, '2018-07-08 19:22:59', '2018-07-08 22:06:15', 'Felipe', 'Olavarría', 2),
(4, '2018-07-08 19:23:11', '2018-07-08 22:11:29', 'Gonzalo', 'González', 2),
(5, '2018-07-08 19:23:34', '2018-07-08 22:11:34', 'Christian', 'Díaz', 2),
(6, '2018-07-09 00:59:16', '2018-07-09 00:59:16', 'Rodrigo', 'Díaz', 2),
(7, '2018-07-09 01:01:27', '2018-07-09 01:01:27', 'Rodrigo', 'bellakotez', 2),
(8, '2018-07-09 02:36:58', '2018-07-09 02:36:58', 'Juan', 'Díaz', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `perfils`
--
ALTER TABLE `perfils`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKsfhn82y57i3k9uxww1s007acc` (`project_id`);

--
-- Indices de la tabla `tasks_users`
--
ALTER TABLE `tasks_users`
  ADD PRIMARY KEY (`user_id`,`task_id`),
  ADD KEY `FKt2mvoymx38r8iybah8853ifv4` (`task_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKewyrpk1qixgk16l341eb4igap` (`perfil_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `perfils`
--
ALTER TABLE `perfils`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `FKsfhn82y57i3k9uxww1s007acc` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Filtros para la tabla `tasks_users`
--
ALTER TABLE `tasks_users`
  ADD CONSTRAINT `FKnvu8guschqrte5nigrdj4hyjd` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKt2mvoymx38r8iybah8853ifv4` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKewyrpk1qixgk16l341eb4igap` FOREIGN KEY (`perfil_id`) REFERENCES `perfils` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
