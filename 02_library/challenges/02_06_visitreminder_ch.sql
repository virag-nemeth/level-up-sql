-- Prepare a report of the library patrons
-- who have checked out the fewest books.

SELECT
  P.FirstName,
  P.LastName,
  P.Email,
  Count(L.LoanID) AS LoanCount
FROM Loans AS L
JOIN Patrons AS P ON L.PatronID = P.PatronID
Group BY P.PatronID
Order BY LoanCount
Limit 9;