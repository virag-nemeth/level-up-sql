-- Create two reports about book statistics.

-- Report 1: Show how many titles were published 
-- in each year.

-- Report 2: Show the five books that have been
-- checked out the most.

--Report '1
SELECT
  Published,
  Count(DISTINCT(Title)) AS TitleCount
FROM Books
Group BY Published
ORDER BY TitleCount DESC;

-- Report 2
SELECT
  B.Title,
  Count(L.LoanID) AS LoanCount
From Loans AS L
Join Books AS B ON L.BookID = B.BookID
Group BY B.Title
Order BY LoanCount DESC
Limit 5;