USE MYDB;

DROP TABLE IF EXISTS Persons;

CREATE TABLE IF NOT EXISTS Persons (
  idPerson INT NOT NULL AUTO_INCREMENT,
  FirstName VARCHAR(45) NOT NULL DEFAULT "<missing>",
  LastName VARCHAR(45) NOT NULL DEFAULT "<none>",
  State VARCHAR(10) NULL,
  PRIMARY KEY (idPerson)
);

INSERT INTO Persons VALUES (1, "Rod", "Stephens", "CO");
INSERT INTO Persons VALUES (null, DEFAULT, "Markup", null);
--INSERT INTO Persons (idPerson, FirstName, LastName) VALUES (null, "Guinevere", "Conkle");
--INSERT INTO Persons (idPerson, FirstName, LastName) VALUES (null, "Heron", "Stroh");
--INSERT INTO Persons (idPerson, FirstName, LastName) VALUES (null, "Maxene", "Quinn");

--INSERT INTO Persons (FirstName, LastName) VALUES ("Guinevere", "Conkle");
--INSERT INTO Persons (FirstName, LastName) VALUES ("Heron", "Stroh");
--INSERT INTO Persons (FirstName, LastName) VALUES ("Maxene", "Quinn");

INSERT INTO Persons VALUES (10, "Guinevere", "Conkle", "Confusion");
INSERT INTO Persons VALUES (100, "Heron", "Stroh", "Exhaustion");
INSERT INTO Persons (FirstName, LastName, State) VALUES ("Maxene", "Quinn", "Anxiety");

SELECT * FROM Persons;

DROP TABLE IF EXISTS SmartPersons;

CREATE TABLE IF NOT EXISTS SmartPersons (
  FirstName VARCHAR(45) NOT NULL DEFAULT "<missing>",
  LastName VARCHAR(45) NOT NULL DEFAULT "<none>",
  PRIMARY KEY (FirstName, LastName)
);

INSERT INTO SmartPersons (LastName, FirstName)
SELECT LastName, FirstName FROM Persons
WHERE State <> 'Confusion';

SELECT * FROM SmartPersons;
