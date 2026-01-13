-- Verificar se livro já está emprestado
SELECT COUNT(*) AS emprestado
FROM Loans
WHERE book_id = 2 AND return_date IS NULL;

-- Verificar se usuário existe
SELECT * FROM Users WHERE user_id = 1;

-- Verificar se livro existe
SELECT * FROM Books WHERE book_id = 2;
