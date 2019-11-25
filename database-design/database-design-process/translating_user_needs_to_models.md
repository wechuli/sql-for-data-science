# Translating User Needs into Data Models

You have worked with customers to gain a full understanding of the problem at hand. The result should be a big pile of facts, golas, needs and requirements that should be part of the new database and its surrounding ecosystem. You may already have made some connections among various parts of this information, but mostly it should be a big heap of requirements that doesn't say too much about the database's design and construction.

This kind of pile of information is sometimes called a contextual list. It's basically just a list of important stuff (although it may be fairly elaborate and include requirements documents, diagrams, charts and all sorts of other supporting documentation)

The next step in turing the conceptual list into a database is converting it into a more formal model. You can compare the formal model to the contextual list and make sure that the model can handle all of your requirements.

## What are Data Models

A model is a plan. It's a blueprint for building something, in this case, a database. The purpose of the model isn't do anything by itslef. Instead, it gives you a concrete way to think about the database that you are going to build. By studying the pieces of the model, you can decide whether it represents all of the data that you need to meet your customers' needs.

A model is also useful for ensuring that everyone on the project has the same understanding of what needs to be done.

After you build a model, you can look at it and ask questions such as:
❑ Where do we store customer information?
❑ How many contact names can we store for a customer?
❑ Where do we store the contacts’ favorite colors?
❑ What if we need to store multiple price points for the same product?
❑ How do we store the seventeen kinds of addresses we need for customers?
❑ Where do we store supplier information?
❑ If someone asks about an order they placed but haven’t received, how can we figure out where
it is?

You should also work through any use cases or current scenarios and see if the model can handle them. The end users can help a lot with this part. Though they may not understand the models, they do understand their business and can ask these sorts of questions while you and other developers try to figure out if the model can handle them.

## Kinds of models

- First, a user interface model views the database at a very high level as seen from the final user's point of view. This model is very far from the final database implementation and it doesn't tell much about the database design. This model is useful for understanding what data is needed by the project and how you might use it to navigate through the user interface.
- The second and third types of models described are semantic object models and entity-relationship models. These are roughly at the same distance from the final database. They are at a slightly lower level than the user interface model and show relationships among data entities more explicitly. They are still at a moderately high logical level, however and do not provide quite enough detail to build the final database.
- The fourth type of model is the relational model. This model mimics the structure of a relational database closely enough that you can actually sit down and start building the database.

### User Interface Models

In most database applications, a user will eventuall see the data in some form.For example, an order
entry and tracking application might use a series of screens where the user can perform such chores as
entering orders, tracking orders, marking an order as paid, looking up available inventory, and so forth.
Those screens form the database’s user interface.

Some databases don’t have their own user interfaces, at least not that a human will see. Some databases
are designed to store data for other applications to manipulate. In that case, it is the interfaces that those
other applications provide that the human user sees. If possible, you should consider what those applications
will need to display and plan accordingly.

You should also consider how those other applications will get the data from your database. The way in
which those applications interact with your database forms a non-human interface and you should plan
for that one, too.

To build the user interface model, start by making rough sketches of the screens that the user will see. Often these first sketches can come directly from paper forms if any exist.

A large application might include dozens or even hundreds of forms, each of which gives only a partial glimpse of the information contained in the database. Together these mocked-up screens form a user interface model that shines spotlights into the data needed to support the application.

With the user interface model in hand, you are now ready to build a more formal model that shows the entities used by the application in greater detail

### Semantic Object Models

A semantic object model (SOM) is intended to represent a system at a fairly high level. Though the ideas are somewhat technical, they still relate fairly closely to the way people think about things, so semantic object models are relatively understandable to users.

#### Classes and Objects

Intuitively, a semantic class is a type of thing you might want to represent in your system. This can include physical objects such as people, furniture, inventory items and invoices. It can also include logical abstractions such as report generators, tax years and work queues.

Technically, a semantic class is a named collection of attributes that are sufficient to identify a particular entity. A *semantic object* (SO) is an instance of a semantic class. It is an entity instance that has all of the attributes defined by the class filled in.

Attributes come in 3 flavors: simple, group and object.
- A *simple attributes* holds a simple value such as string, number or date.
- A *group attribute* holds a composite value - a value that is composed of other values.
- An *object attribute* holds a composite value - a value that is composed of other values.

##### cardinality

An attribute's cardinality tells how many values of that attribute an object might have.

##### Identifiers

An *object identifier* is a group of one or more attributes that the users will typically use to identify an object in the class.