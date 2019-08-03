CREATE DATABASE UserDb;
USE UserDb;

-- Create a table.
CREATE TABLE People (
  FirstName           VARCHAR(5)     NOT NULL,
  LastName            VARCHAR(40)    NOT NULL,
  Salary              DECIMAL(10,2)  NULL,
  PRIMARY KEY (LastName, FirstName)
);

-- Create a new user with an initial password.
-- Note that this password may appear in the logs.
CREATE USER Rod IDENTIFIED BY 'secret';

-- Revoke all privileges for the user.
REVOKE ALL PRIVILEGES, GRANT OPTION FROM Rod;

-- Grant privileges that the user really needs.
--GRANT INSERT ON UserDb.People TO Rod;
GRANT INSERT (FirstName, LastName, Salary) ON UserDb.People TO Rod;
GRANT SELECT (FirstName, LastName) ON UserDb.People TO Rod;
GRANT DELETE ON UserDb.People TO Rod;
