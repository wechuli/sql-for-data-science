CREATE DATABASE IF NOT EXISTS testdb;

USE testdb;

-- Delete old tables.
DROP TABLE IF EXISTS People;
DROP TABLE IF EXISTS States;

-- Create new tables.
CREATE TABLE States (
  State char(2) NOT NULL,
  PRIMARY KEY (State)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE  testdb.people (
  FirstName varchar(40) NOT NULL,
  LastName varchar(40) NOT NULL,
  Street varchar(45) NOT NULL,
  City varchar(45) NOT NULL,
  State char(2) NOT NULL,
  Zip char(5) NOT NULL,
  PRIMARY KEY USING BTREE (FirstName,LastName),
  KEY FK_people_State (State),
  CONSTRAINT FK_people_State FOREIGN KEY (State) REFERENCES states (State)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 10240 kB';

-- Add some test data.
INSERT INTO States VALUES("CO");
INSERT INTO States VALUES("KS");
INSERT INTO States VALUES("UT");
INSERT INTO States VALUES("NE");
INSERT INTO States VALUES("WY");

INSERT INTO People VALUES("Assam", "Lembek", "1234 Bug Ln", "Programmeria", "CO", "12345");
INSERT INTO People VALUES("Nedlim", "Popo", "6435 Abend Wy", "Bugsville", "KS", "28282");

-- Try to insert a duplicate.
INSERT INTO People VALUES("Nedlim", "Popo", "6435 Abend Wy", "Bugsville", "KS", "28282");
