CREATE DATABASE MovieDb;
USE MovieDb;

CREATE TABLE MpaaRatings (
  MpaaRaiting         VARCHAR(5)    NOT NULL,
  Description         VARCHAR(40)   NOT NULL,
  PRIMARY KEY (MpaaRaiting)
);

CREATE TABLE Genres (
  Genre               VARCHAR(10)   NOT NULL,
  Description         VARCHAR(40)   NOT NULL,
  PRIMARY KEY (Genre)
);

CREATE TABLE Movies (
  MovieId             INT           NOT NULL    AUTO_INCREMENT,
  Title               VARCHAR(40)   NOT NULL,
  Year                INT           NOT NULL,
  MpaaRating          VARCHAR(5)    NOT NULL,
  Review              TEXT          NULL,
  NumStars            INT           NULL,
  Minutes             INT           NOT NULL,
  Description         TEXT          NULL,
  Genre               VARCHAR(10)   NULL,
  TrailerUrl          VARCHAR(255)  NULL,
  PRIMARY KEY (MovieId),
  INDEX FK_Movies_Ratings (MpaaRating ASC),
  INDEX FK_Movies_Genres (Genre ASC),
  CONSTRAINT FK_Movies_Ratings
    FOREIGN KEY (MpaaRating)
    REFERENCES MovieDb.MpaaRatings (MpaaRaiting)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK_Movies_Genres
    FOREIGN KEY (Genre)
    REFERENCES MovieDb.Genres (Genre)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE Persons (
  PersonId            INT           NOT NULL AUTO_INCREMENT,
  FirstName           VARCHAR(40)   NOT NULL,
  LastName            VARCHAR(40)   NOT NULL,
  PRIMARY KEY (PersonId)
);

CREATE TABLE MovieProducers (
  MovieId             INT           NOT NULL,
  PersonId            INT           NOT NULL,
  PRIMARY KEY (MovieId, PersonId),
  INDEX FK_Producers_Persons (PersonId ASC),
  INDEX FK_Producers_Movies (MovieId ASC),
  CONSTRAINT FK_Producers_Persons
    FOREIGN KEY (PersonId)
    REFERENCES MovieDb.Persons (PersonId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK_Producers_Movies
    FOREIGN KEY (MovieId)
    REFERENCES MovieDb.Movies (MovieId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE MovieDirectors (
  MovieId             INT           NOT NULL,
  PersonId            INT           NOT NULL,
  PRIMARY KEY (MovieId, PersonId),
  INDEX FK_Directors_Persons (PersonId ASC),
  INDEX FK_Directors_Movies (MovieId ASC),
  CONSTRAINT FK_Directors_Persons
    FOREIGN KEY (PersonId)
    REFERENCES MovieDb.Persons (PersonId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK_Directors_Movies
    FOREIGN KEY (MovieId)
    REFERENCES MovieDb.Movies (MovieId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE RoleTypes (
  RoleType            VARCHAR(40)   NOT NULL,
  PRIMARY KEY (RoleType)
);

CREATE TABLE MovieActors (
  MovieId             INT           NOT NULL,
  PersonId            INT           NOT NULL,
  CharacterName       VARCHAR(40)   NOT NULL,
  RoleType            VARCHAR(40)   NULL,
  Review              TEXT          NULL,
  NumStars            INT           NULL,
  PRIMARY KEY (MovieId, PersonId, CharacterName),
  INDEX FK_Actors_Persons (PersonId ASC),
  INDEX FK_Actors_RoleTypes (RoleType ASC),
  INDEX FK_Actors_Movies (MovieId ASC),
  CONSTRAINT FK_Actors_Persons
    FOREIGN KEY (PersonId)
    REFERENCES MovieDb.Persons (PersonId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK_Actors_RoleTypes
    FOREIGN KEY (RoleType)
    REFERENCES MovieDb.RoleTypes (RoleType)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK_Actors_Movies
    FOREIGN KEY (MovieId)
    REFERENCES MovieDb.Movies (MovieId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

DROP DATABASE MovieDb;
