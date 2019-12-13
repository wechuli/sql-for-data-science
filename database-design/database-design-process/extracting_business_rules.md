# Extracting Business Rules

Before you convert a relational model into a working relational database, you should optimize the relational model to make the final database as flexible and efficient as possible.

Optimizing the model now is easier than reorganizing the database later, so it's worth taking some time to make sure you get the database design right the first time.

The first step in optimizing the database is extracting business rules. Keeping business rules separate from other database constraints and relations, at least logically, makes later changes to the database easier.

## What are Business Rules ?

Business rules describe the objects, relationships and actions that a business finds important and worth writing down. They include rules and policies that define how a business operates and handles its day-to-day operations. They generally help a business satisfy its goals and meet its obligations.

Examples of business rules are:

❑ Don’t make a Customer record until the customer buys something and has an associated
order.
❑ Customer records must have first and last names. (If Bono, Everlast, or Madonna buys
something, get an autograph and make up a last name.)
❑ If a student doesn’t enroll in at least one class, change the Status field to Inactive.
❑ If a salesperson sells more than 10 hot tubs in one month, award a $200 bonus.
❑ All Contact records must have at least one phone number or email address.
❑ If an order totals more than $100 before taxes and shipping, give a 10 percent discount.
❑ If an order totals more than \$50 before taxes and shipping, give free shipping.
❑ Employees get a 1 percent discount.
❑ If the in-stock quantity of an inventory item drops below the number of items sold during
the last month, order more.

From a database point of view, business rules are constraints.

Some are simple constraints such as:
❑ All orders must have a ContactPhoneNumber.
Simple rules such as this one map easily to the features provided by a relational database. It’s easy
to indicate that a field has a certain data type or that it is required (as in this case).
Other business rules may represent quite complex constraints such as:
❑ A student’s number of course hours plus number of project hours must be between
1 and 14.

You can implement some of these more complex rules with check constraints or foreign key constraints.
Some constraints may require you to gather data from several different tables. This kind of very complex check is probably best performed by code either in the database itself or in external software.

All of these rules are implemented as constraints in one form or another, whether as easy database
features (requiring a field), as harder database features (check constraints and foreign keys), or in
code (inside or outside of the database).

## Identifying Key Business Rules

Writing down all of the business rules is worthwhile in its own right so you make sure they all get implemented somehow in the database. It's also worth categorizing the business rules so you can build them properly.

How you implement a business rule depends not only on how tricky it is to build, but also on how likely it will be to change later. If a rule is likely to change later, you may be better off building it by using a more complicated but more flexible method.

To identify these key business rules, ask yourself two questions. first, how easy is it to change a rule ?
Second, how likely is the rule to change? If a rule is likely to change frequently, it's probably worth some extra planning to make changing the rule easier.

Types of rules that make good candidates for extra attention include:

- **Enumerated Values**
- **Calculation Parameters**
- **Validity parameters**
- **Cross-record and cross-table checks**
- **Generalizable constraints** - If you think you may need to apply a similar constraint later, you should think about generalizing the constraint and moving it out of the database proper.
- **Very complicated checks** - Some checks are so complex that it's just easier to move them into code, either stored within the database or in external code modules.

Types of rules that are usually not worth special attention and can just be implemented directly in the database include:

- **Enumerated types with fixed values**
- **Data type requirements**
- **Required Values**
- **Sanity Checks**

So write down all of the business rules you can discover. Include the domains of every field and any simple bounds checks in addition to more complicated rules.

Group the rules by how likely they are to change and how hard they would be to change. Then take a closer look at the ones that are likely to change and that will be hard to change and see it you shouldn't pull them out of the database's structure.

## Extracting Key Business Rules

Now that you've identified the business rules that will be tricky to implement within the database or that may change frequently, pull them out of the database. There are a couple of standard approaches for doing that.

- First, if the rule is a validation list, convert it into a foreign key constraint.
- Second, if the rule is a fairly straightforward calculation with parameters that may change, pull the parameters out and put them in a table.
- Third, if a calculation is complicated, extract it into code. That doesn't necessarily mean you need to write the code in programming language, many database products can store and execute stored procedures. A stored procedure can select and iterate through records, perform calculations, make comparisons and do just about anything that a full-fledged programming language can.

So what's the point of moving checks into a stored procedure ? Partly, it's a matter of perception. Pulling the check out of the database's table structure and making it a stored procedure separates it logically from the tables. That makes it easier to divide up maintenance work on the database into structural work and programming work.

Of course, you can also build the check into code written in a traditional programming language. You may be able to invoke that code from the database or you might use it in the project's user interface.

## Multi-Tier Applications

A multi-tier application uses several different layers to handle different data-related tasks. The most common form of multi-tier application uses three tiers.

The first tier (often called the user interface tier or use interface layer) is the user interface. It displays data and lets the use manipulate it. It might perform some basic data validation such as ensuring that required fields are filled in and that numeric values are actually numbers, but it doesn't implement complicated business rules.

The third tier (often called the data or database tier or layer) is the database. It stores the data with as few restrictions as possible.

The middle tier (often called the middle or business tier or layer) is a service layer that moves data between the first and third tiers. This is the tier that implements all of the business rules. When the user interface tier tries to send data back to the database, the middle tier verifies that the data satisfies the business rules and either sends the data to the data tier or complains to the user interface tier. When it fetches data
from the database, the middle tier may also perform calculations on the data to create derived values to
forward to the user interface tier.

The main goal of a multi-tier architecture is to increase flexibility.The user interface and database
tiers can work relatively independently while the middle tier provides any necessary translation. For
example, if the user interface changes so a particular value must be displayed differently (perhaps in
a dropdown instead of in a text box), it can make that change without requiring any changes to the
database. If the database must change how a value is stored (perhaps as a string Small/Medium/Large
instead of as a numeric size code), the user interface doesn’t need to know about it. The middle tier
might need to be adjusted to handle any differences but the first and third tiers are isolated from
each other.

The middle tier also concentrates most of the business logic. The user interface and database perform
basic validations but the middle tier does all of the heavy lifting.

Another advantage of multi-tier systems is that the tiers can run on different computers. The database
might run one a computer at corporate headquarters, the middle tier libraries might run on a second
computer (or even split across two other computers), and the user interface can run on many users’
computers. Or all three tiers might run on the same computer. Separating the tiers lets you shuffle them
around to fit your computing environment.

In practice, there’s some benefit to placing at least some checks in the database tier so, if there’s a problem
in the rest of the application, the database has the final say.

There’s also some value to placing basic checks in the user interface so the application doesn’t need to
perform unnecessary round trips to the database.

Adding validations in both the user interface and the database requires some redundancy, but it’s worth
it. (Also notice that the user interface developers and database programmers can do their work separately
so they can work in parallel.)
