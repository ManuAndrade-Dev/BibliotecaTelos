CREATE TABLE Books (
    book_id INT PRIMARY KEY IDENTITY(1,1),
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    published_year INT
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY IDENTITY(1,1),
    book_id INT,
    user_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
