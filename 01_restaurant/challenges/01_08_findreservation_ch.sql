-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant

-- There are four people in the party. Today is June 14th.

SELECT 
  R.CustomerID,
  C.FirstName,
  C.LastName,
  R.PartySize,
  R.Date
FROM Reservations AS R
JOIN Customers As C ON C.CustomerID = R.CustomerID
Where C.LastName Like 'St%'
    And R.PartySize = 4
ORDER BY R.Date DESC;