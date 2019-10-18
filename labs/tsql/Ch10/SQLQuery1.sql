use TSQLV4

select * from sales.orders where orderid > 11070;
select * from sales.OrderDetails where orderid > 11070;


BEGIN TRAN;

  -- Declare a variable
  DECLARE @neworderid AS INT;

  -- Insert a new order into the Sales.Orders table
  INSERT INTO Sales.Orders
      (custid, empid, orderdate, requireddate, shippeddate, 
       shipperid, freight, shipname, shipaddress, shipcity,
       shippostalcode, shipcountry)
    VALUES
      (85, 5, '20160212', '20160301', '20160216',
       3, 32.38, N'Ship to 85-B', N'6789 rue de l''Abbaye', N'Reims',
       N'10345', N'France');

  -- Save the new order ID in a variable
  SET @neworderid = SCOPE_IDENTITY();

  -- Return the new order ID
  SELECT @neworderid AS neworderid;

  -- Insert order lines for new order into Sales.OrderDetails
  INSERT INTO Sales.OrderDetails(orderid, productid, unitprice, qty, discount)
    VALUES(@neworderid, 11, 14.00, 12, 0.000),
          (@neworderid, 42, 9.80, 10, 0.000),
          (@neworderid, 72, 34.80, 5, 0.000);

-- Commit the transaction
COMMIT TRAN;

-- Cleanup
DELETE FROM Sales.OrderDetails
WHERE orderid > 11077;

DELETE FROM Sales.Orders
WHERE orderid > 11077;



