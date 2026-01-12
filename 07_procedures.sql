{\rtf1\ansi\ansicpg1252\cocoartf2867
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Registrar empr\'e9stimo\
CREATE PROCEDURE RegisterLoan\
    @book_id INT,\
    @user_id INT\
AS\
BEGIN\
    INSERT INTO Loans (book_id, user_id, loan_date, return_date)\
    VALUES (@book_id, @user_id, GETDATE(), NULL);\
END;\
GO\
\
-- Registrar devolu\'e7\'e3o\
CREATE PROCEDURE RegisterReturn\
    @loan_id INT\
AS\
BEGIN\
    UPDATE Loans\
    SET return_date = GETDATE()\
    WHERE loan_id = @loan_id;\
END;\
GO\
\
-- Registrar empr\'e9stimo com valida\'e7\'e3o\
CREATE PROCEDURE SafeRegisterLoan\
    @book_id INT,\
    @user_id INT\
AS\
BEGIN\
    IF EXISTS (SELECT 1 FROM Loans WHERE book_id = @book_id AND return_date IS NULL)\
        PRINT 'Este livro j\'e1 est\'e1 emprestado!';\
    ELSE\
        INSERT INTO Loans (book_id, user_id, loan_date, return_date)\
        VALUES (@book_id, @user_id, GETDATE(), NULL);\
END;\
GO\
}