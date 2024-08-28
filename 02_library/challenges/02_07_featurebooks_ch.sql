-- Create a list of books to feature in an exhibit.

-- Make a pick list of books published from 1890-1899 
-- which are not currently checked out.

SELECT
  BookID,
  Title,
  Published,
  Barcode
From Books
WHERE Published Between 1890 AND 1899
AND (BookID NOT IN
  (SELECT BookID From Loans
  Where ReturnedDate IS NULL))
Order BY Title;