SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `TestScoresDB` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `TestScoresDB`;

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


-- -----------------------------------------------------
-- Data for table `TestScoresDB`.`Students`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `Students` (`idStudent`, `FirstName`, `LastName`) VALUES (1, 'Zaphod', 'Beeblebrox');
INSERT INTO `Students` (`idStudent`, `FirstName`, `LastName`) VALUES (2, 'Ford', 'Prefect');
INSERT INTO `Students` (`idStudent`, `FirstName`, `LastName`) VALUES (3, 'Arthur', 'Dent');

COMMIT;

-- -----------------------------------------------------
-- Table `TestScoresDB`.`TestScores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TestScoresDB`.`TestScores` ;

CREATE  TABLE IF NOT EXISTS `TestScoresDB`.`TestScores` (
  `idStudent` INT NOT NULL ,
  `TestNumber` INT NOT NULL COMMENT 'Between 1 and 5\n' ,
  `Score` INT NOT NULL COMMENT 'Between 0 and 100' ,
  PRIMARY KEY (`idStudent`, `TestNumber`) ,
  INDEX FK_TestScores_idStudent (`idStudent` ASC) ,
  CONSTRAINT `FK_TestScores_idStudent`
    FOREIGN KEY (`idStudent` )
    REFERENCES `TestScoresDB`.`Students` (`idStudent` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `TestScoresDB`.`TestScores`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO `TestScores` (`idStudent`, `TestNumber`, `Score`) VALUES (1, 1, 91);
INSERT INTO `TestScores` (`idStudent`, `TestNumber`, `Score`) VALUES (1, 2, 92);
INSERT INTO `TestScores` (`idStudent`, `TestNumber`, `Score`) VALUES (1, 3, 93);
INSERT INTO `TestScores` (`idStudent`, `TestNumber`, `Score`) VALUES (2, 1, 81);
INSERT INTO `TestScores` (`idStudent`, `TestNumber`, `Score`) VALUES (2, 2, 82);
INSERT INTO `TestScores` (`idStudent`, `TestNumber`, `Score`) VALUES (2, 3, 83);
INSERT INTO `TestScores` (`idStudent`, `TestNumber`, `Score`) VALUES (3, 1, 71);
INSERT INTO `TestScores` (`idStudent`, `TestNumber`, `Score`) VALUES (3, 2, 72);
INSERT INTO `TestScores` (`idStudent`, `TestNumber`, `Score`) VALUES (3, 3, 73);

COMMIT;

DROP TRIGGER IF EXISTS TestScores_BeforeInsert;
DROP TRIGGER IF EXISTS TestScores_BeforeUpdate;

DELIMITER //

CREATE TRIGGER TestScores_BeforeInsert BEFORE INSERT ON TestScores
  FOR EACH ROW BEGIN
    IF (NEW.TestNumber < 1) OR (NEW.TestNumber > 10) THEN
        -- Cause an error.
        SET NEW.idStudent = null;
    ELSEIF (NEW.Score < 0) OR (NEW.Score > 100) THEN
        -- Cause an error.
        SET NEW.idStudent = null;
    END IF;
  END;//


CREATE TRIGGER TestScores_BeforeUpdate BEFORE UPDATE ON TestScores
  FOR EACH ROW BEGIN
    IF (NEW.TestNumber < 1) OR (NEW.TestNumber > 10) THEN
        -- Reset the value.
        SET NEW.TestNumber = OLD.TestNumber;
    ELSEIF (NEW.Score < 0) OR (NEW.Score > 100) THEN
        -- Reset the value.
        SET NEW.Score = OLD.Score;
    END IF;
  END;//


DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;