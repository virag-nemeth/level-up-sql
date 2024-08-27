-- Create reports that will be used to make three menus.

-- Create a report with all the items sorted by price (lowest to highest).
-- Create a report showing appetizers and beverages.
-- Create a report with all items except beverages.

SELECT
  Type,
  Name,
  Description,
  Price
FROM Dishes
Order BY  Price ASC;

SELECT
  Type,
  Name,
  Description,
  Price
FROM Dishes
Where Type Is 'Appetizer' OR Type IS 'Beverage'
ORDER BY Type;

SELECT
  Type,
  Name,
  Description,
  Price
FROM Dishes
WHERE Type != 'Beverage'
ORDER BY Type;