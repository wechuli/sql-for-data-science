# Database Types

- Flat files - Flat files are simply files containing text.
- INI files - INI file(INI stands for 'initialization'). An INI file contains section names surrounded by square brackets. Each section can hold any number of setting names and values separated by an equal sign.
- Windows System Registry - The registry is a hierarchical database that holds configuration information for the operating system and many of the programs installed in the system. It contains information such as the locations of key executable programs and libraries.
- Relational Databases - Provide Data types, Basic constraints, Referential integrity, Cascading deletes and updates, Joins and complex queries
- Spreadsheets
- Hierarchical Databases - Hierarchical data includes values that are naturally arranged in a tree-like structure. One piece of data somehow logically contains or includes other pieces of data. Files on a disk are typically arranged in a hierarchy.

## XML

XML (eXtensible Markup Language) is a language for storing hierarchical data. XML itself doesn't provide any tools for building, searching, updating, validating or otherwise manipulating data. XML is a fairly useful format for storing, transferring and retrieving hierarchical data, and there are several common tools that can make working with XML files easy.

### XML Basics

An XML file is a relatively simple text file that uses special tokens to define a structure for the data that it contains. Programs that read XML ignore whitespace so you can use them to make the data more readable. XML requires that every opening token must have a corresponding closing token.XML requires that elements be proper;y nested. One element may complete;y contain another, but they may not overlap so one contains only part of another.

An XML file can define attributes for an element/. You can enclose a comment in an XML file starting it with the characters `<! --- >`

The file must have a single root element that contains all other elements. This makes the file absolutely pure, true hierarchy of data. Actually, the file can also begin with an optional XML declaration that gives the XML version

### XML Structures

- XML files are hierarchical, so it's natural to use them to hold hierarchical data. It's straightforward to map purely hierarchical data such as a simple family tree or organizational chart into an XML file.
- XML files are often used to hold table-like data, The basic structure closely follows the structure of a relational database. The root element holds several table elements. Each of those elements holds "records" that hold "fields".
- Used to represent a simple list of values

### XML Summary

XML files are hierarchical so they are a natural choice for storing hierarchical data. Though you can store
hierarchical data in other types of databases, they are unlikely to be able to re-create the hierarchical
object structure as quickly as XML tools can. XML files allow you to create elements within other elements just about anywhere you like, so they are semi-structured.

Because XML files are plain old text files, they have some of the limitations of text files. In particular, you cannot add, delete, or modify data in the middle of an XML file. To update an XML file, a program typically reads the file into memory, makes its changes, and then writes the result back into the file.

This read-modify-write nature means XML documents are not great multi-user databases. An XML
document works fine if many users need to read it but it’s harder to allow them to update the file without
interfering with each other.

## Network

A network contains a collection of nodes that are connected by links. The nodes and links can represent all sorts of things such as telephone lines, streets, airline routes and electric circuits.

## Object

Modern programming languages are object-oriented. An object database manages objects. It provides some sort of query syntax for retrieving objects from the database.

## Object-Relational

An object-relational database (ORD) or object-relational database management system (ORDBMS) is a
relational database that provides extra features for integrating object types into the data. Like a relational
database, it can perform complex queries relatively quickly. Like an object database, it uses some special
syntax to simplify the creation of objects.

A closely related concept is the object-relational mapping system. An object-relational mapping system provides
a layer between the object-oriented code and a relational database to convert between objects and
relational data. If this layer does a good job of separating the objects and the database, programmers and
database developers can ignore the details of each others’ work. This lets them work more independently,
makes them more productive, and makes it easier for either group to accommodate changes in the other
group’s work


## Document-Oriented
