
DROP SCHEMA IF EXISTS `GraphProcessor` ;

-- -----------------------------------------------------
-- Schema GraphProcessor
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GraphProcessor` DEFAULT CHARACTER SET utf8 ;
USE `GraphProcessor` ;

-- -----------------------------------------------------
-- Table `GraphProcessor`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GraphProcessor`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(120) BINARY NOT NULL,
  `email` VARCHAR(120) NOT NULL,
  `phoneNumber` VARCHAR(45) NOT NULL,
  `isActive` TINYINT NOT NULL,
  `passwordHash` VARCHAR(120) NOT NULL,
  `createdAt` DATETIME NOT NULL DEFAULT NOW(),
  `role` ENUM("Person", "Admin") NOT NULL,
  `fullname` VARCHAR(45) NULL,
  `avatar` VARCHAR(45) NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_UNIQUE` (`phoneNumber` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GraphProcessor`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GraphProcessor`.`Admin` (
  `idAdmin` INT NOT NULL AUTO_INCREMENT,
  `User_idUser` INT NOT NULL,
  `departament` ENUM("CEO", "Developer", "System administrator") NOT NULL,
  `employeeId` INT NOT NULL,
  `permissions` JSON NOT NULL,
  PRIMARY KEY (`idAdmin`),
  INDEX `fk_Admin_User1_idx` (`User_idUser` ASC) VISIBLE,
  UNIQUE INDEX `employeeId_UNIQUE` (`employeeId` ASC) VISIBLE,
  CONSTRAINT `fk_Admin_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `GraphProcessor`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GraphProcessor`.`Person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GraphProcessor`.`Person` (
  `idPerson` INT NOT NULL AUTO_INCREMENT,
  `User_idUser` INT NOT NULL,
  `subscriptionPlan` ENUM("FREE", "PREMIUM") NOT NULL,
  `dateOfBirth` DATETIME NOT NULL,
  `avatar` VARCHAR(255) NULL,
  PRIMARY KEY (`idPerson`),
  INDEX `fk_Person_User1_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Person_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `GraphProcessor`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GraphProcessor`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GraphProcessor`.`Admin` (
  `idAdmin` INT NOT NULL AUTO_INCREMENT,
  `User_idUser` INT NOT NULL,
  `departament` ENUM("CEO", "Developer", "System administrator") NOT NULL,
  `employeeId` INT NOT NULL,
  `permissions` JSON NOT NULL,
  PRIMARY KEY (`idAdmin`),
  INDEX `fk_Admin_User1_idx` (`User_idUser` ASC) VISIBLE,
  UNIQUE INDEX `employeeId_UNIQUE` (`employeeId` ASC) VISIBLE,
  CONSTRAINT `fk_Admin_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `GraphProcessor`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GraphProcessor`.`Graph`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GraphProcessor`.`Graph` (
  `idGraph` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` MEDIUMTEXT NULL,
  `graphStructure` JSON NOT NULL,
  `createdAt` DATETIME NOT NULL DEFAULT NOW(),
  `Person_idPerson` INT NULL DEFAULT NULL,
  `Admin_idAdmin` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idGraph`),
  INDEX `fk_Graph_Person1_idx` (`Person_idPerson` ASC) VISIBLE,
  INDEX `fk_Graph_Admin1_idx` (`Admin_idAdmin` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  CONSTRAINT `fk_Graph_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `GraphProcessor`.`Person` (`idPerson`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Graph_Admin1`
    FOREIGN KEY (`Admin_idAdmin`)
    REFERENCES `GraphProcessor`.`Admin` (`idAdmin`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GraphProcessor`.`QueryResults`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GraphProcessor`.`QueryResults` (
  `idQueryResults` INT NOT NULL AUTO_INCREMENT,
  `Graph_idGraph` INT NOT NULL,
  `algorithm` VARCHAR(45) NOT NULL,
  `startVertex` VARCHAR(45) NOT NULL,
  `targetVertex` VARCHAR(45) NULL,
  `queryResult` JSON NOT NULL,
  `createdAt` DATETIME NOT NULL DEFAULT NOW(),
  `executionTime` INT NOT NULL,
  PRIMARY KEY (`idQueryResults`),
  INDEX `fk_QueryResults_Graph1_idx` (`Graph_idGraph` ASC) VISIBLE,
  CONSTRAINT `fk_QueryResults_Graph1`
    FOREIGN KEY (`Graph_idGraph`)
    REFERENCES `GraphProcessor`.`Graph` (`idGraph`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
