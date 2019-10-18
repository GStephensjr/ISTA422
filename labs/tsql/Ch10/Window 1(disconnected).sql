--WINDOW 1

USE TSQLV4

--Connection 1
BEGIN TRAN;

  UPDATE Production.Products
    SET unitprice += 1.00
  WHERE productid = 2;


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


