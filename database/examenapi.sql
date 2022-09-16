-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2022 a las 06:52:15
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `examenapi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Empresa1', '2022-09-16 09:17:58', '2022-09-16 09:17:58'),
(2, 'Empresa2', '2022-09-16 09:17:58', '2022-09-16 09:17:58'),
(3, 'empresa apple', '2022-09-16 09:17:58', '2022-09-16 09:38:16'),
(4, 'Empresa4', '2022-09-16 09:17:58', '2022-09-16 09:17:58'),
(5, 'Empresa5', '2022-09-16 09:17:58', '2022-09-16 09:17:58'),
(6, 'Microsoft', '2022-09-16 09:33:02', '2022-09-16 09:33:02'),
(7, 'Microsoft1', '2022-09-16 09:37:18', '2022-09-16 09:37:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_09_14_150005_create_empresas_table', 1),
(6, '2022_09_14_155902_create_tareas_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_u` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre_u` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_e` bigint(20) UNSIGNED NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_ven` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `nombre`, `descripcion`, `id_u`, `nombre_u`, `id_e`, `fecha_ini`, `fecha_ven`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Tarea1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s 1', 5, 'Usuario5', 5, '2022-09-14', '2022-09-18', 1, '2022-09-16 09:18:01', '2022-09-16 09:18:01'),
(2, 'Tarea2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s 2', 2, 'Usuario2', 1, '2022-09-14', '2022-09-18', 1, '2022-09-16 09:18:01', '2022-09-16 09:29:53'),
(3, 'Tarea3', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s 3', 5, 'Usuario5', 3, '2022-09-14', '2022-09-18', 0, '2022-09-16 09:18:01', '2022-09-16 09:18:01'),
(4, 'Tarea4', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s 4', 1, 'Usuario1', 3, '2022-09-14', '2022-09-18', 0, '2022-09-16 09:18:01', '2022-09-16 09:18:01'),
(5, 'Tarea5', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s 5', 5, 'Usuario5', 3, '2022-09-14', '2022-09-18', 1, '2022-09-16 09:18:01', '2022-09-16 09:18:01'),
(6, 'Tarea6', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s 6', NULL, 'Usuario sin asignar', 3, '2022-09-14', '2022-09-18', 1, '2022-09-16 09:18:01', '2022-09-16 09:18:01'),
(7, 'Tarea7', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s 7', NULL, 'Usuario sin asignar', 2, '2022-09-14', '2022-09-18', 0, '2022-09-16 09:18:01', '2022-09-16 09:18:01'),
(8, 'Tarea8', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s 8', NULL, 'Usuario sin asignar', 1, '2022-09-14', '2022-09-18', 1, '2022-09-16 09:18:01', '2022-09-16 09:18:01'),
(9, 'Tarea9', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s 9', NULL, 'Usuario sin asignar', 2, '2022-09-14', '2022-09-18', 1, '2022-09-16 09:18:01', '2022-09-16 09:18:01'),
(10, 'Tarea10', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s 10', NULL, 'Usuario sin asignar', 5, '2022-09-14', '2022-09-18', 0, '2022-09-16 09:18:01', '2022-09-16 09:18:01'),
(11, 'gestion de datos', 'descripcion de la tarea que se ara', 1, 'Usuario1', 2, '2022-09-14', '2022-09-18', 0, '2022-09-16 09:48:30', '2022-09-16 09:48:30'),
(12, 'gestion de datos', 'descripcion de la tarea que se ara', 1, 'Usuario1', 2, '2022-09-14', '2022-09-18', 0, '2022-09-16 09:49:16', '2022-09-16 09:49:16'),
(13, 'gestion de datos', 'descripcion de la tarea que se ara', 1, 'Usuario1', 2, '2022-09-14', '2022-09-18', 0, '2022-09-16 09:49:17', '2022-09-16 09:49:17'),
(14, 'gestion de datos', 'descripcion de la tarea que se ara', 1, 'Usuario1', 2, '2022-09-14', '2022-09-18', 0, '2022-09-16 09:49:18', '2022-09-16 09:49:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Usuario1', 'Usuario1@gmail.com', NULL, '$2y$10$j9UPATn7K30yOFZ8fh9uT.AGEFtWF0WwwSwyLRgzvXYM2XDRd0N7O', NULL, '2022-09-16 09:17:55', '2022-09-16 09:17:55'),
(2, 'Usuario2', 'Usuario2@gmail.com', NULL, '$2y$10$ZVc/jpthgTi6LbglmwK76.F8gTOpIMqsoT4Q/9V/pyln6Opzg36gS', NULL, '2022-09-16 09:17:55', '2022-09-16 09:17:55'),
(3, 'Usuario3', 'Usuario3@gmail.com', NULL, '$2y$10$xiAHCz2/mCLD899YVfomTOauZgZ.0bLWObs2RVMS3p8wk60GRYusa', NULL, '2022-09-16 09:17:55', '2022-09-16 09:17:55'),
(4, 'Usuario4', 'Usuario4@gmail.com', NULL, '$2y$10$zP6.a2nUz4ELczGXUfn3YOdg.QjXGZed23GTLFvVKUVt2vaJxrBIW', NULL, '2022-09-16 09:17:55', '2022-09-16 09:17:55'),
(5, 'Usuario5', 'Usuario5@gmail.com', NULL, '$2y$10$1uxRBOqhftiVpmBpp6Fk7eZZIYswRRg9E8JxyiuRR2k3i5BhHVjC6', NULL, '2022-09-16 09:17:55', '2022-09-16 09:17:55');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tareas_id_u_foreign` (`id_u`),
  ADD KEY `tareas_id_e_foreign` (`id_e`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_id_e_foreign` FOREIGN KEY (`id_e`) REFERENCES `empresas` (`id`),
  ADD CONSTRAINT `tareas_id_u_foreign` FOREIGN KEY (`id_u`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
