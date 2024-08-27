-- Update a customer's contact information.

-- Taylor Jenkins, of 27170 6th Ave., Washington, DC,
-- has moved to 74 Pine St., New York, NY.

-- This one is to find the person whose data needs to be modified
SELECT CustomerID, FirstName, LastName, Address 
FROM Customers 
WHERE FirstName = 'Taylor' 
AND LastName = 'Jenkins';

-- This one is to modify the data
UPDATE Customers
Set Address = '74 Pine St.',
    City = 'New York',
    State = 'NY'
WHERE CustomerID = 26;

-- This one is to check the modified data is correct
SELECT * 
FROM Customers 
WHERE CustomerID = 26;
