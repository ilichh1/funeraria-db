SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nombres` varchar(64) NOT NULL,
  `apellidos` varchar(64) NOT NULL,
  `telefono` varchar(16) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL
);


INSERT INTO `cliente` (`id_cliente`, `nombres`, `apellidos`, `telefono`, `direccion`, `email`, `fecha_nacimiento`) VALUES
(1, 'Ilich', 'Arredondo', '3333333333', 'Calle 123, Colonia, Guadalajra, Jalisco', 'ilichh1@hotmail.com', '1998-06-26'),
(2, 'Juan', 'Perez', '3319842244', 'Pinos 231, Los Halcones, Zapopan, Jalisco', 'juan.perez@mail.com', '1989-03-06'),
(3, 'Roberto Gil', 'Preciado Nuño', '5512905677', 'Presidentes 45, Zona Centro, CDMX', 'roberto.g.preciado@gmail.com', '1969-07-30'),
(4, 'Jorge de Jesus', 'Sambrano García', '4619085577', 'Calle Bala 66, Colonia Zar, Los Mochis, Sinaloa.', NULL, '1943-06-25');


CREATE TABLE `c_ataud` (
  `id_ataud` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nombre` varchar(32) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(8,2) NOT NULL
);


INSERT INTO `c_ataud` (`id_ataud`, `nombre`, `descripcion`, `precio`) VALUES
(1, 'Caoba', 'Un elegante ataúd de caoba rojiza. Importado desde belice.', '15989.99'),
(2, 'Pino', 'Ataúd fabricado 100% con materiales naturales. Recuerde a sus seres queridos conservando la naturaleza.', '14999.00'),
(3, 'Roble', 'Con detalles hechos a mano, haga que sus seres queridos descansen en lujo.', '21599.99');


CREATE TABLE `c_ciudad` (
  `id_ciudad` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nombre` varchar(128) NOT NULL
);


INSERT INTO `c_ciudad` (`id_ciudad`, `nombre`) VALUES
(1, 'Tlajomulco'),
(2, 'Zapopan'),
(3, 'Guadalajara'),
(4, 'Zapopan'),
(5, 'Tlaquepaque'),
(6, 'Los Mochis'),
(7, 'Mazatlán');


CREATE TABLE `c_pago` (
  `id_pago` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `meses` int(11) NOT NULL
);


INSERT INTO `c_pago` (`id_pago`, `meses`) VALUES
(1, 3),
(2, 6),
(3, 8),
(4, 12),
(5, 18),
(6, 24);


CREATE TABLE `c_urna` (
  `id_urna` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nombre` varchar(32) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(8,2) DEFAULT NULL
);


INSERT INTO `c_urna` (`id_urna`, `nombre`, `descripcion`, `precio`) VALUES
(1, 'Cristal', 'Una hermosa urna de cristal tanslúcido para contemplar los restos de su amado.', '9999.99'),
(2, 'Metálica', 'Urna hermetica para llevar a sus últimos deseos a aquella persona...', '4599.89'),
(3, 'Madera', 'Elija entre una variedad de barnizados para tener cerca las cenizas de su muertito.', '2299.60');


CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `id_venta` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL
);

INSERT INTO `pago` (`id_pago`, `id_venta`, `monto`) VALUES
(1, '1', '1999.99'),
(2, '1', '2999.99'),
(3, '1', '3999.99'),
(4, '1', '999.99'),
(5, '2', '59399.19');


CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nombre` varchar(64) NOT NULL,
  `ciudad` int(11) NOT NULL
);


INSERT INTO `sucursal` (`id_sucursal`, `nombre`, `ciudad`) VALUES
(6, 'Nueva Central', 5),
(7, 'Centro', 1),
(8, 'Virgen de Guadalupe', 2),
(9, 'Niños Héroes', 3),
(10, 'Culichis', 6),
(11, 'Malecon', 7);


CREATE TABLE `vendedor` (
  `id_vendedor` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nombre` varchar(32) NOT NULL,
  `apellidos` varchar(32) NOT NULL,
  `telefono` varchar(16) NOT NULL,
  `email` varchar(64) NOT NULL,
  `fecha_ingreso` date NOT NULL
);


