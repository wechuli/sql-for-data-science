SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `AquariumDB` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `AquariumDB`;

-- -----------------------------------------------------
-- Table `AquariumDB`.`Venues`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AquariumDB`.`Venues` ;

CREATE  TABLE IF NOT EXISTS `AquariumDB`.`Venues` (
  `idVenue` INT NOT NULL ,
  `VenueName` VARCHAR(45) NOT NULL ,
  `Seating` INT NOT NULL ,
  PRIMARY KEY (`idVenue`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `AquariumDB`.`Venues`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `Venues` (`idVenue`, `VenueName`, `Seating`) VALUES (101, 'Sherman\'s Lagoon', 375);
INSERT INTO `Venues` (`idVenue`, `VenueName`, `Seating`) VALUES (102, 'Peet Amphitheater', 300);
INSERT INTO `Venues` (`idVenue`, `VenueName`, `Seating`) VALUES (103, 'Ngorongoro Wash', 413);

COMMIT;

-- -----------------------------------------------------
-- Table `AquariumDB`.`Shows`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AquariumDB`.`Shows` ;

CREATE  TABLE IF NOT EXISTS `AquariumDB`.`Shows` (
  `idShow` INT NOT NULL ,
  `ShowName` VARCHAR(45) NOT NULL ,
  `idVenue` INT NOT NULL ,
  PRIMARY KEY (`idShow`) ,
  INDEX fk_Shows_Venues (`idVenue` ASC) ,
  CONSTRAINT `fk_Shows_Venues`
    FOREIGN KEY (`idVenue` )
    REFERENCES `AquariumDB`.`Venues` (`idVenue` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `AquariumDB`.`Shows`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `Shows` (`idShow`, `ShowName`, `idVenue`) VALUES (1, 'Sherm’s Shark Show', 101);
INSERT INTO `Shows` (`idShow`, `ShowName`, `idVenue`) VALUES (2, 'Meet the Rays', 101);
INSERT INTO `Shows` (`idShow`, `ShowName`, `idVenue`) VALUES (3, 'Deb’s Daring Dolphins', 102);
INSERT INTO `Shows` (`idShow`, `ShowName`, `idVenue`) VALUES (4, 'The Walter Walrus Comedy Hour', 102);
INSERT INTO `Shows` (`idShow`, `ShowName`, `idVenue`) VALUES (5, 'Flamingo Follies', 103);
INSERT INTO `Shows` (`idShow`, `ShowName`, `idVenue`) VALUES (6, 'Wonderful Waterfowl', 103);

COMMIT;

-- -----------------------------------------------------
-- Table `AquariumDB`.`ShowTimes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AquariumDB`.`ShowTimes` ;

CREATE  TABLE IF NOT EXISTS `AquariumDB`.`ShowTimes` (
  `idShow` INT NOT NULL ,
  `Time` TIME NOT NULL ,
  PRIMARY KEY (`idShow`, `Time`) ,
  INDEX fk_ShowTimes_Shows (`idShow` ASC) ,
  CONSTRAINT `fk_ShowTimes_Shows`
    FOREIGN KEY (`idShow` )
    REFERENCES `AquariumDB`.`Shows` (`idShow` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `AquariumDB`.`ShowTimes`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `ShowTimes` (`idShow`, `Time`) VALUES (1, '11:15:00');
INSERT INTO `ShowTimes` (`idShow`, `Time`) VALUES (1, '15:00:00');
INSERT INTO `ShowTimes` (`idShow`, `Time`) VALUES (2, '13:15:00');
INSERT INTO `ShowTimes` (`idShow`, `Time`) VALUES (2, '18:00:00');
INSERT INTO `ShowTimes` (`idShow`, `Time`) VALUES (3, '11:00:00');
INSERT INTO `ShowTimes` (`idShow`, `Time`) VALUES (3, '12:00:00');
INSERT INTO `ShowTimes` (`idShow`, `Time`) VALUES (3, '18:30:00');
INSERT INTO `ShowTimes` (`idShow`, `Time`) VALUES (4, '14:00:00');
INSERT INTO `ShowTimes` (`idShow`, `Time`) VALUES (4, '17:27:00');
INSERT INTO `ShowTimes` (`idShow`, `Time`) VALUES (5, '14:00:00');
INSERT INTO `ShowTimes` (`idShow`, `Time`) VALUES (6, '15:00:00');

COMMIT;

DROP TRIGGER IF EXISTS ShowTimes_BeforeInsert;
DROP TRIGGER IF EXISTS ShowTimes_BeforeUpdate;

DELIMITER //

CREATE TRIGGER ShowTimes_BeforeInsert BEFORE INSERT ON ShowTimes
  FOR EACH ROW BEGIN
    IF (NEW.Time < '09:00:00') OR (NEW.Time > '21:00:00') THEN
        -- Cause an error.
        SET NEW.Time = null;
    END IF;
  END;//


CREATE TRIGGER ShowTimes_BeforeUpdate BEFORE UPDATE ON ShowTimes
  FOR EACH ROW BEGIN
    IF (NEW.Time < '09:00:00') OR (NEW.Time > '21:00:00') THEN
        -- Reset the time.
        SET NEW.Time = OLD.Time;
    END IF;
  END;//


DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;