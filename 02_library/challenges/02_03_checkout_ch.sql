-- Check out two books for Jack Vaan (jvaan@wisdompets.com).
-- Book 1: The Picture of Dorian Gray, 2855934983
-- Book 2: Great Expectations, 4043822646
-- The checkout date is August 25, 2022 and the 
-- due date is September 8, 2022.

--Book1
INSERT INTO Loans
  (BookID, PatronID,LoanDate, DueDate)
VALUES 
  ((SELECT BookID From Books
    Where Barcode = '2855934983'),
  (Select PatronID FROM Patrons
    Where Email = 'jvaan@wisdompets.com'),
    '2022-08-25', '2022-09-08');

-- Book2
INSERT INTO Loans
  (BookID, PatronID,LoanDate, DueDate)
VALUES (
  (SELECT BookID From Books
    Where Barcode = '4043822646'),
  (Select PatronID FROM Patrons
    Where Email = 'jvaan@wisdompets.com'),
    '2022-08-25', '2022-09-08');

--Check
SELECT*
FROM Loans AS L
JOIN Books AS B ON L.BookID = B.BookID
WHERE PatronID = (SELECT PatronID From Patrons Where Email = 'jvaan@wisdompets.com')
Order BY LoanDate DESC;