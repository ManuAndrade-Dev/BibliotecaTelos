{\rtf1\ansi\ansicpg1252\cocoartf2867
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Livros emprestados atualmente\
SELECT Books.title, Users.name, Loans.loan_date\
FROM Loans\
JOIN Books ON Loans.book_id = Books.book_id\
JOIN Users ON Loans.user_id = Users.user_id\
WHERE Loans.return_date IS NULL;\
\
-- Livros devolvidos\
SELECT Books.title, Users.name, Loans.loan_date, Loans.return_date\
FROM Loans\
JOIN Books ON Loans.book_id = Books.book_id\
JOIN Users ON Loans.user_id = Users.user_id\
WHERE Loans.return_date IS NOT NULL;\
\
-- Usu\'e1rios com mais de 3 empr\'e9stimos\
SELECT Users.name\
FROM Users\
WHERE (SELECT COUNT(*) FROM Loans WHERE Loans.user_id = Users.user_id) > 3;\
\
-- Livros por g\'eanero\
SELECT * FROM Books WHERE genre = 'Fic\'e7\'e3o';\
}