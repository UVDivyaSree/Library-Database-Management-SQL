-- KEYWORDS:
-- SELECT, WHERE, AND, OR, NOT, ORDER BY, INSERT INTO, ASC, DESC, NULL, NOT NULL, IF, CASE, UPDATE, DELETE, LIMIT, MIN, MAX, LIKE, COUNT, AVG, SUM,
-- IN, BETWEEN, AS, JOINs, UNION, INTERSECT, MINUS, GROUPBY, HAVING, +, -, *, /, %, &, |, ^, =, >, <, >=, <=, <>,+=, -=, &=, ^-= ,/*=, ALL, ANY, EXISTS, DISTINCT, 
-- CREATE, DROP, ALTER, UNIQUE, PK, FK, CHECK, DEFAULT

 
DROP database Library;

-- Create database
CREATE database Library;

-- use database
USE Library;

-- create tables
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(100) NOT NULL,
    author_id INT,
    published_year INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    user_id INT,
    book_id INT,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- describe tables
DESC authors;

DESC books;

DESC users;

DESC loans;

-- inserting values
INSERT INTO Authors (author_id, author_name) VALUES
(1, 'J.K. Rowling'),
(2, 'George Orwell'),
(3, 'Harper Lee'),
(4, 'Stephen King'),
(5, 'Agatha Christie'),
(6, 'J.R.R. Tolkien'),
(7, 'Charles Dickens'),
(8, 'Mark Twain'),
(9, 'Leo Tolstoy'),
(10, 'Ernest Hemingway'),
(11, 'Fyodor Dostoevsky'),
(12, 'Arthur Conan Doyle'),
(13, 'Jane Austen'),
(14, 'Ray Bradbury'),
(15, 'Aldous Huxley');


INSERT INTO Books (book_id, book_title, author_id, published_year) VALUES
(1, 'Harry Potter and the Philosopher''s Stone', 1, 1997),
(2, '1984', 2, 1949),
(3, 'To Kill a Mockingbird', 3, 1960),
(4, 'The Shining', 4, 1977),
(5, 'Murder on the Orient Express', 5, 1934),
(6, 'The Hobbit', 6, 1937),
(7, 'Great Expectations', 7, 1861),
(8, 'The Adventures of Tom Sawyer', 8, 1876),
(9, 'War and Peace', 9, 1869),
(10, 'The Old Man and the Sea', 10, 1952),
(11, 'Crime and Punishment', 11, 1866),
(12, 'The Hound of the Baskervilles', 12, 1902),
(13, 'Pride and Prejudice', 13, 1813),
(14, 'Fahrenheit 451', 14, 1953),
(15, 'Brave New World', 15, 1932);

INSERT INTO Users (user_id, user_name, email, phone_number) VALUES
(1, 'John Doe', 'john@example.com', '123-456-7890'),
(2, 'Jane Smith', 'jane@example.com', '987-654-3210'),
(3, 'Alice Johnson', 'alice@example.com', '555-123-4567'),
(4, 'Michael Brown', 'michael@example.com', '555-987-6543'),
(5, 'Emily Davis', 'emily@example.com', '555-555-5555'),
(6, 'Daniel Martinez', 'daniel@example.com', '555-111-2222'),
(7, 'Sarah Wilson', 'sarah@example.com', '555-333-4444'),
(8, 'Robert Anderson', 'robert@example.com', '555-666-7777'),
(9, 'Jennifer Taylor', 'jennifer@example.com', '555-888-9999'),
(10, 'Matthew Thomas', 'matthew@example.com', '555-000-1111'),
(11, 'Karen White', 'karen@example.com', '555-222-3333'),
(12, 'Christopher Hall', 'chris@example.com', '555-444-5555'),
(13, 'Jessica Evans', 'jessica@example.com', '555-777-8888'),
(14, 'Michael Smith', 'michael12@example.com', '555-999-1111'),
(15, 'Emily Johnson', 'emily12@example.com', '555-222-3333');

INSERT INTO Loans (loan_id, user_id, book_id, loan_date, return_date) VALUES
(1, 1, 1, '2024-01-01', NULL), -- John Doe borrows book 1
(2, 1, 2, '2024-01-02', '2024-03-10'), -- John Doe borrows book 2
(3, 1, 3, '2024-01-03', NULL), -- John Doe borrows book 3
(4, 2, 4, '2024-01-04',  '2024-03-15'), -- Jane Smith borrows book 4
(5, 2, 5, '2024-01-05', NULL), -- Jane Smith borrows book 5
(6, 2, 6, '2024-01-06', '2024-03-20'), -- Jane Smith borrows book 6
(7, 3, 7, '2024-01-07', NULL), -- Alice Johnson borrows book 7
(8, 3, 8, '2024-01-08', NULL), -- Alice Johnson borrows book 8
(9, 4, 9, '2024-01-09', NULL), -- Michael Brown borrows book 9
(10, 4, 10, '2024-01-10', NULL), -- Michael Brown borrows book 10
(11, 4, 11, '2024-01-11', NULL), -- Michael Brown borrows book 11
(12, 5, 12, '2024-01-12', NULL), -- Emily Davis borrows book 12
(13, 5, 13, '2024-01-13', NULL), -- Emily Davis borrows book 13
(14, 5, 14, '2024-01-14', NULL); -- Emily Davis borrows book 14



-- retrieve all the values
SELECT * FROM authors;

SELECT * FROM books;

SELECT * FROM users;

SELECT * FROM loans;

-- Select query with where, and, or, not, order by, limit
-- 1. List upto 5 book titles and it's publication year in descending order, written by author ID 1 where it was published either after 1990 or before 1950 
SELECT book_title, published_year FROM Books WHERE author_id = 1 AND (published_year > 1990 OR published_year < 1950) ORDER BY published_year DESC LIMIT 5;

-- Update query with if
-- 2. Update the published year of the books incrementing by 10 years, if the book was published before 2000
SELECT * FROM Books; -- to check the published year before updating
UPDATE Books SET published_year = IF(published_year < 2000, published_year + 10, published_year);
SELECT * FROM Books; -- to check the updated books table

-- Delete query with where, in
-- 3. Delete the Books written by author =' Harper Lee';
SELECT * FROM Books; -- to check the book details before deleting
DELETE FROM Books WHERE author_id IN (SELECT author_id FROM Authors WHERE author_name = 'Harper Lee');
SELECT * FROM Books; -- to check the book details after deleting

-- Aggregation queries with group by, having, sum, count
-- List authors who have written more than 1 book
SELECT author_name, COUNT(*) AS book_count FROM Authors JOIN Books ON Authors.author_id = Books.author_id GROUP BY author_name HAVING COUNT(*) > 1;

-- List user id whose loan count is more than three
SELECT user_id, COUNT(*) AS loan_count FROM Loans GROUP BY user_id HAVING COUNT(*) >= 3;

-- NULL and NOT NULL
-- List the loan details where return date is null
SELECT * FROM Loans WHERE return_date IS NULL;

-- List the loan details where loan date is not null
SELECT * FROM Loans WHERE loan_date IS NOT NULL;

-- List the user details where username is notnull
SELECT * FROM Users WHERE user_name IS NOT NULL;

-- List the book details where book title is notnull
SELECT * FROM Books WHERE book_title IS NOT NULL;

-- List the book details where author is notnull
SELECT * FROM Books WHERE NOT author_id IS NULL;

-- CASE
-- Update loan date by adding 7 days ahead if the return date is null else keep the loan date as it is
UPDATE Loans
SET loan_date = CASE
                    WHEN return_date IS NULL THEN DATE_ADD(loan_date, INTERVAL 7 DAY)
                    ELSE loan_date
                END;
SELECT * FROM Loans;

--  JOIN, ASC, DESC
-- list book name and it's author name ordered by descending order
SELECT Books.book_title, Authors.author_name FROM Books
JOIN Authors ON Books.author_id = Authors.author_id
ORDER BY Authors.author_name DESC;

-- list users ordered by the length of their email
SELECT user_name, email FROM Users ORDER BY LENGTH(email) ASC;

-- list book details
SELECT book_title, published_year FROM Books ORDER BY CASE WHEN published_year IS NULL THEN 1 ELSE 0 END, published_year DESC;


-- BETWEEN, INTERSECT, UNION
SELECT book_title, published_year FROM Books WHERE published_year BETWEEN 2000 AND 2010 
INTERSECT
SELECT book_title, published_year FROM Loans JOIN Books ON Loans.book_id = Books.book_id;

SELECT book_title, published_year FROM Books WHERE published_year < 2000
UNION
SELECT book_title, published_year FROM Books WHERE published_year > 2010;

-- update books published year to 2000 if the year of publication is before 2000
UPDATE Books
SET published_year = CASE
                        WHEN published_year < 2000 THEN 2000
                        ELSE published_year
                     END;
SELECT * FROM books;
                     

-- update books published year to 2022 if the year of publication is after 2022
UPDATE Books
SET published_year = CASE
                        WHEN published_year > 2022 THEN 2022
                        ELSE published_year
                     END;

-- list the book details which was published in between the years 2000 and 2010
SELECT * FROM Books WHERE published_year BETWEEN 2000 AND 2010;

-- generate the average published year of the books
SELECT AVG(published_year) AS average_published_year FROM Books;

-- list the latest book published year
SELECT MAX(published_year) AS latest_published_year FROM Books;

-- list the earliest book published year
SELECT MIN(published_year) AS earliest_published_year FROM Books;

SELECT Users.user_id, Users.user_name, COUNT(Loans.loan_id) AS total_loans FROM Users
LEFT JOIN Loans ON Users.user_id = Loans.user_id
GROUP BY Users.user_id, Users.user_name;


-- list the books where the book title incldes 'Harry' in it
SELECT * FROM Books WHERE book_title LIKE '%Harry%';
 
 -- list the distinct email id from the users
SELECT DISTINCT email FROM Users;

SELECT DISTINCT book_id, book_title
FROM Books
WHERE EXISTS (
    SELECT 1
    FROM Loans
    WHERE Loans.book_id = Books.book_id
);


SELECT DISTINCT user_id, user_name
FROM Users
WHERE user_id IN (
    SELECT DISTINCT user_id
    FROM Loans
);


SELECT author_id, author_name
FROM Authors
WHERE author_id IN (
    SELECT author_id
    FROM Books
    WHERE published_year < 2000
);

SELECT *
FROM Books
WHERE published_year > 2000 & author_id = (
    SELECT author_id
    FROM Authors
    WHERE author_name = 'J.K. Rowling'
);


SELECT * FROM Books WHERE published_year < 2000 | published_year > 2010;

-- list the books 
SELECT * FROM Books WHERE published_year < 2000 || published_year > 2010;
SELECT * FROM Books WHERE published_year < 2000 or published_year > 2010;

SELECT * FROM Books WHERE (published_year < 2000 ^ published_year > 2010);

-- list th books other than bookid = 1
SELECT * FROM Books WHERE book_id <> 1;

UPDATE Books SET published_year += 5;

UPDATE Books SET published_year -= 2;

UPDATE Books SET published_year = published_year * 2;
SELECT * FROM BOOKS;


SELECT COUNT(book_id) / COUNT(DISTINCT user_id) AS average_books_borrowed_per_user FROM Loans;


SELECT CONCAT(user_name, ' borrowed ', book_title) AS borrow_info 
FROM Users
JOIN Loans ON Users.user_id = Loans.user_id
JOIN Books ON Loans.book_id = Books.book_id;


SELECT Users.user_name FROM Users JOIN Loans ON Users.user_id &= Loans.user_id;


SELECT 'Books borrowed by users' AS "^-=" FROM Loans;


SELECT DISTINCT Users.user_name FROM Users
JOIN Loans ON Users.user_id = Loans.user_id
JOIN Books ON Loans.book_id = Books.book_id
WHERE Books.published_year < ANY (SELECT published_year FROM Books WHERE published_year < 2000);

-- alter the table books by adding column named 'genre' of varchar 50
ALTER TABLE Books ADD COLUMN genre VARCHAR(50);

-- list the distinct book title
SELECT DISTINCT book_title FROM Books;

-- Insert a value to users table
INSERT INTO Users (user_id, user_name, email, phone_number)
VALUES (3, 'Alice Johnson', DEFAULT, '555-123-4567');

