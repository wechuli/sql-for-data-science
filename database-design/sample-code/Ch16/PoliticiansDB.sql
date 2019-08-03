DROP DATABASE IF EXISTS PoliticianDB;
CREATE DATABASE PoliticianDB;

USE PoliticianDB;

CREATE TABLE Politicians (
  Country VARCHAR(45) NOT NULL,
  FirstName VARCHAR(45) NOT NULL,
  LastName VARCHAR(45) NOT NULL,
  PRIMARY KEY (Country)
);

INSERT INTO Politicians VALUES("Germany", "Horst", "Köhler");
INSERT INTO Politicians VALUES("France", "François", "Fillon");
INSERT INTO Politicians VALUES("Italy", "Romano", "Prodi");
INSERT INTO Politicians VALUES("Spain", "José Luis Rodríguez", "Zapatero");
