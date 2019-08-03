USE UserDB;

-- Make some records.
INSERT INTO People VALUES('Annie', 'Lennox', 50000);
INSERT INTO People VALUES('Where', 'Waldo',  60000);
INSERT INTO People VALUES('Frank', 'Stein',  70000);

-- Select the records.
-- This fails because we don't have SELECT privilege on the Salary column.
SELECT * FROM People ORDER BY FirstName, LastName;

-- Select the records.
-- This works because we have SELECT privilege on FirstName and LastName.
SELECT FirstName, LastName FROM People ORDER BY FirstName, LastName;

-- Create a new table.
-- This fails because we don't have CREATE TABLE privileges.
CREATE TABLE MorePeople (
  FirstName           VARCHAR(5)    NOT NULL,
  LastName            VARCHAR(40)   NOT NULL,
  PRIMARY KEY (LastName, FirstName)
);

-- Delete the records.
DELETE FROM People;
