SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `ppet` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `ppet`;

-- -----------------------------------------------------
-- Table `ppet`.`Locations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`Locations` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`Locations` (
  `Location` VARCHAR(40) NOT NULL ,
  `MaximuParticipants` INT NOT NULL ,
  PRIMARY KEY (`Location`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`AnimalTypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`AnimalTypes` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`AnimalTypes` (
  `AnimalType` VARCHAR(40) NOT NULL ,
  PRIMARY KEY (`AnimalType`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `ppet`.`AnimalTypes`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `AnimalTypes` (`AnimalType`) VALUES ('Cat');
INSERT INTO `AnimalTypes` (`AnimalType`) VALUES ('Dog');
INSERT INTO `AnimalTypes` (`AnimalType`) VALUES ('Horse');
INSERT INTO `AnimalTypes` (`AnimalType`) VALUES ('Platypus');
INSERT INTO `AnimalTypes` (`AnimalType`) VALUES ('Fish');
INSERT INTO `AnimalTypes` (`AnimalType`) VALUES ('Snake');
INSERT INTO `AnimalTypes` (`AnimalType`) VALUES ('Rat');
INSERT INTO `AnimalTypes` (`AnimalType`) VALUES ('Mouse');
INSERT INTO `AnimalTypes` (`AnimalType`) VALUES ('Bird');
INSERT INTO `AnimalTypes` (`AnimalType`) VALUES ('Lizard');
INSERT INTO `AnimalTypes` (`AnimalType`) VALUES ('Turtle');

COMMIT;

-- -----------------------------------------------------
-- Table `ppet`.`StockLocations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`StockLocations` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`StockLocations` (
  `StockLocation` VARCHAR(40) NOT NULL ,
  PRIMARY KEY (`StockLocation`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `ppet`.`StockLocations`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `StockLocations` (`StockLocation`) VALUES ('A-12');
INSERT INTO `StockLocations` (`StockLocation`) VALUES ('B-12');
INSERT INTO `StockLocations` (`StockLocation`) VALUES ('C-12');
INSERT INTO `StockLocations` (`StockLocation`) VALUES ('A-20');
INSERT INTO `StockLocations` (`StockLocation`) VALUES ('B-20');

COMMIT;

-- -----------------------------------------------------
-- Table `ppet`.`ShelfLocations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`ShelfLocations` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`ShelfLocations` (
  `ShelfLocation` VARCHAR(40) NOT NULL ,
  PRIMARY KEY (`ShelfLocation`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `ppet`.`ShelfLocations`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `ShelfLocations` (`ShelfLocation`) VALUES ('A1');
INSERT INTO `ShelfLocations` (`ShelfLocation`) VALUES ('A2');
INSERT INTO `ShelfLocations` (`ShelfLocation`) VALUES ('A3');
INSERT INTO `ShelfLocations` (`ShelfLocation`) VALUES ('B1');
INSERT INTO `ShelfLocations` (`ShelfLocation`) VALUES ('B2');
INSERT INTO `ShelfLocations` (`ShelfLocation`) VALUES ('B3');
INSERT INTO `ShelfLocations` (`ShelfLocation`) VALUES ('C2');

COMMIT;

-- -----------------------------------------------------
-- Table `ppet`.`States`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`States` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`States` (
  `State` CHAR(2) NOT NULL ,
  PRIMARY KEY (`State`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `ppet`.`States`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `States` (`State`) VALUES ('CO');
INSERT INTO `States` (`State`) VALUES ('KS');
INSERT INTO `States` (`State`) VALUES ('WY');
INSERT INTO `States` (`State`) VALUES ('NE');
INSERT INTO `States` (`State`) VALUES ('UT');

COMMIT;

-- -----------------------------------------------------
-- Table `ppet`.`PhoneTypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`PhoneTypes` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`PhoneTypes` (
  `PhoneType` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`PhoneType`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `ppet`.`PhoneTypes`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `PhoneTypes` (`PhoneType`) VALUES ('Home');
INSERT INTO `PhoneTypes` (`PhoneType`) VALUES ('Work');
INSERT INTO `PhoneTypes` (`PhoneType`) VALUES ('Cell');
INSERT INTO `PhoneTypes` (`PhoneType`) VALUES ('Pager');

COMMIT;

-- -----------------------------------------------------
-- Table `ppet`.`CityStateZips`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`CityStateZips` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`CityStateZips` (
  `City` VARCHAR(40) NOT NULL ,
  `State` CHAR(2) NOT NULL ,
  `Zip` CHAR(5) NOT NULL ,
  PRIMARY KEY (`City`, `State`, `Zip`) ,
  INDEX FK_CityStateZips_State (`State` ASC) ,
  CONSTRAINT `FK_CityStateZips_State`
    FOREIGN KEY (`State` )
    REFERENCES `ppet`.`States` (`State` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `ppet`.`CityStateZips`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `CityStateZips` (`City`, `State`, `Zip`) VALUES ('Boulder', 'CO', '80301');
INSERT INTO `CityStateZips` (`City`, `State`, `Zip`) VALUES ('Boulder', 'CO', '80302');
INSERT INTO `CityStateZips` (`City`, `State`, `Zip`) VALUES ('Boulder', 'CO', '80303');
INSERT INTO `CityStateZips` (`City`, `State`, `Zip`) VALUES ('Boulder', 'CO', '80304');
INSERT INTO `CityStateZips` (`City`, `State`, `Zip`) VALUES ('Boulder', 'CO', '80305');
INSERT INTO `CityStateZips` (`City`, `State`, `Zip`) VALUES ('Longmont', 'CO', '80501');
INSERT INTO `CityStateZips` (`City`, `State`, `Zip`) VALUES ('Longmont', 'CO', '80502');
INSERT INTO `CityStateZips` (`City`, `State`, `Zip`) VALUES ('Longmont', 'CO', '80503');
INSERT INTO `CityStateZips` (`City`, `State`, `Zip`) VALUES ('Longmont', 'CO', '80504');

COMMIT;

-- -----------------------------------------------------
-- Table `ppet`.`Specialties`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`Specialties` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`Specialties` (
  `Specialty` VARCHAR(40) NOT NULL ,
  PRIMARY KEY (`Specialty`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `ppet`.`Specialties`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `Specialties` (`Specialty`) VALUES ('Cat');
INSERT INTO `Specialties` (`Specialty`) VALUES ('Dog');
INSERT INTO `Specialties` (`Specialty`) VALUES ('Horse');
INSERT INTO `Specialties` (`Specialty`) VALUES ('Reptile');
INSERT INTO `Specialties` (`Specialty`) VALUES ('Fish');
INSERT INTO `Specialties` (`Specialty`) VALUES ('Rodent');

COMMIT;

-- -----------------------------------------------------
-- Table `ppet`.`Courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`Courses` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`Courses` (
  `idCourse` INT NOT NULL AUTO_INCREMENT ,
  `Title` VARCHAR(45) NOT NULL ,
  `Description` VARCHAR(255) NOT NULL ,
  `Price` DECIMAL(10,2) NOT NULL ,
  `AnimalType` VARCHAR(40) NOT NULL ,
  PRIMARY KEY (`idCourse`) ,
  INDEX FK_Courses_AnimalType (`AnimalType` ASC) ,
  CONSTRAINT `FK_Courses_AnimalType`
    FOREIGN KEY (`AnimalType` )
    REFERENCES `ppet`.`AnimalTypes` (`AnimalType` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`Addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`Addresses` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`Addresses` (
  `idAddress` INT NOT NULL ,
  `Street` VARCHAR(45) NOT NULL ,
  `City` VARCHAR(45) NOT NULL ,
  `State` CHAR(2) NOT NULL ,
  `Zip` CHAR(5) NOT NULL ,
  PRIMARY KEY (`idAddress`) ,
  INDEX FK_Addresses_State (`State` ASC) ,
  INDEX FK_Addresses_CityStateZip (`City` ASC, `State` ASC, `Zip` ASC) ,
  CONSTRAINT `FK_Addresses_State`
    FOREIGN KEY (`State` )
    REFERENCES `ppet`.`States` (`State` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Addresses_CityStateZip`
    FOREIGN KEY (`City` , `State` , `Zip` )
    REFERENCES `ppet`.`CityStateZips` (`City` , `State` , `Zip` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`Persons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`Persons` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`Persons` (
  `idPerson` INT NOT NULL ,
  `FirstName` VARCHAR(45) NOT NULL ,
  `LastName` VARCHAR(45) NOT NULL ,
  `Email` VARCHAR(45) NULL ,
  `idAddress` INT NULL ,
  PRIMARY KEY (`idPerson`) ,
  INDEX PK_Persons_idAddress (`idAddress` ASC) ,
  CONSTRAINT `PK_Persons_idAddress`
    FOREIGN KEY (`idAddress` )
    REFERENCES `ppet`.`Addresses` (`idAddress` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`Employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`Employees` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`Employees` (
  `idEmployee` INT NOT NULL ,
  `idPerson` INT NOT NULL ,
  `SocialSecurityNumber` CHAR(11) NOT NULL ,
  PRIMARY KEY (`idEmployee`) ,
  INDEX FK_Employees_idPerson (`idPerson` ASC) ,
  CONSTRAINT `FK_Employees_idPerson`
    FOREIGN KEY (`idPerson` )
    REFERENCES `ppet`.`Persons` (`idPerson` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`CourseOfferings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`CourseOfferings` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`CourseOfferings` (
  `idCourseOffering` INT NOT NULL AUTO_INCREMENT ,
  `idCourse` INT NOT NULL ,
  `Time` TIME NOT NULL ,
  `Location` VARCHAR(40) NOT NULL ,
  `idInstructorEmployee` INT NULL ,
  PRIMARY KEY (`idCourseOffering`) ,
  INDEX FK_CourseOfferings_Location (`Location` ASC) ,
  INDEX FK_CourseOfferings_idCourse (`idCourse` ASC) ,
  INDEX FK_CourseOfferings_idinstructorEmployee (`idInstructorEmployee` ASC) ,
  CONSTRAINT `FK_CourseOfferings_Location`
    FOREIGN KEY (`Location` )
    REFERENCES `ppet`.`Locations` (`Location` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CourseOfferings_idCourse`
    FOREIGN KEY (`idCourse` )
    REFERENCES `ppet`.`Courses` (`idCourse` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CourseOfferings_idinstructorEmployee`
    FOREIGN KEY (`idInstructorEmployee` )
    REFERENCES `ppet`.`Employees` (`idEmployee` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`EmployeeSpecialties`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`EmployeeSpecialties` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`EmployeeSpecialties` (
  `idEmployee` INT NOT NULL ,
  `Specialty` VARCHAR(40) NOT NULL ,
  PRIMARY KEY (`idEmployee`, `Specialty`) ,
  INDEX FK_EmployeeSpecialties_Specialty (`Specialty` ASC) ,
  INDEX FK_EmployeeSpecialties_EmployeeId (`idEmployee` ASC) ,
  CONSTRAINT `FK_EmployeeSpecialties_Specialty`
    FOREIGN KEY (`Specialty` )
    REFERENCES `ppet`.`Specialties` (`Specialty` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EmployeeSpecialties_EmployeeId`
    FOREIGN KEY (`idEmployee` )
    REFERENCES `ppet`.`Employees` (`idEmployee` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`Phones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`Phones` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`Phones` (
  `idPerson` INT NOT NULL ,
  `Number` VARCHAR(12) NOT NULL ,
  `PhoneType` VARCHAR(40) NOT NULL ,
  PRIMARY KEY (`idPerson`, `Number`, `PhoneType`) ,
  INDEX FK_Phones_idPerson (`idPerson` ASC) ,
  INDEX FK_Phones_PhoneType (`PhoneType` ASC) ,
  CONSTRAINT `FK_Phones_idPerson`
    FOREIGN KEY (`idPerson` )
    REFERENCES `ppet`.`Persons` (`idPerson` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Phones_PhoneType`
    FOREIGN KEY (`PhoneType` )
    REFERENCES `ppet`.`PhoneTypes` (`PhoneType` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`TimeEntries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`TimeEntries` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`TimeEntries` (
  `idEmployee` INT NOT NULL ,
  `Date` DATE NOT NULL ,
  `StartTime` TIME NOT NULL ,
  `StopTime` TIME NOT NULL ,
  `PaidDate` DATE NULL ,
  PRIMARY KEY (`idEmployee`, `Date`, `StartTime`, `StopTime`) ,
  INDEX FK_TimeEntries_idEmployee (`idEmployee` ASC) ,
  CONSTRAINT `FK_TimeEntries_idEmployee`
    FOREIGN KEY (`idEmployee` )
    REFERENCES `ppet`.`Employees` (`idEmployee` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`Shifts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`Shifts` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`Shifts` (
  `idEmployee` INT NOT NULL ,
  `Date` DATE NOT NULL ,
  `StartTime` TIME NOT NULL ,
  `StopTime` TIME NOT NULL ,
  PRIMARY KEY (`idEmployee`, `Date`, `StartTime`, `StopTime`) ,
  INDEX FK_Shifts_idEmployee (`idEmployee` ASC) ,
  CONSTRAINT `FK_Shifts_idEmployee`
    FOREIGN KEY (`idEmployee` )
    REFERENCES `ppet`.`Employees` (`idEmployee` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`CourseOfferingDates`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`CourseOfferingDates` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`CourseOfferingDates` (
  `idCourseOffering` INT NOT NULL ,
  `Date` DATE NOT NULL ,
  PRIMARY KEY (`idCourseOffering`, `Date`) ,
  INDEX FK_CourseOfferingDates_idCourseOffering (`idCourseOffering` ASC) ,
  CONSTRAINT `FK_CourseOfferingDates_idCourseOffering`
    FOREIGN KEY (`idCourseOffering` )
    REFERENCES `ppet`.`CourseOfferings` (`idCourseOffering` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`Customers` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`Customers` (
  `idCustomer` INT NOT NULL ,
  `idPerson` INT NOT NULL ,
  PRIMARY KEY (`idCustomer`) ,
  INDEX FK_Customers_idPerson (`idPerson` ASC) ,
  CONSTRAINT `FK_Customers_idPerson`
    FOREIGN KEY (`idPerson` )
    REFERENCES `ppet`.`Persons` (`idPerson` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`CustomerCourses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`CustomerCourses` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`CustomerCourses` (
  `idCustomer` INT NOT NULL ,
  `idCourseOffering` INT NOT NULL ,
  PRIMARY KEY (`idCustomer`, `idCourseOffering`) ,
  INDEX FK_CustomerCourses_idCustomer (`idCustomer` ASC) ,
  INDEX FK_CustomerCourses_idCourseOffering (`idCourseOffering` ASC) ,
  CONSTRAINT `FK_CustomerCourses_idCustomer`
    FOREIGN KEY (`idCustomer` )
    REFERENCES `ppet`.`Customers` (`idCustomer` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CustomerCourses_idCourseOffering`
    FOREIGN KEY (`idCourseOffering` )
    REFERENCES `ppet`.`CourseOfferings` (`idCourseOffering` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`Pets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`Pets` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`Pets` (
  `idCustomer` INT NOT NULL ,
  `Name` VARCHAR(45) NOT NULL ,
  `AnimalType` VARCHAR(40) NOT NULL ,
  `BirthDate` DATE NULL ,
  PRIMARY KEY (`idCustomer`, `Name`) ,
  INDEX FK_Pets_idCustomer (`idCustomer` ASC) ,
  INDEX FK_Pets_AnimalType (`AnimalType` ASC) ,
  CONSTRAINT `FK_Pets_idCustomer`
    FOREIGN KEY (`idCustomer` )
    REFERENCES `ppet`.`Customers` (`idCustomer` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Pets_AnimalType`
    FOREIGN KEY (`AnimalType` )
    REFERENCES `ppet`.`AnimalTypes` (`AnimalType` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`Orders` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`Orders` (
  `idOrder` INT NOT NULL ,
  `Date` DATE NOT NULL ,
  `SameAsAbove` BOOLEAN NOT NULL ,
  `idCustomer` INT NOT NULL ,
  `idAddress` INT NULL ,
  `idSoldByEmployee` INT NOT NULL ,
  PRIMARY KEY (`idOrder`) ,
  INDEX FK_Orders_idCustomer (`idCustomer` ASC) ,
  INDEX FK_Orders_idAddress (`idAddress` ASC) ,
  INDEX FK_Orders_idSoldByEmployee (`idSoldByEmployee` ASC) ,
  CONSTRAINT `FK_Orders_idCustomer`
    FOREIGN KEY (`idCustomer` )
    REFERENCES `ppet`.`Customers` (`idCustomer` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Orders_idAddress`
    FOREIGN KEY (`idAddress` )
    REFERENCES `ppet`.`Addresses` (`idAddress` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Orders_idSoldByEmployee`
    FOREIGN KEY (`idSoldByEmployee` )
    REFERENCES `ppet`.`Employees` (`idEmployee` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`Vendors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`Vendors` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`Vendors` (
  `idVendor` INT NOT NULL ,
  `idPerson` INT NOT NULL ,
  `CompanyName` VARCHAR(45) NULL ,
  `Notes` VARCHAR(45) NULL ,
  PRIMARY KEY (`idVendor`) ,
  INDEX FK_Vendors_idPerson (`idPerson` ASC) ,
  CONSTRAINT `FK_Vendors_idPerson`
    FOREIGN KEY (`idPerson` )
    REFERENCES `ppet`.`Persons` (`idPerson` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`InventoryItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`InventoryItems` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`InventoryItems` (
  `UPC` VARCHAR(40) NOT NULL ,
  `Description` VARCHAR(45) NOT NULL ,
  `BuyPrice` DECIMAL(10,2) NULL ,
  `SellPrice` DECIMAL(10,2) NOT NULL ,
  `QuantityinStock` INT NOT NULL ,
  `ExpirationDate` DATE NULL ,
  `StockLocation` VARCHAR(40) NULL ,
  `ShelfLocation` VARCHAR(40) NULL ,
  `ReorderWhen` INT NULL ,
  `ReorderAmount` INT NULL ,
  `idVendor` INT NULL ,
  PRIMARY KEY (`UPC`) ,
  INDEX FK_InventoryItems_idVendor (`idVendor` ASC) ,
  INDEX FK_InventoryItems_StockLocation (`StockLocation` ASC) ,
  INDEX FK_InventoryItems_ShelfLocation (`ShelfLocation` ASC) ,
  CONSTRAINT `FK_InventoryItems_idVendor`
    FOREIGN KEY (`idVendor` )
    REFERENCES `ppet`.`Vendors` (`idVendor` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_InventoryItems_StockLocation`
    FOREIGN KEY (`StockLocation` )
    REFERENCES `ppet`.`StockLocations` (`StockLocation` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_InventoryItems_ShelfLocation`
    FOREIGN KEY (`ShelfLocation` )
    REFERENCES `ppet`.`ShelfLocations` (`ShelfLocation` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ppet`.`OrderItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ppet`.`OrderItems` ;

CREATE  TABLE IF NOT EXISTS `ppet`.`OrderItems` (
  `idOrder` INT NOT NULL ,
  `SequenceNumber` INT NOT NULL ,
  `UPC` VARCHAR(40) NOT NULL ,
  `Quantity` INT NOT NULL ,
  PRIMARY KEY (`idOrder`, `SequenceNumber`) ,
  INDEX FK_OrderItems_idOrder (`idOrder` ASC) ,
  INDEX FK_OrderItems_UPC (`UPC` ASC) ,
  CONSTRAINT `FK_OrderItems_idOrder`
    FOREIGN KEY (`idOrder` )
    REFERENCES `ppet`.`Orders` (`idOrder` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_OrderItems_UPC`
    FOREIGN KEY (`UPC` )
    REFERENCES `ppet`.`InventoryItems` (`UPC` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
