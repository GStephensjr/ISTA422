  ---------------------------------------------------------------------
-- Isolation Levels
---------------------------------------------------------------------

---------------------------------------------------------------------
-- The READ UNCOMMITTED Isolation Level
---------------------------------------------------------------------

-- Connection 1
BEGIN TRAN;

  UPDATE Production.Products
    SET unitprice += 1.00
  WHERE productid = 2;

  SELECT productid, unitprice
  FROM Production.Products
  WHERE productid = 2;


  ROLLBACK TRAN;



  ---------------------------------------------------------------------
-- The READ COMMITTED Isolation Level
---------------------------------------------------------------------

-- Connection 1
BEGIN TRAN;

  UPDATE Production.Products
    SET unitprice += 1.00
  WHERE productid = 2;

  SELECT productid, unitprice
  FROM Production.Products
  WHERE productid = 2;

  COMMIT TRAN;


  
---------------------------------------------------------------------
-- The REPEATABLE READ Isolation Level
---------------------------------------------------------------------

-- Connection 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

BEGIN TRAN;

  SELECT productid, unitprice
  FROM Production.Products
  WHERE productid = 2;
  

-- Connection 1
  SELECT productid, unitprice
  FROM Production.Products
  WHERE productid = 2;
  COMMIT TRAN;

  
---------------------------------------------------------------------
-- The SERIALIZABLE Isolation Level
---------------------------------------------------------------------

-- Connection 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

BEGIN TRAN

  SELECT productid, productname, categoryid, unitprice
  FROM Production.Products
  WHERE categoryid = 1;


  
  SELECT productid, productname, categoryid, unitprice
  FROM Production.Products
  WHERE categoryid = 1;

COMMIT TRAN;

