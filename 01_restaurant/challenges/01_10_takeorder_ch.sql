-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

-- Nested Subquery for CustomerID 
SELECT
  CustomerID
FROM Customers
WHERE LastName = 'Hundey' And Address = '6939 Elka Place';

-- Creating the order
INSERT into Orders
  (CustomerID, OrderDate)
VALUES (
  (SELECT CustomerID
    FROM Customers
    WHERE LastName = 'Hundey' And Address = '6939 Elka Place'),
  '2022-09-20 14:00');

-- Checking the order was created
Select *
FROM Orders
Where CustomerID = (SELECT CustomerID
    FROM Customers
    WHERE LastName = 'Hundey' And Address = '6939 Elka Place')
ORDER BY OrderDate DESC;

-- Correcting the timestamp
Update Orders
Set OrderDate = '2022-09-20 14:00:00'
Where OrderID = 1001;

-- Adding the ordered dishes to the OrderDish table
INSERT into OrdersDishes
  (OrderID, DishID)
VALUES 
  (1001, (Select DishID FROM dishes Where Name = 'House Salad')),
  (1001, (Select DishID FROM dishes Where Name = 'Mini Cheeseburgers')),
  (1001, (Select DishID FROM dishes Where Name = 'Tropical Blue Smoothie'));

--Checking the oder deatils were added
Select *
FROM OrdersDishes
Order By OrderID DESC;

SELECT * 
FROM Dishes 
JOIN OrdersDishes ON Dishes.DishID = OrdersDishes.DishID 
WHERE OrdersDishes.OrderID = 1001;

-- Total sum of the order
Select
  SUM(D.Price)
FROM Dishes AS D
Join OrdersDishes AS OD ON D.DishID = OD.DishID
Where OD.OrderID = 1001;