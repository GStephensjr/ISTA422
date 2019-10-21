### Title: tsqlfuns-hw11b
#### Author: Greg Stephens
#### Date: 02 October, 2019
___

##### 1. What is dynamic SQL?
dynamic sql is a capability that allows you to construct a batch of tsql code as a character string and then execute it

##### 2. In executing dynamic SQL, what are the differences between using the EXEC command and the sp executesp stored procedure?
(Pg380)

- The EXEC command accepts a character string in parentheses as input and executes the batch of code
within the character string.
- sp executesp has an interface; that is, it supports input and output parameters and it only supports unicode character strings

##### 3. What is a SQL injection attack? Give an example of an attack.
sql injection is when a hacker incorporates sql into an input string in an attempt to get the database to run the command. if the input string is concatenated, it is possible for the hacker to run commands through the input string like running a command to drop a table through the input form

##### 4. How do you execute the EXEC command? Write a complete example using the TSQLV4 database.

      DECLARE @sql AS VARCHAR(100);
      SET @sql = 'PRINT ''This message was printed by a dynamic SQL batch.'';';
      EXEC(@sql);

##### 5. Describe the use of input parameters and output parameters for the sp executesql stored procedure.
there are two input parameters, one holding your batch of code, the second

##### 6. What are the three kinds of routines that T-SQL recognizes?


##### 7. What is the difference between a stored procedure, a user defined function, and a trigger?
- The purpose of a user-defined function (UDF) is to encapsulate logic that calculates something, possibly based on input parameters, and return a result.
- Stored procedures are routines that encapsulate code. They can have input and output parameters, they can return result sets of queries, and they are allowed to have side effects. Not only can you modify data through stored procedures, you can also apply schema changes through them.(Pg385)
- A trigger is a special kind of stored procedure—one that cannot be executed explicitly. Instead, it’s
attached to an event. Whenever the event takes place, the trigger fires and the trigger’s code runs

##### 8. What is the primary function of a UDF? This is not specifically stated in the book but is clear from the context of the discussion in the book.
a udf seems like a good choice to use to provide views

- to perform evaluations, transforms an expression into a value

##### 9. (Not in book.) What are side effects, and why are they dangerous?
side effects are unintended changes done to your data through your stored procedures and they're so dangerous because the changes aren't necessarily obvious and can be hard to track down

side effects are changes made outside the scope of execution

##### 10. What is the principle distinction between a UDF and a stored procedure?
a stored procedure can have side effects

user defined functions evaluate to a value; they cannot have side effects

##### 11. Given that you cannot execute a trigger explicitly, what is the advantage of using triggers?
you dont have to write it every time you need it to run, attached to an event it will run whenever triggered

##### 12. In using error handling in T-SQL, can you mimic a finally block? If so, how?
No

##### 13. Write a user defined function that returns a Booleans as to whether a customer may purchase alcohol as of the instant that the function runs.


##### 14. Write a trigger that places a customer in the OFF LIMITS table if he attempt to purchase alcohol when he is underage.


##### 15. Write a stored procedure that deletes customers from the OFF LIMITS table when they have reached their 21st birthday.
