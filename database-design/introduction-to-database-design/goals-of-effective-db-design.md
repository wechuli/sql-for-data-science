A database won't do you much good if you can't get data out of it quickly, reliably and consistently.It won't be useful if it's full of incorrect and/or contradictory data. You can address all of these potential problems by using modern database tools, a good database design and a pinch of common sense.

- Why a good database design is important
- Strengths and weaknesses of different kinds of information containers that can act as databases
- How computerized databases can benefit from these strengths and avoid those weaknesses
- How good database design helps achieve database goals
- What CRUD and ACID are, and why they are relevant to database design

Few parts of an application's design are as critical as the database's design. The database is the repository of the information that the rest of the application manages and displays to the users.

Poor database design can lead to these and other annoying and potentially expensive scenarios. A good design creates a solid foundation on which you can build the rest of the application.

## Information Containers

A database is a tool that stores data, and lets you create, read, update and delete data in some manner. An atomic transaction is a possibly complex series of actions that is considered as a single operation by those who are not involved directly in performing the transaction.

## Desirable Database Features

### CRUD

Create,Read,Update,Delete.

### Retrieval

Retrieval is another word for "read". The database should allow you to find every piece of data. There's no point putting something in the database if there's no way to get it back later. The database should allow you to structure the data so you can find particular pieces of data in one or more specific ways. Being able to find all of the data in the database quickly and reliably is an important part of database design.

### Consistency

Another aspect of the R in CRUD is consistency. The database should provide consistent results. If you perform the same search twice in a row, you should get the same results. A well-built database product can ensure that the exact same query returns the same result but design also plays an important role. If the database is poorly designed, you may be able to store conflicting data in different parts of the database.

### Validity

Validity is closely related to the idea of consistency. Consistency means different parts of the database don't hold contradictory views of the same information. Validity means data is validated where possible against other pieces of data in the database. In CRUD terms, data can be validated when a record is created, updated or deleted.
