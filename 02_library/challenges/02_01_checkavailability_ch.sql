-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.

SELECT
  Count(Title)
FROM Books
Where Title = 'Dracula';

Select 
  Count(B.Title)
From Loans As L
JOIN Books AS B ON L.BookID = B.BookID
Where L.ReturnedDate IS NULL
  AND B.Title = 'Dracula';

SELECT
  (SELECT COUNT(Books.Title) 
    FROM Books 
    WHERE Books.Title = 'Dracula') - 
  (SELECT COUNT(Books.Title)
    FROM Books 
    JOIN Loans ON Books.BookID = Loans.BookID 
    WHERE Books.Title = 'Dracula' 
    AND Loans.ReturnedDate IS NULL)
  AS AvailableCopies;