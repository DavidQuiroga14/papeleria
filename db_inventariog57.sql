-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_inventario_g55
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_inventario_g55
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_inventario_g55` DEFAULT CHARACTER SET utf8 ;
USE `db_inventario_g55` ;

-- -----------------------------------------------------
-- Table `db_inventario_g55`.`tipo_contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario_g55`.`tipo_contacto` (
  `id_tipo_contacto` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo_contacto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario_g55`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario_g55`.`clientes` (
  `id_clientes` INT NOT NULL AUTO_INCREMENT,
  `tipo_documento` VARCHAR(45) NULL,
  `numero_documento` VARCHAR(45) NULL,
  `nombres` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  PRIMARY KEY (`id_clientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario_g55`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario_g55`.`proveedores` (
  `id_proveedores` INT NOT NULL AUTO_INCREMENT,
  `tipo_documento` VARCHAR(45) NULL,
  `numero_documento` VARCHAR(45) NULL,
  `nombres` VARCHAR(120) NULL,
  `apellidos` VARCHAR(120) NULL,
  PRIMARY KEY (`id_proveedores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario_g55`.`contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario_g55`.`contacto` (
  `id_contacto` INT NOT NULL AUTO_INCREMENT,
  `contacto` VARCHAR(45) NULL,
  `clientes_id_clientes` INT NULL,
  `tipo_contacto_id_tipo_contacto` INT NOT NULL,
  `proveedores_id_proveedores` INT NULL,
  PRIMARY KEY (`id_contacto`),
  INDEX `fk_contacto_clientes_idx` (`clientes_id_clientes` ASC) VISIBLE,
  INDEX `fk_contacto_tipo_contacto1_idx` (`tipo_contacto_id_tipo_contacto` ASC) VISIBLE,
  INDEX `fk_contacto_proveedores1_idx` (`proveedores_id_proveedores` ASC) VISIBLE,
  CONSTRAINT `fk_contacto_clientes`
    FOREIGN KEY (`clientes_id_clientes`)
    REFERENCES `db_inventario_g55`.`clientes` (`id_clientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contacto_tipo_contacto1`
    FOREIGN KEY (`tipo_contacto_id_tipo_contacto`)
    REFERENCES `db_inventario_g55`.`tipo_contacto` (`id_tipo_contacto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contacto_proveedores1`
    FOREIGN KEY (`proveedores_id_proveedores`)
    REFERENCES `db_inventario_g55`.`proveedores` (`id_proveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario_g55`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario_g55`.`direccion` (
  `id_direccion` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `departamento` VARCHAR(45) NULL,
  `ciudad` VARCHAR(45) NULL,
  `tipo_direccion` VARCHAR(45) NULL,
  `clientes_id_clientes` INT NULL,
  `proveedores_id_proveedores` INT NULL,
  PRIMARY KEY (`id_direccion`),
  INDEX `fk_direccion_clientes1_idx` (`clientes_id_clientes` ASC) VISIBLE,
  INDEX `fk_direccion_proveedores1_idx` (`proveedores_id_proveedores` ASC) VISIBLE,
  CONSTRAINT `fk_direccion_clientes1`
    FOREIGN KEY (`clientes_id_clientes`)
    REFERENCES `db_inventario_g55`.`clientes` (`id_clientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_direccion_proveedores1`
    FOREIGN KEY (`proveedores_id_proveedores`)
    REFERENCES `db_inventario_g55`.`proveedores` (`id_proveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario_g55`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario_g55`.`producto` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_producto`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
