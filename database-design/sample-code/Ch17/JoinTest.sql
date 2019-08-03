USE MYDB;

DROP TABLE IF EXISTS Courses;

CREATE TABLE IF NOT EXISTS Courses (
  CourseId     VARCHAR(10)   NULL,
  CourseName   VARCHAR(40)   NULL
);

INSERT INTO Courses VALUES ("CS 120", "Database Design");
INSERT INTO Courses VALUES ("CS 245", "The Customer: A Necessary Evil");
INSERT INTO Courses VALUES ("D?=h@p", "Introduction to Cryptography");

DROP TABLE IF EXISTS Enrollments;

CREATE TABLE IF NOT EXISTS Enrollments (
  FirstName   VARCHAR(40)   NULL,
  LastName    VARCHAR(40)   NULL,
  CourseId    VARCHAR(10)   NULL
);

INSERT INTO Enrollments VALUES ("Guinevere", "Conkle", "CS 120");
INSERT INTO Enrollments VALUES ("Heron", "Stroh", "CS 120");
INSERT INTO Enrollments VALUES ("Maxene", "Quinn", "CS 245");
INSERT INTO Enrollments VALUES ("Guinevere", "Conkle", "CS 101");
INSERT INTO Enrollments VALUES ("Heron", "Stroh", "CS 245");

SELECT * FROM Courses;
SELECT * FROM Enrollments;

SELECT "WHERE";
SELECT * FROM Enrollments, Courses
WHERE Courses.CourseId = Enrollments.CourseId;

SELECT "INNER JOIN";
SELECT * FROM Enrollments INNER JOIN Courses
  ON  (Courses.CourseId = Enrollments.CourseId);

SELECT "LEFT JOIN";
SELECT * FROM Enrollments LEFT JOIN Courses
  ON  (Courses.CourseId = Enrollments.CourseId);

SELECT "RIGHT JOIN";
SELECT * FROM Enrollments RIGHT JOIN Courses
  ON  (Courses.CourseId = Enrollments.CourseId);

SELECT "UNION";
SELECT * FROM Enrollments LEFT JOIN Courses
  ON  (Courses.CourseId = Enrollments.CourseId)
UNION
SELECT * FROM Enrollments RIGHT JOIN Courses
  ON  (Courses.CourseId = Enrollments.CourseId);

