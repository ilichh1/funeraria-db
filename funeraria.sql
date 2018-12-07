-- Ilich Francisco Arredondo González
-- Viernes 7 de Diciembre
-- Modelo: Funeraria
-- Version: 1.0

-- -----------------------------------------------------
-- Eliminar la base de datos si ya existe
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `funeraria` ;

-- -----------------------------------------------------
-- Crear la base de datos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `funeraria` DEFAULT CHARACTER SET utf8 ;
USE `funeraria` ;

-- -----------------------------------------------------
-- Tabla`funeraria`.`c_ataud`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `funeraria`.`c_ataud` ;

CREATE TABLE IF NOT EXISTS `funeraria`.`c_ataud` (
  `id_ataud` INT NOT NULL,
  `nombre` VARCHAR(32) NULL,
  `descripcion` VARCHAR(255) NULL,
  `precio` DECIMAL(8,2) NULL,
  PRIMARY KEY (`id_ataud`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla`funeraria`.`c_ciudad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `funeraria`.`c_ciudad` ;

CREATE TABLE IF NOT EXISTS `funeraria`.`c_ciudad` (
  `id_ciudad` INT NOT NULL,
  `nombre` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id_ciudad`));


-- -----------------------------------------------------
-- Tabla`funeraria`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `funeraria`.`cliente` ;

CREATE TABLE IF NOT EXISTS `funeraria`.`cliente` (
  `id_cliente` INT NOT NULL,
  `nombres` VARCHAR(64) NOT NULL,
  `apellidos` VARCHAR(64) NOT NULL,
  `telefono` VARCHAR(16) NULL,
  `direccion` VARCHAR(255) NOT NULL,
  `email` VARCHAR(128) NULL,
  `fecha_nacimiento` DATE NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla`funeraria`.`c_pago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `funeraria`.`c_pago` ;

CREATE TABLE IF NOT EXISTS `funeraria`.`c_pago` (
  `id_pago` INT NOT NULL,
  `meses` INT NOT NULL,
  PRIMARY KEY (`id_pago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla`funeraria`.`c_urna`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `funeraria`.`c_urna` ;

CREATE TABLE IF NOT EXISTS `funeraria`.`c_urna` (
  `id_urna` INT NOT NULL,
  `nombre` VARCHAR(32) NULL,
  `descripcion` VARCHAR(255) NULL,
  `precio` DECIMAL(8,2) NULL,
  PRIMARY KEY (`id_urna`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla`funeraria`.`pago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `funeraria`.`pago` ;

CREATE TABLE IF NOT EXISTS `funeraria`.`pago` (
  `id_pago` INT NOT NULL,
  `id_venta` INT NOT NULL,
  `monto` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_pago`),
  INDEX `fk_pagoDeVenta_idx` (`id_venta` ASC) ,
  CONSTRAINT `fk_pagoDeVenta`
    FOREIGN KEY (`id_venta`)
    REFERENCES `funeraria`.`venta` (`id_venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla`funeraria`.`sucursal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `funeraria`.`sucursal` ;

CREATE TABLE IF NOT EXISTS `funeraria`.`sucursal` (
  `id_sucursal` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(64) NOT NULL,
  `ciudad` INT NOT NULL,
  PRIMARY KEY (`id_sucursal`),
  INDEX `fk_ciudadSucursal_idx` (`ciudad` ASC) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) ,
  CONSTRAINT `fk_ciudadSucursal`
    FOREIGN KEY (`ciudad`)
    REFERENCES `funeraria`.`c_ciudad` (`id_ciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla`funeraria`.`vendedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `funeraria`.`vendedor` ;

CREATE TABLE IF NOT EXISTS `funeraria`.`vendedor` (
  `id_vendedor` INT NOT NULL,
  `nombre` VARCHAR(32) NOT NULL,
  `apellidos` VARCHAR(32) NOT NULL,
  `telefono` VARCHAR(16) NOT NULL,
  `email` VARCHAR(64) NOT NULL,
  `fecha_ingreso` DATE NOT NULL,
  PRIMARY KEY (`id_vendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla`funeraria`.`venta`
-- Esta es la tabla principal. Tiene la mayor cantidad de
-- claves foraneas por que es la que se relaciona con todo.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `funeraria`.`venta` ;

CREATE TABLE IF NOT EXISTS `funeraria`.`venta` (
  `id_venta` INT NOT NULL,
  `vendedor` INT NOT NULL,
  `cliente` INT NOT NULL,
  `beneficiario` VARCHAR(128) NULL,
  `uso_inmediato` TINYINT NOT NULL,
  `diferido_en` INT NULL,
  `tipo_ataud` INT NULL,
  `tipo_urna` INT NULL,
  `en_domicilio` TINYINT NOT NULL,
  `sucursal` INT NOT NULL,
  `beneficiario` DATE NOT NULL,
  PRIMARY KEY (`id_venta`),
  INDEX `fk_ventaTipoPago_idx` (`diferido_en` ASC),
  INDEX `fk_tipoUrna_idx` (`tipo_urna` ASC) ,
  INDEX `fk_ventaEnSucursal_idx` (`sucursal` ASC) ,
  INDEX `fk_tipoAtaud_idx` (`tipo_ataud` ASC) ,
  INDEX `fk_vendedor_idx` (`vendedor` ASC) ,
  INDEX `fk_cliente_idx` (`cliente` ASC) ,
  CONSTRAINT `fk_ventaTipoPago`
    FOREIGN KEY (`diferido_en`)
    REFERENCES `funeraria`.`c_pago` (`id_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipoUrna`
    FOREIGN KEY (`tipo_urna`)
    REFERENCES `funeraria`.`c_urna` (`id_urna`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventaEnSucursal`
    FOREIGN KEY (`sucursal`)
    REFERENCES `funeraria`.`sucursal` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipoAtaud`
    FOREIGN KEY (`tipo_ataud`)
    REFERENCES `funeraria`.`c_ataud` (`id_ataud`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendedor`
    FOREIGN KEY (`vendedor`)
    REFERENCES `funeraria`.`vendedor` (`id_vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente`
    FOREIGN KEY (`cliente`)
    REFERENCES `funeraria`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
