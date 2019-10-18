### Title: tsqlfuns-hw10
#### Author: Greg Stephens
#### Date: 13 September, 2019
___
##### 1. What is the purpose of transactions? Why do we use transactions in SQL scripts?
the purpose of transactions is to propagate changes to the database. Transactions are essential for maintaining data integrity, both for multiple related operations and when multiple users that update the database concurrently
https://www.tutorialspoint.com/sql/sql-transactions.htm
##### 2. Briefly describe each of the ACID properties.
- Atomicity − ensures that all operations within the work unit are completed successfully. Otherwise, the transaction is aborted at the point of failure and all the previous operations are rolled back to their former state.
- Consistency − ensures that the database properly changes states upon a successfully committed transaction.
- Isolation − enables transactions to operate independently of and transparent to each other.
- Durability − ensures that the result or effect of a committed transaction persists in case of a system failure.

##### 3. What do we mean when we talk about the granularity of locks?
Lock granularity specifies which resource is locked by a single lock attempt. The SQL Server Database Engine can lock the following resources
  - Row
  - Page
  - Index key/Range of index keys
  - Table
  - Extent
  - Database
https://logicalread.com/sql-server-lock-granularity-mc03/

##### 4. What do we mean when we talk about the modes of locks?
Lock modes specify different kinds of locks. The choice of which lock mode to apply depends on the resource that needs to be locked. The following three lock types are used for row- and page-level locking:
- Shared(S)
- Exclusive(X)
- Update(U)
https://logicalread.com/sql-server-lock-modes-mc03/

##### 5. In your own words, describe blocking, and give an example.
its like trying to check a book out from the library and someone else already has it checked out but you dont have the authority to make them bring the book back so you wait until they're finished with it

##### 6. What are the properties of locks? That is, list the column name and column type of the fields in sys.dm_tran_locks.
https://docs.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-tran-locks-transact-sql?view=sql-server-2017

##### 7. What are the properties of sessions? That is, list the column name and column type of the fields in sys.dm_exec_connections.
https://docs.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-exec-connections-transact-sql?view=sql-server-2017

##### 8. What are the requests of sessions? That is, list the column name and column type of the fields in sys.dm_exec_requests.
https://docs.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-exec-requests-transact-sql?view=sql-server-2017

##### 9. What is an isolation level? Give an example of the operation of an isolation level.
Transactions specify an isolation level that defines the degree to which one transaction must be isolated from resource or data modifications made by other transactions. Isolation levels are described in terms of which concurrency side effects, such as dirty reads or phantom reads, are allowed.

https://docs.microsoft.com/en-us/sql/connect/jdbc/understanding-isolation-levels?view=sql-server-2017

##### 10. (Not in the book.) What do we mean when we say that an object is serializable?
In a Serializable isolation level all the rows are locked for the duration of the transaction, no insert,update or delete is allowed.
https://stackoverflow.com/questions/13374335/what-is-the-difference-between-serializable-and-repeatable-read-isolation-level
##### 11. What is an deadlock? Give an example of a deadlock?
A deadlock occurs when two processes are trying to update the same record or set of records, but the processing is done in a different order and therefore SQL Server selects one of the processes as a deadlock victim and rolls back the statements

you have two sessions that are updating the same data, session 1 starts a transaction updates table A and then session 2 starts a transaction and updates table B and then updates the same records in table A. Session 1 then tries to update the same records in table B. At this point it is impossible for the transactions to be committed, because the data was updated in a different order and SQL Server selects one of the processes as a deadlock victim
https://www.mssqltips.com/sqlservertip/1036/finding-and-troubleshooting-sql-server-deadlocks/
