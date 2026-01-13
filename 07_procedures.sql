-- Registrar empréstimo
CREATE PROCEDURE RegisterLoan
    @book_id INT,
    @user_id INT
AS
BEGIN
    INSERT INTO Loans (book_id, user_id, loan_date, return_date)
    VALUES (@book_id, @user_id, GETDATE(), NULL);
END;
GO

-- Registrar devolução
CREATE PROCEDURE RegisterReturn
    @loan_id INT
AS
BEGIN
    UPDATE Loans
    SET return_date = GETDATE()
    WHERE loan_id = @loan_id;
END;
GO

-- Registrar empréstimo com validação
CREATE PROCEDURE SafeRegisterLoan
    @book_id INT,
    @user_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Loans WHERE book_id = @book_id AND return_date IS NULL)
        PRINT 'Este livro já está emprestado!';
    ELSE
        INSERT INTO Loans (book_id, user_id, loan_date, return_date)
        VALUES (@book_id, @user_id, GETDATE(), NULL);
END;
GO
