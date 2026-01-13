-- Livros emprestados atualmente
SELECT Books.title, Users.name, Loans.loan_date
FROM Loans
JOIN Books ON Loans.book_id = Books.book_id
JOIN Users ON Loans.user_id = Users.user_id
WHERE Loans.return_date IS NULL;

-- Livros devolvidos
SELECT Books.title, Users.name, Loans.loan_date, Loans.return_date
FROM Loans
JOIN Books ON Loans.book_id = Books.book_id
JOIN Users ON Loans.user_id = Users.user_id
WHERE Loans.return_date IS NOT NULL;

-- Usuários com mais de 3 empréstimos
SELECT Users.name
FROM Users
WHERE (SELECT COUNT(*) FROM Loans WHERE Loans.user_id = Users.user_id) > 3;

-- Livros por gênero
SELECT * FROM Books WHERE genre = 'Ficção';