INSERT INTO `vendedor` (`id_vendedor`, `nombre`, `apellidos`, `telefono`, `email`, `fecha_ingreso`) VALUES
(1, 'Sonia', 'Flores', '3392056668', 'sonia.flores@funeraria.com', '2006-05-18'),
(2, 'Martin', 'Martinez', '5513459022', 'martin.martinez@funeraria.com', '2001-11-09'),
(3, 'Esteban', 'De La Torre', '4446712908', 'esteban.torre@funeraria.com', '1999-11-22');


CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
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
);


INSERT INTO `venta` (`id_venta`, `vendedor`, `cliente`, `beneficiario`, `uso_inmediato`, `diferido_en`, `tipo_ataud`, `tipo_urna`, `en_domicilio`, `sucursal`, `fecha_venta`) VALUES
(1, 1, 1, NULL, 0, 4, 3, 2, 0, 7, '2012-06-27'),
(2, 2, 2, 'Martina Coque Hernandez', 1, NULL, 3, NULL, 1, 6, '2018-11-30'),
(3, 1, 3, NULL, 0, 4, 3, 2, 0, 7, '2012-06-27');


ALTER TABLE `pago`
  ADD CONSTRAINT `fk_pagoDeVenta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `sucursal`
  ADD CONSTRAINT `fk_ciudadSucursal` FOREIGN KEY (`ciudad`) REFERENCES `c_ciudad` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `venta`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipoAtaud` FOREIGN KEY (`tipo_ataud`) REFERENCES `c_ataud` (`id_ataud`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipoUrna` FOREIGN KEY (`tipo_urna`) REFERENCES `c_urna` (`id_urna`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendedor` FOREIGN KEY (`vendedor`) REFERENCES `vendedor` (`id_vendedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ventaEnSucursal` FOREIGN KEY (`sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ventaTipoPago` FOREIGN KEY (`diferido_en`) REFERENCES `c_pago` (`id_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

SET FOREIGN_KEY_CHECKS = 1;

-- CONSULTA SIMPLE 1
SELECT nombres, apellidos, email, fecha_nacimiento FROM cliente;

-- CONSULTA SIMPLE 2 (Concatenar el nombre y el apellido)
SELECT
  CONCAT(vendedor.nombre, ' ', vendedor.apellidos) AS 'Nombre completo',
  telefono,
  email,
  fecha_ingreso
FROM vendedor
ORDER BY fecha_ingreso ASC;


-- CONSULTA SIMPLE 3 (Las sucursales que sean de Guadalajara)
SELECT nombre FROM sucursal WHERE ciudad = 3;

-- CONSULTA SIMPLE 4 (Las ventas que fueron de uso inmediato resumidas)
SELECT cliente, beneficiario, en_domicilio, fecha_venta FROM venta WHERE uso_inmediato = 1;

-- CONSULTA SIMPLE 5 (Los clientes que tienen más de 70 años y estan a punto de morirse)
SELECT
  CONCAT(nombres, ' ', apellidos) AS 'Nombre completo',
  email,
  telefono,
  TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS 'Edad'
FROM cliente
WHERE TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) > 70;

-- ----------------------------------------------------------------
--                    CONSULTAS MULTITABLA
-- ----------------------------------------------------------------

-- CONSULTA MULTITABLA 1 (Mostrar todas las sucursales con su nombre de ciudad)
SELECT
  sucursal.id_sucursal AS 'ID',
  sucursal.nombre AS 'Nombre de la sucursal',
  c_ciudad.nombre AS 'Ciudad de la sucursal'
FROM sucursal
INNER JOIN c_ciudad ON sucursal.ciudad = c_ciudad.id_ciudad;

-- CONSULTA MULTITABLA 2 (Todas la sucursales en Guadalajra, mostrando el nombre de la ciudad)
SELECT
  sucursal.nombre,
  c_ciudad.nombre
FROM sucursal
INNER JOIN c_ciudad ON sucursal.ciudad = c_ciudad.id_ciudad
WHERE sucursal.ciudad = 3;

-- CONSULTA MULTITABLA 3 (Mostrar ventas con los nombres de vendedor,
-- clientes y la fecha de la venta)
SELECT
  venta.id_venta,
  vendedor.nombre,
  cliente.nombres,
  venta.fecha_venta
FROM venta
INNER JOIN vendedor ON venta.vendedor = vendedor.id_vendedor
INNER JOIN cliente ON venta.cliente = cliente.id_cliente;

-- CONSULTA MULTITABLA 4 (Traer las ventas mostrando el nombre del cliente, tipo de ataud y sucursal)
SELECT
  CONCAT(cliente.nombres, ' ', cliente.apellidos) as 'Nombre',
    c_ataud.nombre as 'Tipo de ataud',
    sucursal.nombre as 'Sucursal',
    venta.fecha_venta as 'Fecha de venta'
FROM venta
INNER JOIN cliente ON venta.cliente = cliente.id_cliente
INNER JOIN c_ataud ON venta.tipo_ataud = c_ataud.id_ataud
INNER JOIN sucursal ON venta.sucursal = sucursal.id_sucursal;

-- CONSULTA MULTITABLA 5 (Mostrar las ventas con el vendedor, cliente, si son de uso inmediato,
-- la fecha de venta y ordenar por fecha de venta más reciente)
SELECT
  CONCAT(vendedor.nombre, ' ', vendedor.apellidos) as 'Vendedor',
  CONCAT(cliente.nombres, ' ', cliente.apellidos) as 'Cliente',
  IF(venta.uso_inmediato = 1, 'Sí', 'No') as 'Uso inmediato',
  c_ataud.nombre as 'Tipo de ataud',
  sucursal.nombre as 'Sucursal',
  venta.fecha_venta as 'Fecha de venta'
FROM venta
INNER JOIN vendedor ON venta.vendedor = vendedor.id_vendedor
INNER JOIN cliente ON venta.cliente = cliente.id_cliente
INNER JOIN c_ataud ON venta.tipo_ataud = c_ataud.id_ataud
INNER JOIN sucursal ON venta.sucursal = sucursal.id_sucursal
ORDER BY venta.fecha_venta DESC;

-- ----------------------------------------------------------------
--                    VISTAS
-- ----------------------------------------------------------------

-- VISTA 1
CREATE OR REPLACE VIEW ventas AS
SELECT
  CONCAT(vendedor.nombre, ' ', vendedor.apellidos) as 'Vendedor',
  CONCAT(cliente.nombres, ' ', cliente.apellidos) as 'Cliente',
  IF(venta.uso_inmediato = 1, 'Sí', 'No') as 'Uso inmediato',
  IF(venta.en_domicilio = 1, 'Sí', 'No') as 'Uso en domicilio',
  IF(venta.beneficiario = NULL, 'Sin Beneficiario', venta.beneficiario) as 'Beneficiario',
  CONCAT(c_pago.meses, ' meses') as 'Diferido en',
  c_ataud.nombre as 'Tipo de ataud',
  sucursal.nombre as 'Sucursal',
  venta.fecha_venta as 'Fecha de venta'
FROM venta
INNER JOIN vendedor ON venta.vendedor = vendedor.id_vendedor
INNER JOIN cliente ON venta.cliente = cliente.id_cliente
INNER JOIN c_pago ON venta.diferido_en = c_pago.id_pago
INNER JOIN c_ataud ON venta.tipo_ataud = c_ataud.id_ataud
INNER JOIN sucursal ON venta.sucursal = sucursal.id_sucursal
ORDER BY venta.fecha_venta DESC;

-- VISTA 2 (Vista de todos los pagos realizados por todos los clientes)
CREATE OR REPLACE VIEW pagos AS
SELECT
  pago.id_pago,
    c.cliente,
    pago.monto
FROM pago
INNER JOIN (
    SELECT
    venta.id_venta,
    CONCAT(cliente.nombres, ' ', cliente.apellidos) as 'cliente'
  FROM venta
  INNER JOIN cliente ON venta.cliente = cliente.id_cliente
) c ON pago.id_pago = c.id_venta;
