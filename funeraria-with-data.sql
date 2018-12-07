-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 07, 2018 at 05:23 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `funeraria`
--

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombres` varchar(64) NOT NULL,
  `apellidos` varchar(64) NOT NULL,
  `telefono` varchar(16) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombres`, `apellidos`, `telefono`, `direccion`, `email`, `fecha_nacimiento`) VALUES
(1, 'Ilich', 'Arredondo', '3333333333', 'Calle 123, Colonia, Guadalajra, Jalisco', 'ilichh1@hotmail.com', '1998-06-26'),
(2, 'Juan', 'Perez', '3319842244', 'Pinos 231, Los Halcones, Zapopan, Jalisco', 'juan.perez@mail.com', '1989-03-06'),
(3, 'Roberto Gil', 'Preciado Nuño', '5512905677', 'Presidentes 45, Zona Centro, CDMX', 'roberto.g.preciado@gmail.com', '1969-07-30');

-- --------------------------------------------------------

--
-- Table structure for table `c_ataud`
--

CREATE TABLE `c_ataud` (
  `id_ataud` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_ataud`
--

INSERT INTO `c_ataud` (`id_ataud`, `nombre`, `descripcion`, `precio`) VALUES
(1, 'Caoba', 'Un elegante ataúd de caoba rojiza. Importado desde belice.', '15989.99'),
(2, 'Pino', 'Ataúd fabricado 100% con materiales naturales. Recuerde a sus seres queridos conservando la naturaleza.', '14999.00'),
(3, 'Roble', 'Con detalles hechos a mano, haga que sus seres queridos descansen en lujo.', '21599.99');

-- --------------------------------------------------------

--
-- Table structure for table `c_ciudad`
--

CREATE TABLE `c_ciudad` (
  `id_ciudad` int(11) NOT NULL,
  `nombre` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_ciudad`
--

INSERT INTO `c_ciudad` (`id_ciudad`, `nombre`) VALUES
(1, 'Tlajomulco'),
(2, 'Zapopan'),
(3, 'Guadalajara'),
(4, 'Zapopan'),
(5, 'Tlaquepaque'),
(6, 'Los Mochis'),
(7, 'Mazatlán');

-- --------------------------------------------------------

--
-- Table structure for table `c_pago`
--

CREATE TABLE `c_pago` (
  `id_pago` int(11) NOT NULL,
  `meses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_pago`
--

INSERT INTO `c_pago` (`id_pago`, `meses`) VALUES
(1, 3),
(2, 6),
(3, 8),
(4, 12),
(5, 18),
(6, 24);

-- --------------------------------------------------------

--
-- Table structure for table `c_urna`
--

CREATE TABLE `c_urna` (
  `id_urna` int(11) NOT NULL,
  `nombre` varchar(32) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_urna`
--

INSERT INTO `c_urna` (`id_urna`, `nombre`, `descripcion`, `precio`) VALUES
(1, 'Cristal', 'Una hermosa urna de cristal tanslúcido para contemplar los restos de su amado.', '9999.99'),
(2, 'Metálica', 'Urna hermetica para llevar a sus últimos deseos a aquella persona...', '4599.89'),
(3, 'Madera', 'Elija entre una variedad de barnizados para tener cerca las cenizas de su muertito.', '2299.60');

-- --------------------------------------------------------

--
-- Table structure for table `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sucursal`
--

INSERT INTO `sucursal` (`id_sucursal`, `nombre`, `ciudad`) VALUES
(6, 'Nueva Central', 5),
(7, 'Centro', 1),
(8, 'Virgen de Guadalupe', 2),
(9, 'Niños Héroes', 3),
(10, 'Culichis', 6),
(11, 'Malecon', 7);

-- --------------------------------------------------------

--
-- Table structure for table `vendedor`
--

CREATE TABLE `vendedor` (
  `id_vendedor` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `apellidos` varchar(32) NOT NULL,
  `telefono` varchar(16) NOT NULL,
  `email` varchar(64) NOT NULL,
  `fecha_ingreso` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendedor`
--

INSERT INTO `vendedor` (`id_vendedor`, `nombre`, `apellidos`, `telefono`, `email`, `fecha_ingreso`) VALUES
(1, 'Sonia', 'Flores', '3392056668', 'sonia.flores@funeraria.com', '2006-05-18'),
(2, 'Martin', 'Martinez', '5513459022', 'martin.martinez@funeraria.com', '2001-11-09'),
(3, 'Esteban', 'De La Torre', '4446712908', 'esteban.torre@funeraria.com', '1999-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `vendedor` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `beneficiario` varchar(128) DEFAULT NULL,
  `uso_inmediato` tinyint(4) NOT NULL,
  `diferido_en` int(11) DEFAULT NULL,
  `tipo_ataud` int(11) DEFAULT NULL,
  `tipo_urna` int(11) DEFAULT NULL,
  `en_domicilio` tinyint(4) NOT NULL,
  `sucursal` int(11) NOT NULL,
  `fecha_venta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `venta`
--

INSERT INTO `venta` (`id_venta`, `vendedor`, `cliente`, `beneficiario`, `uso_inmediato`, `diferido_en`, `tipo_ataud`, `tipo_urna`, `en_domicilio`, `sucursal`, `fecha_venta`) VALUES
(1, 1, 1, NULL, 0, 4, 3, 2, 0, 7, '2012-06-27'),
(2, 2, 2, 'Martina Coque Hernandez', 1, NULL, 3, NULL, 1, 6, '2018-11-30'),
(3, 1, 3, NULL, 0, 4, 3, 2, 0, 7, '2012-06-27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `c_ataud`
--
ALTER TABLE `c_ataud`
  ADD PRIMARY KEY (`id_ataud`);

--
-- Indexes for table `c_ciudad`
--
ALTER TABLE `c_ciudad`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indexes for table `c_pago`
--
ALTER TABLE `c_pago`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indexes for table `c_urna`
--
ALTER TABLE `c_urna`
  ADD PRIMARY KEY (`id_urna`);

--
-- Indexes for table `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `fk_pagoDeVenta_idx` (`id_venta`);

--
-- Indexes for table `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  ADD KEY `fk_ciudadSucursal_idx` (`ciudad`);

--
-- Indexes for table `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id_vendedor`);

--
-- Indexes for table `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `fk_ventaTipoPago_idx` (`diferido_en`),
  ADD KEY `fk_tipoUrna_idx` (`tipo_urna`),
  ADD KEY `fk_ventaEnSucursal_idx` (`sucursal`),
  ADD KEY `fk_tipoAtaud_idx` (`tipo_ataud`),
  ADD KEY `fk_vendedor_idx` (`vendedor`),
  ADD KEY `fk_cliente_idx` (`cliente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `c_ataud`
--
ALTER TABLE `c_ataud`
  MODIFY `id_ataud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `c_ciudad`
--
ALTER TABLE `c_ciudad`
  MODIFY `id_ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `c_pago`
--
ALTER TABLE `c_pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `c_urna`
--
ALTER TABLE `c_urna`
  MODIFY `id_urna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `id_vendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `fk_pagoDeVenta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `fk_ciudadSucursal` FOREIGN KEY (`ciudad`) REFERENCES `c_ciudad` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipoAtaud` FOREIGN KEY (`tipo_ataud`) REFERENCES `c_ataud` (`id_ataud`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipoUrna` FOREIGN KEY (`tipo_urna`) REFERENCES `c_urna` (`id_urna`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendedor` FOREIGN KEY (`vendedor`) REFERENCES `vendedor` (`id_vendedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ventaEnSucursal` FOREIGN KEY (`sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ventaTipoPago` FOREIGN KEY (`diferido_en`) REFERENCES `c_pago` (`id_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION;
