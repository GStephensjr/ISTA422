### Title: tsqlfuns-hw11a
#### Author: Greg Stephens
#### Date: 25 September, 2019
___

##### 1. Why do we use variables in T-SQL? How do you declare and initialize T-SQL variables? Can you declare and initialize a variable in a single step?
- You use variables to temporarily store data values for later use in the same batch in which they were declared.
- you declare variables with the declare keyword and initialize them with the set keyword. doing both in one line looks like this:
      DECLARE @i AS INT = 10;

##### 2. Why is the assignment SET method for setting a variable safer than the assignment SELECT method?
The SET statement is safer than the assignment SELECT because it requires you to use a scalar subquery to pull data from a table. Remember that a scalar subquery fails at run time if it returns more than one value.(Pg 363)

##### 3. Describe what is meant by a batch file in T-SQL? What is the difference between batches and transactions?
- A batch is one or more T-SQL statements sent by a client application to SQL Server for execution as a single unit
- transaction is an atomic unit of work. A batch can have
multiple transactions, and a transaction can be submitted in parts as multiple batches(Pg 363)

##### 4. Can a transaction be split between multiple batches? Can a batch be split between multiple transactions? Explain.
a batch can contain multiple transactions. a transaction can also span across multiple batches. but a transaction cannot directly contain a batch because it is an atomic unit of work.(Pg 363)

##### 5. What is meant when the book says that “a batch is a unit of resolution?” Explain binding.
A batch is a unit of resolution (also known as binding). This means that checking the existence of
objects and columns happens at the batch level.(366)

##### 6. What is the scope of variables with respect to T-SQL batches?
table variables are visible only to the creating session, but because they are variables they have a more limited scope: only the current batch. Table variables are visible neither to inner batches in the call stack nor to subsequent batches in the session(Pg377)


##### 7. Give a practical example of the use of the GO n operator that is not in the book.
you could use the GO operator to run a statement that removes the top row 50 times to get rid of the top 50 entries from your table

##### 8. How to you delimit if ...else constructions that contain multiple statements?
you use a statement block by using the BEGIN and END keywords


##### 9. Does T-SQL provide a SWITCH ...CASE type of construct? See chapter 2 if you don’t recall. If it exists, is it interchangeable with the if ...else construct?
there is a case keyword you can use for switch case capability but it cannot be interchanged with the if else construct because you cant use statement blocks with the case keyword since the end keyword is used to end the case

##### 10. What is the difference between a relation and a cursor?
relation focuses on what to get and cursors focus on how to get it. a relation is a set containing unique items in no order, a cursor is a collection that can contain unique items

##### 11. What are the specific steps to use a cursor? List the steps.


##### 12. What is the scope of a local temporary table?
its local to the batch it was defined in

##### 13. When are global temporary tables destroyed? What is the main difference between local temporary tables and global temporary tables?
when the session ends

##### 14. Under what conditions would you use a table variable instead of a local temporary table? Why would you refer to use a local temporary table instead of a table variable?


##### 15. What is a table type? What is the syntax for creating a table type? Whhat is the syntax for using a table type?
