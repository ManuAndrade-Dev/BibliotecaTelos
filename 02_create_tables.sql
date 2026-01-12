{\rtf1\ansi\ansicpg1252\cocoartf2867
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 CREATE TABLE Books (\
    book_id INT PRIMARY KEY IDENTITY(1,1),\
    title VARCHAR(100),\
    author VARCHAR(100),\
    genre VARCHAR(50),\
    published_year INT\
);\
\
CREATE TABLE Users (\
    user_id INT PRIMARY KEY IDENTITY(1,1),\
    name VARCHAR(100),\
    email VARCHAR(100)\
);\
\
CREATE TABLE Loans (\
    loan_id INT PRIMARY KEY IDENTITY(1,1),\
    book_id INT,\
    user_id INT,\
    loan_date DATE,\
    return_date DATE,\
    FOREIGN KEY (book_id) REFERENCES Books(book_id),\
    FOREIGN KEY (user_id) REFERENCES Users(user_id)\
);\
}