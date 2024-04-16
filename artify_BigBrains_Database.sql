-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema art_gallery
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `art_gallery` ;

-- -----------------------------------------------------
-- Schema art_gallery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `art_gallery` DEFAULT CHARACTER SET utf8mb4 ;
USE `art_gallery` ;

-- -----------------------------------------------------
-- Table `art_gallery`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`customers` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`customers` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `art_gallery`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`address` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`address` (
  `address_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_id` INT(11) NULL DEFAULT NULL,
  `street` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `state` VARCHAR(255) NULL DEFAULT NULL,
  `zipcode` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  INDEX `customer_id` (`customer_id` ASC) ,
  CONSTRAINT `address_ibfk_1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `art_gallery`.`customers` (`customer_id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `art_gallery`.`artists`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`artists` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`artists` (
  `artist_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `nationality` VARCHAR(255) NULL DEFAULT NULL,
  `style` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `art_gallery`.`art_pieces`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`art_pieces` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`art_pieces` (
  `art_piece_id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255)  NULL,
  `medium` VARCHAR(255) NULL DEFAULT NULL,
  `year_created` VARCHAR(255) NULL DEFAULT NULL,
  `price` INT(11) NULL DEFAULT NULL,
  `artist_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`art_piece_id`),
  INDEX `artist_id` (`artist_id` ASC) ,
  CONSTRAINT `art_pieces_ibfk_1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `art_gallery`.`artists` (`artist_id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `art_gallery`.`customer_art_pieces`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`customer_art_pieces` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`customer_art_pieces` (
  `customer_id` INT(11) NOT NULL,
  `art_piece_id` INT(11) NOT NULL,
  PRIMARY KEY (`customer_id`, `art_piece_id`),
  INDEX `art_piece_id` (`art_piece_id` ASC) ,
  CONSTRAINT `customer_art_pieces_ibfk_1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `art_gallery`.`customers` (`customer_id`)
    ON DELETE CASCADE,
  CONSTRAINT `customer_art_pieces_ibfk_2`
    FOREIGN KEY (`art_piece_id`)
    REFERENCES `art_gallery`.`art_pieces` (`art_piece_id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `art_gallery`.`sales_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`sales_status` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`sales_status` (
  `status_id` INT(11) NOT NULL AUTO_INCREMENT,
  `status_name` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`status_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `art_gallery`.`sales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`sales` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`sales` (
  `sale_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_id` INT(11) NULL DEFAULT NULL,
  `art_piece_id` INT(11) NULL DEFAULT NULL,
  `sale_date` DATE NULL DEFAULT NULL,
  `price` INT(11) NULL DEFAULT NULL,
  `status_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  INDEX `customer_id` (`customer_id` ASC) ,
  INDEX `art_piece_id` (`art_piece_id` ASC) ,
  INDEX `status_id` (`status_id` ASC) ,
  CONSTRAINT `sales_ibfk_1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `art_gallery`.`customers` (`customer_id`)
    ON DELETE CASCADE,
  CONSTRAINT `sales_ibfk_2`
    FOREIGN KEY (`art_piece_id`)
    REFERENCES `art_gallery`.`art_pieces` (`art_piece_id`)
    ON DELETE CASCADE,
  CONSTRAINT `sales_ibfk_3`
    FOREIGN KEY (`status_id`)
    REFERENCES `art_gallery`.`sales_status` (`status_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `art_gallery`.`payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`payment` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`payment` (
  `payment_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_id` INT(11) NULL DEFAULT NULL,
  `amount` INT(11) NULL DEFAULT NULL,
  `payment_date` DATE NULL DEFAULT NULL,
  `sales_sale_id` INT(11) NOT NULL,
  PRIMARY KEY (`payment_id`, `sales_sale_id`),
  INDEX `customer_id` (`customer_id` ASC) ,
  INDEX `fk_payment_sales1_idx` (`sales_sale_id` ASC) ,
  CONSTRAINT `payment_ibfk_1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `art_gallery`.`customers` (`customer_id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_payment_sales1`
    FOREIGN KEY (`sales_sale_id`)
    REFERENCES `art_gallery`.`sales` (`sale_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;






