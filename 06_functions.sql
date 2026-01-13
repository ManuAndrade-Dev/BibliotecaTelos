CREATE FUNCTION TotalLoans (@user_id INT)
RETURNS INT
AS
BEGIN
    RETURN (SELECT COUNT(*) FROM Loans WHERE user_id = @user_id);
END;

-- Teste
SELECT dbo.TotalLoans(1);
