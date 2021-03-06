-- MySQL Script generated by MySQL Workbench
-- vie 14 dic 2018 17:14:43 WET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`laboratorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`laboratorio` (
  `codigo_lab` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `teléfono` VARCHAR(45) NOT NULL,
  `dirección` VARCHAR(45) NOT NULL,
  `responsable` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo_lab`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medicamento` (
  `codigo_med` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `receta` INT NOT NULL,
  `ud_stock` INT NOT NULL,
  `ud_vendidas` INT NOT NULL,
  `precio` DECIMAL NOT NULL,
  PRIMARY KEY (`codigo_med`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`laboratorio_fabrica_medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`laboratorio_fabrica_medicamento` (
  `codigo_lab` INT NOT NULL,
  `codigo_med` INT NOT NULL,
  PRIMARY KEY (`codigo_lab`, `codigo_med`),
  INDEX `fk_medicamento_idx` (`codigo_med` ASC),
  CONSTRAINT `fk_laboratorio`
    FOREIGN KEY (`codigo_lab`)
    REFERENCES `mydb`.`laboratorio` (`codigo_lab`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_medicamento`
    FOREIGN KEY (`codigo_med`)
    REFERENCES `mydb`.`medicamento` (`codigo_med`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`familia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`familia` (
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`familia_medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`familia_medicamento` (
  `nombre_familia` VARCHAR(45) NOT NULL,
  `codigo_med` INT NOT NULL,
  PRIMARY KEY (`nombre_familia`, `codigo_med`),
  INDEX `fk_medicamento_idx` (`codigo_med` ASC),
  CONSTRAINT `fk_familia`
    FOREIGN KEY (`nombre_familia`)
    REFERENCES `mydb`.`familia` (`nombre`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_medicamento`
    FOREIGN KEY (`codigo_med`)
    REFERENCES `mydb`.`medicamento` (`codigo_med`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente_convencional`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente_convencional` (
  `dni` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente_conv_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente_conv_compra` (
  `dni_cliente` VARCHAR(45) NOT NULL,
  `fecha_compra` DATETIME NOT NULL,
  `codigo_med` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`dni_cliente`, `fecha_compra`, `codigo_med`),
  INDEX `fk_medicamento_idx` (`codigo_med` ASC),
  CONSTRAINT `fk_medicamento`
    FOREIGN KEY (`codigo_med`)
    REFERENCES `mydb`.`medicamento` (`codigo_med`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cliente_conv`
    FOREIGN KEY (`dni_cliente`)
    REFERENCES `mydb`.`cliente_convencional` (`dni`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente_credito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente_credito` (
  `dni` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `cuenta_banco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente_cred_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente_cred_compra` (
  `dni_cliente` VARCHAR(45) NOT NULL,
  `codigo_med` INT NOT NULL,
  `fecha_compra` DATETIME NOT NULL,
  `fecha_pago` DATETIME NULL,
  `cantidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dni_cliente`, `codigo_med`, `fecha_compra`),
  INDEX `fk_medicamento_idx` (`codigo_med` ASC),
  CONSTRAINT `fk_medicamento`
    FOREIGN KEY (`codigo_med`)
    REFERENCES `mydb`.`medicamento` (`codigo_med`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cliente_cred`
    FOREIGN KEY (`dni_cliente`)
    REFERENCES `mydb`.`cliente_credito` (`dni`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`laboratorio`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`laboratorio` (`codigo_lab`, `nombre`, `teléfono`, `dirección`, `responsable`) VALUES (1, 'Labo La Laguna', '922112233', 'Calle Laguna ,1', 'Maria López');
INSERT INTO `mydb`.`laboratorio` (`codigo_lab`, `nombre`, `teléfono`, `dirección`, `responsable`) VALUES (2, 'Labo La Cuesta', '922445566', 'Calle Cuesta,  1', 'Sandra Pérez');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`medicamento`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`medicamento` (`codigo_med`, `nombre`, `tipo`, `receta`, `ud_stock`, `ud_vendidas`, `precio`) VALUES (1, 'ibuprofeno', 'pastilla', 0, 56, 2, 5,20);
INSERT INTO `mydb`.`medicamento` (`codigo_med`, `nombre`, `tipo`, `receta`, `ud_stock`, `ud_vendidas`, `precio`) VALUES (2, 'paracetamol', 'pastilla', 0, 32, 20, 6,00);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`laboratorio_fabrica_medicamento`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`laboratorio_fabrica_medicamento` (`codigo_lab`, `codigo_med`) VALUES (1, 1);
INSERT INTO `mydb`.`laboratorio_fabrica_medicamento` (`codigo_lab`, `codigo_med`) VALUES (2, 1);
INSERT INTO `mydb`.`laboratorio_fabrica_medicamento` (`codigo_lab`, `codigo_med`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`familia`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`familia` (`nombre`) VALUES ('antiinflamatorio');
INSERT INTO `mydb`.`familia` (`nombre`) VALUES ('analgésico');
INSERT INTO `mydb`.`familia` (`nombre`) VALUES ('antipirético');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`familia_medicamento`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`familia_medicamento` (`nombre_familia`, `codigo_med`) VALUES ('antiinflamatorio', 1);
INSERT INTO `mydb`.`familia_medicamento` (`nombre_familia`, `codigo_med`) VALUES ('analgésico', 2);
INSERT INTO `mydb`.`familia_medicamento` (`nombre_familia`, `codigo_med`) VALUES ('antipirético', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`cliente_convencional`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`cliente_convencional` (`dni`, `nombre`) VALUES ('111', 'Pedro');
INSERT INTO `mydb`.`cliente_convencional` (`dni`, `nombre`) VALUES ('222', 'Maria');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`cliente_conv_compra`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`cliente_conv_compra` (`dni_cliente`, `fecha_compra`, `codigo_med`, `cantidad`) VALUES ('111', '2018-01-06 21:00:03', DEFAULT, DEFAULT);
INSERT INTO `mydb`.`cliente_conv_compra` (`dni_cliente`, `fecha_compra`, `codigo_med`, `cantidad`) VALUES ('111', '2018-01-06 21:00:04', DEFAULT, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`cliente_credito`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`cliente_credito` (`dni`, `nombre`, `cuenta_banco`) VALUES ('333', 'Jose', 'ES123456');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`cliente_cred_compra`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`cliente_cred_compra` (`dni_cliente`, `codigo_med`, `fecha_compra`, `fecha_pago`, `cantidad`) VALUES ('333', 2, '2018-01-06 21:00:03', NULL, '2');

COMMIT;

