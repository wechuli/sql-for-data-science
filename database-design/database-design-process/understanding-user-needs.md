# Understanding User Needs

You need to translate the customers' needs, wants and desires from the sometimes fuzzy ideas floating around in their heads into a product that meets the customer's needs.

The first step in the translation process is understanding the user's requirements.

- Understand the customer's needs and motivations
- Gather and document user requirements
- Cull requirements from existing practices and information
- Build use cases to understand the user's needs and to measure success or failure
- Anticipate changes and future needs to build the most flexible database possible

## Make a Plan

- Bring a List of Questions
- Meet the Customers
- Learn Who's Who
- Pick the Customers' Brains
- Walk a Mile in the User's Shoes
- Study Current Operations
- Brainstorm
- Look to the Future
- Understand the Customers' Reasoning
- Learn What the Customers Really Need
- Prioritize
- Verify Your Understanding
- Write the Requirements Document
- Make Use Cases
- Decide Feasibility

### 1. Bring a List of Questions

From the very first day, you should start thinking of questions to ask the customers to get a better idea of the project's goals and scope.
Ask about the following:

#### _Functionality_

These questions deal with what the system is supposed to accomplish and to a lesser extent, how.
❑ What should the system do?
❑ Why are you building this system? What do you hope it will accomplish?
❑ What should it look like? Sketch out the user interface.
❑ What response times do you need for different parts of the system? (Typically, interactive
response times should be under five seconds, whereas reports and other offline activities may
take longer.)
❑ What reports are needed?
❑ Do the end users need to be able to define new reports?
❑ Who are the players? (ties to previous section)
❑ Do power users and administrators need to be able to define new reports?

#### _Data Needs_

These questions help clarify the project's data needs. Knowing what data is needed will help you start defining the database's tables
❑ What data is needed for the user interface?
❑ Where should that data come from?
❑ How are those pieces of data related?
❑ How are these tasks handled today?Where does the data come from?

#### Data Integrity

These questions deal with data integrity. They help you define some of the integrity constraints that you will build into the database.

❑ What values are allowed in which fields?
❑ Which fields are required? (For example, does a customer record need a phone number? A fax
number? An email address? One of those but not all of them?)
❑ What are the valid domains (allowed values) for various fields? What phone number formats
are allowed? How long can customer names be? Addresses? Do addresses need extra lines
for suite or apartment number? Do addresses need to handle U.S. ZIP Codes such as 12345?
ZIP+4 Codes such as 12345-6789? Canadian postal codes such as T1A 6G9? Or other countries’
postal codes?
❑ Which fields should refer to foreign keys? (For example, an address’s State field might need to be
in the States table and a CustomerID field might need to be in the Customers table. I’ve seen customers
with a big list of standard comments and a Comments field can only take those values.)
❑ Should the system validate cities against postal codes? (For example, should it verify that the
10005 ZIP Code is in New York City, New York? That’s cool but a bit tricky and can involve a lot
of data.)
❑ Do you need a customer record before you can place orders?
❑ If a customer cancels an account, do you want to delete the corresponding records or just flag
them as inactive?

- What level of system reliability is needed?
  ❑ Does the system need 24/7 access?
  ❑ How volatile is the data? How often does it need to be backed up?
  ❑ How disastrous will it be if the system crashes?
  ❑ How quickly do you need to be back up and running?
  ❑ How painful will it be if you lose some data during a crash?

#### Security

These questions focus on the application's security. The answers to these questions will help you decide which database product will work best and what architecture to use.

❑ Does each user need a separate password? (Generally a good idea.)
❑ Do different users need access to different pieces of data? (For example, sales clerks might need
to access customer credit card numbers but order fulfillment technicians probably don’t.)
❑ Does the data need to be encrypted within the database?
❑ Do you need to provide audit trails recording every action taken and by whom? (For example,
you can see which clerk increased the priority of a customer who was ordering the latest iPod
and then ask that clerk why that happened.)
❑ What different classes of users will there be?
❑ How many of each class of user will there be? Will only one person need access to the data at a
time?Will there be hundreds or even thousands (as is the case with some Web applications)?
❑ Is there existing documentation describing the users’ tasks and responsibilities?

#### Environment

These questions deal with the project's surrounding environment. They gather information about other systems and processes that the project will replace or with which it will interact.

- Does this system enhance or replace an existing system?
  ❑ Is there documentation describing the existing system?
  ❑ Does the existing system have paper forms that you can study?
  ❑ What features in the existing system are required? Which are not?
  ❑ What kinds of data does the existing system use? How is it stored? How are different pieces
  of data related?
  ❑ Is there documentation for the existing system’s data?
- Are there other systems with which this one must interact?

  ❑ Exactly how will it interact with them?
  ❑ Will the new project send data to existing systems? How?
  ❑ Will the new project receive data from existing systems? How?
  ❑ Is there documentation for those systems?

- How does your business work ? (Try to understand how this project fits into the bigger picture)

### 2. Meet the Customers

Before you can start any project, you need to know what is is about. The best way to understand the system you need to design and build is to interrogate the customers. So when you first start a project, meet the customers. Get to know them and what they do. Even if the problem you are trying to solve is only a small part of their business, get a fell for the overall picture.

### 3. Learn Who's Who

As you get to know the customers (and your team members), it's important to realize that not everyone shares the same vision of the product. You need to figure out which customer is the leader, which are team players, which have little or no say in specifying the project, and which will be super villains.

### 4. Pick the Customers' Brains

Once you figure out more or less who the movers and shakers are, you can start picking their brains.Sit
down with the Customer Champion and find out what the customers think they need. Find out what
they think the solution should look like. Find out what data they think it should contain, how that data
will be presented, and how different parts of the data are related.

Get input from as many Stakeholders as you can. Always keep in mind, however, that the Customer
Champion is the one who understands the customers’ needs thoroughly and has the authority to make
the final decisions. Though you should consider everyone’s opinions, the Customer Champion has the
final word.Take your time and make sure the customers have finished telling you what they think they need.
