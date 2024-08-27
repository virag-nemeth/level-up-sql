-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.

SELECT DishID
FROM Dishes
Where name = 'Quinoa Salmon Salad';

SELECT
  FirstName,
  LastName,
  FavoriteDish
FROM Customers
Where FirstName = 'Cleo' AND LastName = 'Goldwater'

Update Customers
  Set FavoriteDish = (SELECT DishID FROM Dishes Where name = 'Quinoa Salmon Salad')
  Where FirstName = 'Cleo' AND LastName = 'Goldwater';

SELECT 
  C.FirstName, 
  C.LastName,
  C.FavoriteDish, 
  D.Name 
FROM Customers AS C
JOIN Dishes AS D ON C.FavoriteDish = D.DishID
Where FirstName = 'Cleo' AND LastName = 'Goldwater';
