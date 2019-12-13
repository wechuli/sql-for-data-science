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
