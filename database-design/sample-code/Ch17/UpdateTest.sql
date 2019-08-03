USE MYDB;

DROP TABLE IF EXISTS Authors;

CREATE TABLE IF NOT EXISTS Authors (
  AuthorId    INT           NOT NULL,
  FirstName   VARCHAR(40)   NULL,
  LastName    VARCHAR(40)   NULL
);

INSERT INTO Authors VALUES (1, "Tom", "Holt");
INSERT INTO Authors VALUES (2, "Terry", "Pratchett");
INSERT INTO Authors VALUES (3, "Matthew", "Hughes");
INSERT INTO Authors VALUES (4, "Sandra", "Boynton");
INSERT INTO Authors VALUES (5, "Glenn", "Cook");

DROP TABLE IF EXISTS Books;

CREATE TABLE IF NOT EXISTS Books (
  AuthorId   INT           NOT NULL,
  Title      VARCHAR(60)   NOT NULL,
  ISBN       VARCHAR(15)   NULL,
  MSRP       DECIMAL(4,2)  NULL,
  Year       INT           NULL,
  Pages      INT           NULL
);

INSERT INTO Books VALUES(1, "The Potable Door", "978-1841492087", 14.95, 2004, 416);
INSERT INTO Books VALUES(1, "You Don't Have to Be Evil to Work Here, But it Helps", "978-1841492841", 12.50, 2007, 352);
INSERT INTO Books VALUES(1, "Snow White and the Seven Samurai", "978-1857239881", 9.99, 2004, 320);
INSERT INTO Books VALUES(2, "The Wee Free Men", "978-0060012380", 6.99, 2004, 400);
INSERT INTO Books VALUES(2, "The Color of Magic", "978-0061020711", 7.99, 2000, 210);
INSERT INTO Books VALUES(3, "Gullible's Travels", "978-0739419403", NULL, 2001, NULL);
INSERT INTO Books VALUES(4, "Philadelphia Chickens", "978-0761126362", 16.95, 2002, 64);
INSERT INTO Books VALUES(5, "Sweet Silver Blues", "978-0451150615", NULL, 1987, NULL);

UPDATE Books SET Title = "The Portable Door"
WHERE Title = "The Potable Door";

SELECT Title, CONCAT(FirstName, " ", LastName) AS Author
FROM Books, Authors
WHERE Books.AuthorId = Authors.AuthorId
ORDER BY Title;

SELECT Title, CONCAT(FirstName, " ", LastName) AS Author
FROM Books, Authors
WHERE Books.AuthorId = Authors.AuthorId AND MSRP<10
ORDER BY Title;

SELECT MSRP, Title, CONCAT(FirstName, " ", LastName) AS Author
FROM Books INNER JOIN Authors
  ON (Books.AuthorId = Authors.AuthorId)
WHERE MSRP < 10
ORDER BY MSRP;

DROP TABLE IF EXISTS Sales;

CREATE TABLE IF NOT EXISTS Sales (
  EmployeeId   INT           NOT NULL,
  Month        CHAR(3)       NOT NULL,
  Year         INT           NOT NULL,
  TotalSales   INT           NOT NULL,
  Salary       DECIMAL(6,2)  NOT NULL
);

INSERT INTO Sales VALUES(1, "AUG", 2008,  7, 2000.00);
INSERT INTO Sales VALUES(2, "AUG", 2008, 11, 2000.00);
INSERT INTO Sales VALUES(3, "AUG", 2008,  3, 2000.00);
INSERT INTO Sales VALUES(4, "AUG", 2008, 27, 2000.00);
INSERT INTO Sales VALUES(1, "SEP", 2008,  9, 2000.00);
INSERT INTO Sales VALUES(2, "SEP", 2008,  8, 2000.00);
INSERT INTO Sales VALUES(3, "SEP", 2008, 10, 2000.00);
INSERT INTO Sales VALUES(4, "SEP", 2008, 31, 2000.00);

SELECT * FROM Sales ORDER BY EmployeeId;

UPDATE Sales
SET Salary = Salary + 100
WHERE TotalSales >= 10
  AND Month="AUG"
  AND Year=2008;

SELECT * FROM Sales
ORDER BY Year, Month, EmployeeId;
