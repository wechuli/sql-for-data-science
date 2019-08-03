SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `TestScoresDB` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `TestScoresDB`;

-- -----------------------------------------------------
-- Table `TestScoresDB`.`TestScores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TestScoresDB`.`TestScores` ;

CREATE  TABLE IF NOT EXISTS `TestScoresDB`.`TestScores` (
  `idStudent` INT NOT NULL ,
  `TestNumber` INT NOT NULL COMMENT 'Between 1 and 5\n' ,
  `Score` INT NOT NULL COMMENT 'Between 0 and 100' ,
  PRIMARY KEY (`idStudent`) )
ENGINE = InnoDB;


DELIMITER //

DROP TRIGGER IF EXISTS TestScores_BeforeInsert;

CREATE TRIGGER TestScores_BeforeInsert BEFORE INSERT ON TestScores
  FOR EACH ROW BEGIN
    IF NEW.TestNumber < 1 THEN
        -- Cause an error.
        SET NEW.idStudent = null;
    ELSEIF NEW.TestNumber > 5 THEN
        -- Cause an error.
        SET NEW.idStudent = null;
    ELSEIF NEW.Score < 0 THEN
        -- Cause an error.
        SET NEW.idStudent = null;
    ELSEIF NEW.Score > 100 THEN
        -- Cause an error.
        SET NEW.idStudent = null;
    END IF;
  END;//


DROP TRIGGER IF EXISTS TestScores_BeforeUpdate;

CREATE TRIGGER TestScores_BeforeUpdate BEFORE UPDATE ON TestScores
  FOR EACH ROW BEGIN
    IF NOT(NEW.TestNumber BETWEEN 1 AND 5) THEN
        -- Reset the value.
        SET NEW.TestNumber = OLD.TestNumber;
    ELSEIF NOT (NEW.Score BETWEEN 0 AND 100) THEN
        -- Reset the value.
        SET NEW.Score = OLD.Score;
    END IF;
  END;//


DELIMITER ;

-- -----------------------------------------------------
-- Table `TestScoresDB`.`Students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TestScoresDB`.`Students` ;

CREATE  TABLE IF NOT EXISTS `TestScoresDB`.`Students` (
  `idStudent` INT NOT NULL ,
  `FirstName` VARCHAR(45) NOT NULL ,
  `LastName` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idStudent`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;