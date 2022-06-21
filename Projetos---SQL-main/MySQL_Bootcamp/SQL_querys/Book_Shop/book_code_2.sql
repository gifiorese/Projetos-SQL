INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES("10% Happier", "Dan", "Harris", 2014, 29, 256),
          ("fake_book", "Freida", "Harris", 2001, 287, 428),
          ("Lincoln In The Bardo", "George", "Saunders", 2017, 1000, 367);


SELECT DISTINCT(author_lname) FROM books;


SELECT DISTINCT(released_year) FROM books;


SELECT author_fname, author_lname FROM books;


SELECT DISTINCT(author_lname) FROM books;


SELECT DISTINCT
    CONCAT(author_fname, ' ', author_lname) AS "Distinct full names" 
FROM books;


SELECT DISTINCT author_fname, author_lname FROM books;


SELECT author_lname FROM books ORDER BY author_lname;


SELECT title FROM books ORDER BY title;


SELECT author_lname FROM books ORDER BY author_lname DESC;


SELECT title, released_year, pages FROM books ORDER BY released_year;


SELECT title, pages FROM books ORDER BY released_year;


SELECT title, author_fname, author_lname FROM books ORDER BY 2;


SELECT author_fname, author_lname FROM books ORDER BY author_lname,author_fname;


SELECT title FROM books LIMIT 3;


SELECT title, released_year 
FROM books 
ORDER BY released_year DESC 
LIMIT 5;


SELECT title, released_year 
FROM books 
ORDER BY released_year DESC 
LIMIT 0,5;


SELECT author_fname 
FROM books 
WHERE author_fname LIKE '%da%';


SELECT title, stock_quantity 
FROM books 
WHERE stock_quantity LIKE '__';


SELECT title 
FROM books 
WHERE title LIKE '%\%%';


SELECT title 
FROM books 
WHERE title LIKE '%\_%';


SELECT title AS 'Title'
FROM books 
WHERE title LIKE '%stories%';


SELECT title AS 'Title', pages AS 'Page count' 
FROM books 
ORDER BY pages DESC 
LIMIT 1;


SELECT CONCAT(title, ' - ', released_year) AS 'summary'
FROM books
ORDER BY released_year DESC
LIMIT 3;


SELECT title AS 'title', author_lname AS 'last name'
FROM books
WHERE author_lname LIKE "% %";


SELECT title AS 'Title', released_year AS 'Released year', stock_quantity AS "In stock" 
FROM books 
ORDER BY stock_quantity 
LIMIT 3;


SELECT title AS 'title', author_lname AS 'last name'
FROM books
ORDER BY author_lname, title;


SELECT 
    UPPER
    (
    CONCAT("MY FAVORITE AUTHOR IS ", author_fname, ' ', author_lname, '!')
    ) AS "Yell"
FROM books
ORDER BY author_lname;