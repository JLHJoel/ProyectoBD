-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql205.infinityfree.com
-- Generation Time: Nov 22, 2024 at 05:02 PM
-- Server version: 10.6.19-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_37758289_resenas_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `calificacion`
--

CREATE TABLE `calificacion` (
  `id_calificacion` int(11) NOT NULL,
  `nombre_calificador` varchar(100) NOT NULL,
  `id_pelicula` int(11) NOT NULL,
  `comentario_calif` text NOT NULL,
  `calificacion` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `calificacion`
--

INSERT INTO `calificacion` (`id_calificacion`, `nombre_calificador`, `id_pelicula`, `comentario_calif`, `calificacion`) VALUES
(4, 'Joel Lozano', 1, 'asdsadasdasdsad', 10),
(5, 'Joel Lozano', 1, 'sdsadasdsadasdas', 10),
(6, 'Juan', 3, 'dasdsadsadas', 8);

-- --------------------------------------------------------

--
-- Table structure for table `peliculas`
--

CREATE TABLE `peliculas` (
  `id_pelicula` int(11) NOT NULL,
  `nombre_pelicula` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `duracion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `director_pelicula` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sinopsis_pelicula` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_de_estreno` varchar(100) NOT NULL,
  `icono` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `peliculas`
--

INSERT INTO `peliculas` (`id_pelicula`, `nombre_pelicula`, `duracion`, `director_pelicula`, `sinopsis_pelicula`, `fecha_de_estreno`, `icono`) VALUES
(1, 'El lobo de Wall Street.', '2h 59min.', 'Martin Charles Scorsese.', 'Basada en hechos reales, la película sigue la historia de Jordan Belfort, un ambicioso corredor de bolsa que, después de un comienzo modesto en Wall Street, construye un imperio de inversión basado en la corrupción, el fraude y el engaño. Junto con su equipo de compañeros igualmente inescrupulosos, Belfort vive una vida llena de excesos, drogas, fiestas y comportamientos destructivos, todo mientras evade las autoridades. A lo largo de la película, se muestra el ascenso meteórico de Belfort y su caída inevitable cuando su mundo de lujo y engaños se desploma. El filme explora temas de codicia, corrupción y el lado oscuro del sueño americano, todo en un estilo audaz y controversial, con un toque de comedia y drama.', '10 de enero de 2014.', 'https://i.pinimg.com/736x/e4/f7/36/e4f736f717cf4c7737f698c2d8ff117d.jpg'),
(2, 'El Conjuro.', '1h 52min.', 'James Wan.', 'Basada en hechos reales, los investigadores paranormales Ed y Lorraine Warren son llamados a investigar una mansión en Rhode Island donde una familia es aterrorizada por fuerzas malignas. A medida que descubren los secretos oscuros de la casa, deben enfrentarse a un poder demoníaco cada vez más peligroso.', '19 de julio de 2013.', 'https://i.pinimg.com/736x/14/2c/68/142c687c979283e65f73788d1556604e.jpg'),
(3, 'Interestelar.', '2h 49min.', 'Christopher Nolan.', 'En un futuro cercano, la Tierra está al borde de la extinción debido a plagas y el agotamiento de los recursos. Un grupo de astronautas emprende un viaje a través de un agujero de gusano en busca de un nuevo hogar para la humanidad, enfrentándose a desafíos cósmicos y emociones profundas a lo largo del camino.', '7 de noviembre de 2014.', 'https://i.pinimg.com/736x/c2/18/cd/c218cd5ae39666ecb93c3285f98597b8.jpg'),
(4, 'La La Land.', '2h 8min.', 'Damien Chazelle.', 'La historia sigue a Mia, una aspirante a actriz, y Sebastian, un pianista de jazz, mientras se enamoran en Los Ángeles. Ambos deben enfrentar las dificultades de perseguir sus sueños mientras intentan mantener su relación en medio del sacrificio personal y profesional.', '9 de diciembre de 2016.', 'https://i.pinimg.com/enabled_lo_mid/736x/c8/24/38/c824388e37094fedee2441e8af54e831.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`id_calificacion`),
  ADD KEY `id_pelicula` (`id_pelicula`);

--
-- Indexes for table `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id_pelicula`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `id_calificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id_pelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `calificacion`
--
ALTER TABLE `calificacion`
  ADD CONSTRAINT `calificacion_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `peliculas` (`id_pelicula`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
