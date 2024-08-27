-- Create a reservation for a customer who may or may not
-- already be listed in our Customers table.

-- Use the following information:
-- Sam McAdams (smac@kinetecoinc.com), for 5 people
-- on August 12, 2022 at 6PM (18:00)

Select *
FROM Customers
Where Email = 'smac@kinetecoinc.com';

INSERT INTO Customers
  (FirstName, LastName, Email)
  VALUES ('Sam', 'McAdams', 'smac@kinetecoinc.com');

INSERT INTO Reservations
  (CustomerID, Date, PartySize)
  VALUES (
    (Select CustomerID 
      FROM Customers 
      Where Email = 'smac@kinetecoinc.com'),
      '2022-08-12 18:00', 5);

Select
  C.FirstName,
  C.LastName,
  C.Email,
  R.Date,
  R.PartySize
FROM Customers AS C
JOIN Reservations AS R ON C.CustomerID = R.CustomerID
Where C.Email = 'smac@kinetecoinc.com';
