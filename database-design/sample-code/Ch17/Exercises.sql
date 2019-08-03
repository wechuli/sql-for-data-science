CREATE DATABASE Aquarium;
USE Aquarium;

CREATE TABLE Venues(
  VenueId    INT           NOT NULL,
  VenueName  VARCHAR(45)   NOT NULL,
  Seating    INT           NOT NULL,

  PRIMARY KEY (VenueId)
);

CREATE TABLE Shows(
  ShowId     INT           NOT NULL,
  ShowName   VARCHAR(45)   NOT NULL,
  VenueId    INT           NOT NULL,

  PRIMARY KEY (ShowId),

  INDEX fk_Shows_Venues (VenueId),

  CONSTRAINT fk_Shows_Venues
    FOREIGN KEY (VenueId)
    REFERENCES Venues (VenueId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE ShowTimes(
  ShowId     INT           NOT NULL,
  Time       TIME          NOT NULL,

  PRIMARY KEY (ShowId, Time),

  INDEX fk_ShowTimes_Shows (ShowId),

  CONSTRAINT fk_ShowTimes_Shows
    FOREIGN KEY (ShowId)
    REFERENCES Shows (ShowId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

INSERT INTO Venues VALUES (101, "Sherman's Lagoon", 375);
INSERT INTO Venues VALUES (102, "Peet Amphitheater", 300);
INSERT INTO Venues VALUES (103, "Ngorongoro Wash", 413);

INSERT INTO Shows VALUES (1, "Sherm's Shark Show", 101);
INSERT INTO Shows VALUES (2, "Meet the Rays", 101);
INSERT INTO Shows VALUES (3, "Deb's Daring Dolphins", 102);
INSERT INTO Shows VALUES (4, "The Walter Walrus Comedy Hour", 102);
INSERT INTO Shows VALUES (5, "Flamingo Follies", 103);
INSERT INTO Shows VALUES (6, "Wonderful Waterfowl", 103);

INSERT INTO ShowTimes VALUES (1, "11:15");
INSERT INTO ShowTimes VALUES (1, "15:00");
INSERT INTO ShowTimes VALUES (2, "13:15");
INSERT INTO ShowTimes VALUES (2, "18:00");
INSERT INTO ShowTimes VALUES (3, "11:00");
INSERT INTO ShowTimes VALUES (3, "12:00");
INSERT INTO ShowTimes VALUES (3, "18:30");
INSERT INTO ShowTimes VALUES (4, "14:00");
INSERT INTO ShowTimes VALUES (4, "17:27");
INSERT INTO ShowTimes VALUES (5, "14:00");
INSERT INTO ShowTimes VALUES (6, "15:00");

UPDATE Shows, ShowTimes SET Time = "14:15"
WHERE Shows.ShowId = ShowTimes.ShowId
  AND Time="14:00"
  AND ShowName = "Flamingo Follies";

UPDATE Shows, ShowTimes SET Time = "15:15"
WHERE Shows.ShowId = ShowTimes.ShowId
  AND Time="15:00"
  AND ShowName = "Sherm's Shark Show";

SELECT
    ShowName AS "Show",
    LPAD(DATE_FORMAT(Time, "%l:%i %p"), 8, " ") AS Time,
    VenueName AS Location
FROM Shows, ShowTimes, Venues
WHERE Shows.ShowId = ShowTimes.ShowId
  AND Shows.VenueId = Venues.VenueId
ORDER BY "Show", TIME(Time);

SELECT
    LPAD(DATE_FORMAT(Time, "%l:%i %p"), 8, " ") AS Time,
    ShowName AS "Show",
    VenueName AS Location
FROM Shows, ShowTimes, Venues
WHERE Shows.ShowId = ShowTimes.ShowId
  AND Shows.VenueId = Venues.VenueId
ORDER BY TIME(Time), "Show";

DROP DATABASE Aquarium;
