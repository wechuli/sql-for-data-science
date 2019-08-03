SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb`;

-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Customers` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `CustomerId` INT NOT NULL ,
  `FirstName` VARCHAR(40) NOT NULL ,
  `LastName` VARCHAR(40) NOT NULL ,
  `Street` VARCHAR(40) NOT NULL ,
  `City` VARCHAR(40) NOT NULL ,
  `State` CHAR(2) NOT NULL ,
  `Zip` VARCHAR(10) NOT NULL ,
  `Phone` VARCHAR(12) NOT NULL ,
  `CreditCardType` VARCHAR(10) NULL ,
  `CreditCardNumber` VARCHAR(20) NULL ,
  PRIMARY KEY (`CustomerId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `mydb`.`Customers`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `Customers` (`CustomerId`, `FirstName`, `LastName`, `Street`, `City`, `State`, `Zip`, `Phone`, `CreditCardType`, `CreditCardNumber`) VALUES (1, 'Hengis', 'Hapthorn', '17 Discriminator Wy', 'Olkney', 'CA', '93516-1827', '820-392-1928', 'MagicCard', '1234567890123456');

COMMIT;

-- -----------------------------------------------------
-- Table `mydb`.`OrderStatuses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`OrderStatuses` ;

CREATE TABLE IF NOT EXISTS `mydb`.`OrderStatuses` (
  `OrderStatus` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`OrderStatus`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `mydb`.`OrderStatuses`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `OrderStatuses` (`OrderStatus`) VALUES ('Ordered');
INSERT INTO `OrderStatuses` (`OrderStatus`) VALUES ('Paid');
INSERT INTO `OrderStatuses` (`OrderStatus`) VALUES ('Back Ordered');
INSERT INTO `OrderStatuses` (`OrderStatus`) VALUES ('Shipped');

COMMIT;

-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Orders` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `OrderId` INT NOT NULL ,
  `CustomerId` INT NOT NULL ,
  `Date` DATE NOT NULL ,
  `OrderStatus` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`OrderId`) ,
  INDEX FK_Orders_CustomerId (`CustomerId` ASC) ,
  INDEX FK_Orders_OrderStatus (`OrderStatus` ASC) ,
  CONSTRAINT `FK_Orders_CustomerId`
    FOREIGN KEY (`CustomerId` )
    REFERENCES `mydb`.`Customers` (`CustomerId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Orders_OrderStatus`
    FOREIGN KEY (`OrderStatus` )
    REFERENCES `mydb`.`OrderStatuses` (`OrderStatus` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `mydb`.`Orders`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `Orders` (`OrderId`, `CustomerId`, `Date`, `OrderStatus`) VALUES (101, 1, '4-1-2008', 'Paid');

COMMIT;

-- -----------------------------------------------------
-- Table `mydb`.`InventoryItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`InventoryItems` ;

CREATE TABLE IF NOT EXISTS `mydb`.`InventoryItems` (
  `ItemId` INT NOT NULL ,
  `Description` VARCHAR(255) NOT NULL ,
  `Price` DECIMAL(10,2) NOT NULL ,
  `QuantityInStock` INT NOT NULL ,
  PRIMARY KEY (`ItemId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `mydb`.`InventoryItems`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `InventoryItems` (`ItemId`, `Description`, `Price`, `QuantityInStock`) VALUES (1, 'Notebook, 100 pages', 3.25, 10);
INSERT INTO `InventoryItems` (`ItemId`, `Description`, `Price`, `QuantityInStock`) VALUES (2, 'Cookie, dozen', 4.95, 144);
INSERT INTO `InventoryItems` (`ItemId`, `Description`, `Price`, `QuantityInStock`) VALUES (3, 'Peacock feather', 6.45, 21);
INSERT INTO `InventoryItems` (`ItemId`, `Description`, `Price`, `QuantityInStock`) VALUES (4, 'Pen, blue', 0.25, 36);

COMMIT;

-- -----------------------------------------------------
-- Table `mydb`.`OrderItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`OrderItems` ;

CREATE TABLE IF NOT EXISTS `mydb`.`OrderItems` (
  `OrderId` INT NOT NULL ,
  `SequenceNumber` INT NOT NULL ,
  `ItemId` INT NOT NULL ,
  `Quantity` INT NOT NULL ,
  PRIMARY KEY (`OrderId`, `SequenceNumber`) ,
  INDEX FK_OrderItems_OrderId (`OrderId` ASC) ,
  INDEX FK_OrderItems_ItemId (`ItemId` ASC) ,
  CONSTRAINT `FK_OrderItems_OrderId`
    FOREIGN KEY (`OrderId` )
    REFERENCES `mydb`.`Orders` (`OrderId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_OrderItems_ItemId`
    FOREIGN KEY (`ItemId` )
    REFERENCES `mydb`.`InventoryItems` (`ItemId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `mydb`.`OrderItems`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `OrderItems` (`OrderId`, `SequenceNumber`, `ItemId`, `Quantity`) VALUES (101, 1, 1, 2);
INSERT INTO `OrderItems` (`OrderId`, `SequenceNumber`, `ItemId`, `Quantity`) VALUES (101, 2, 3, 1);
INSERT INTO `OrderItems` (`OrderId`, `SequenceNumber`, `ItemId`, `Quantity`) VALUES (101, 3, 2, 6);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
