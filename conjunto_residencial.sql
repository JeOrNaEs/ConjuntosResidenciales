-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2024 at 01:44 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `conjunto_residencial`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartamento`
--

CREATE TABLE `apartamento` (
  `id_apartamento` int(11) NOT NULL,
  `numero_apartamento` varchar(10) NOT NULL,
  `torre` varchar(50) NOT NULL,
  `area` float NOT NULL,
  `numero_habitaciones` int(11) NOT NULL,
  `numero_banos` int(11) NOT NULL,
  `id_residente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apartamento`
--

INSERT INTO `apartamento` (`id_apartamento`, `numero_apartamento`, `torre`, `area`, `numero_habitaciones`, `numero_banos`, `id_residente`) VALUES
(1, '101', 'Torre A', 75.5, 3, 2, 1),
(5, '202', '20', 55, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `evento`
--

CREATE TABLE `evento` (
  `id_evento` int(11) NOT NULL,
  `nombre_evento` varchar(100) NOT NULL,
  `fecha_evento` date NOT NULL,
  `descripcion` text DEFAULT NULL,
  `id_residente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evento`
--

INSERT INTO `evento` (`id_evento`, `nombre_evento`, `fecha_evento`, `descripcion`, `id_residente`) VALUES
(1, 'Reunion de copropietarios', '2024-08-15', 'Reunion general de copropietarios para discutir temas del conjunto.', 1),
(4, 'Reunion de copropietarios', '2024-08-15', 'Revision sobre los cambios en la estructura de la entrada', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `id_residente` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp(),
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pago`
--

INSERT INTO `pago` (`id_pago`, `id_residente`, `monto`, `fecha_pago`, `descripcion`) VALUES
(1, 1, 500000.00, '2024-08-09 19:49:00', 'Pago de administración del mes de agosto'),
(3, 1, 87000.00, '2024-08-12 22:02:09', 'Pago administracion');

-- --------------------------------------------------------

--
-- Table structure for table `queja_sugerencia`
--

CREATE TABLE `queja_sugerencia` (
  `id_queja` int(11) NOT NULL,
  `id_residente` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `queja_sugerencia`
--

INSERT INTO `queja_sugerencia` (`id_queja`, `id_residente`, `tipo`, `descripcion`, `fecha`) VALUES
(1, 1, 'Queja', 'Ruido constante en la noche en el apartamento vecino.', '2024-08-09 19:49:00'),
(6, 1, 'Queja', 'Peleas fuertes en la torre 20 en el apartamento 201', '2024-08-12 22:07:17');

-- --------------------------------------------------------

--
-- Table structure for table `residente`
--

CREATE TABLE `residente` (
  `id_residente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `numero_documento` varchar(20) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `residente`
--

INSERT INTO `residente` (`id_residente`, `nombre`, `apellido`, `tipo_documento`, `numero_documento`, `telefono`, `email`, `fecha_registro`) VALUES
(1, 'Juan', 'Pérez', 'CC', '1234567890', '3001234567', 'juan.perez@example.com', '2024-08-09 19:48:59'),
(3, 'Luz Marina', 'Espinosa Munoz', 'CC', '39541404', '3123901184', 'luzma.espinosa46@gmail.com', '2024-08-12 22:18:57');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `id_residente` int(11) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_usuario`, `contrasena`, `id_residente`, `correo`, `fecha_creacion`) VALUES
(1, 'juan_perez', '123', 1, 'juan.perez@example.com', '2024-08-12 19:39:24'),
(2, 'LuzMa', '123', 1, 'luzma.espinosa46@gmail.com', '2024-08-12 20:12:57'),
(3, 'JerNava', '123', 3, 'jerson_023@outlook.es', '2024-08-12 23:07:16');

-- --------------------------------------------------------

--
-- Table structure for table `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id_vehiculo` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `id_residente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehiculo`
--

INSERT INTO `vehiculo` (`id_vehiculo`, `placa`, `marca`, `modelo`, `color`, `id_residente`) VALUES
(1, 'ABC123', 'Toyota', 'Corolla', 'Dorado', 1),
(5, 'JER122', 'Toyota', 'Prado', 'Dorado', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartamento`
--
ALTER TABLE `apartamento`
  ADD PRIMARY KEY (`id_apartamento`),
  ADD UNIQUE KEY `numero_apartamento` (`numero_apartamento`),
  ADD KEY `id_residente` (`id_residente`);

--
-- Indexes for table `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `id_residente` (`id_residente`);

--
-- Indexes for table `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_residente` (`id_residente`);

--
-- Indexes for table `queja_sugerencia`
--
ALTER TABLE `queja_sugerencia`
  ADD PRIMARY KEY (`id_queja`),
  ADD KEY `id_residente` (`id_residente`);

--
-- Indexes for table `residente`
--
ALTER TABLE `residente`
  ADD PRIMARY KEY (`id_residente`),
  ADD UNIQUE KEY `numero_documento` (`numero_documento`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `id_residente` (`id_residente`);

--
-- Indexes for table `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id_vehiculo`),
  ADD UNIQUE KEY `placa` (`placa`),
  ADD KEY `id_residente` (`id_residente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apartamento`
--
ALTER TABLE `apartamento`
  MODIFY `id_apartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `queja_sugerencia`
--
ALTER TABLE `queja_sugerencia`
  MODIFY `id_queja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `residente`
--
ALTER TABLE `residente`
  MODIFY `id_residente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apartamento`
--
ALTER TABLE `apartamento`
  ADD CONSTRAINT `apartamento_ibfk_1` FOREIGN KEY (`id_residente`) REFERENCES `residente` (`id_residente`);

--
-- Constraints for table `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_residente`) REFERENCES `residente` (`id_residente`);

--
-- Constraints for table `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_residente`) REFERENCES `residente` (`id_residente`);

--
-- Constraints for table `queja_sugerencia`
--
ALTER TABLE `queja_sugerencia`
  ADD CONSTRAINT `queja_sugerencia_ibfk_1` FOREIGN KEY (`id_residente`) REFERENCES `residente` (`id_residente`);

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_residente`) REFERENCES `residente` (`id_residente`);

--
-- Constraints for table `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`id_residente`) REFERENCES `residente` (`id_residente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
