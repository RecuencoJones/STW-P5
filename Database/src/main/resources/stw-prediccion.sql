-- MySQL Script generated by MySQL Workbench
-- 04/06/15 18:57:35
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema stw-prediccion
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `stw-prediccion` ;

-- -----------------------------------------------------
-- Schema stw-prediccion
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `stw-prediccion` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
-- -----------------------------------------------------
-- Schema stw-prediccion
-- -----------------------------------------------------
USE `stw-prediccion` ;

-- -----------------------------------------------------
-- Table `stw-prediccion`.`Viento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stw-prediccion`.`Viento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(50) NOT NULL,
  `velocidad` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stw-prediccion`.`Intervalo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stw-prediccion`.`Intervalo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stw-prediccion`.`Periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stw-prediccion`.`Periodo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `intervalo` INT NOT NULL,
  `viento` INT NOT NULL,
  `p_precip` INT NOT NULL,
  `c_nieve` INT NOT NULL,
  `e_cielo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Periodo_Intervalo_idx` (`intervalo` ASC),
  INDEX `fk_Periodo_Viento1_idx` (`viento` ASC),
  CONSTRAINT `fk_Periodo_Intervalo`
    FOREIGN KEY (`intervalo`)
    REFERENCES `stw-prediccion`.`Intervalo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Periodo_Viento1`
    FOREIGN KEY (`viento`)
    REFERENCES `stw-prediccion`.`Viento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stw-prediccion`.`Dia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stw-prediccion`.`Dia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` MEDIUMTEXT NOT NULL,
  `uv_max` INT NOT NULL,
  `temp_max` INT NOT NULL,
  `temp_min` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stw-prediccion`.`Dia_has_Periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stw-prediccion`.`Dia_has_Periodo` (
  `dia` INT NOT NULL,
  `periodo` INT NOT NULL,
  PRIMARY KEY (`dia`, `periodo`),
  INDEX `fk_Dia_has_Periodo_Periodo1_idx` (`periodo` ASC),
  INDEX `fk_Dia_has_Periodo_Dia1_idx` (`dia` ASC),
  CONSTRAINT `fk_Dia_has_Periodo_Dia1`
    FOREIGN KEY (`dia`)
    REFERENCES `stw-prediccion`.`Dia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dia_has_Periodo_Periodo1`
    FOREIGN KEY (`periodo`)
    REFERENCES `stw-prediccion`.`Periodo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stw-prediccion`.`PrediccionSemana`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stw-prediccion`.`PrediccionSemana` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hora` INT NOT NULL,
  `fecha` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stw-prediccion`.`PrediccionSemana_has_Dia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stw-prediccion`.`PrediccionSemana_has_Dia` (
  `prediccionSemana` INT NOT NULL,
  `dia` INT NOT NULL,
  PRIMARY KEY (`prediccionSemana`, `dia`),
  INDEX `fk_PrediccionSemana_has_Dia_Dia1_idx` (`dia` ASC),
  INDEX `fk_PrediccionSemana_has_Dia_PrediccionSemana1_idx` (`prediccionSemana` ASC),
  CONSTRAINT `fk_PrediccionSemana_has_Dia_PrediccionSemana1`
    FOREIGN KEY (`prediccionSemana`)
    REFERENCES `stw-prediccion`.`PrediccionSemana` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PrediccionSemana_has_Dia_Dia1`
    FOREIGN KEY (`dia`)
    REFERENCES `stw-prediccion`.`Dia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stw-prediccion`.`Predicciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stw-prediccion`.`Predicciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fichero` VARCHAR(100) NOT NULL,
  `prediccionSemana` INT NOT NULL,
  INDEX `fk_Predicciones_PrediccionSemana1_idx` (`prediccionSemana` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Predicciones_PrediccionSemana1`
    FOREIGN KEY (`prediccionSemana`)
    REFERENCES `stw-prediccion`.`PrediccionSemana` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
