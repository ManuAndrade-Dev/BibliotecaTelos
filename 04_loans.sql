-- Registrar empréstimo
INSERT INTO Loans (book_id, user_id, loan_date, return_date)
VALUES (2, 1, GETDATE(), NULL);

-- Registrar devolução
UPDATE Loans
SET return_date = GETDATE()
WHERE loan_id = 1;
