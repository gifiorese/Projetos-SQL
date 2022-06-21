SELECT title, released_year
FROM books
WHERE released_year != 2017;


SELECT title, author_lname
FROM books
WHERE author_lname != "Harris";


SELECT title 
FROM books 
WHERE title NOT LIKE "W%";


SELECT title, released_year FROM books
WHERE released_year > 2000
ORDER BY released_year;


SELECT title, released_year FROM books
WHERE released_year >= 2000
ORDER BY released_year;


SELECT title, stock_quantity, released_year FROM books
WHERE stock_quantity >= 100
ORDER BY stock_quantity;


SELECT 99 > 1;


SELECT title, released_year FROM books
WHERE released_year < 2000
ORDER BY released_year;


SELECT title, released_year FROM books
WHERE released_year <= 2000
ORDER BY released_year;


SELECT title, author_fname AS "First name", author_lname AS "Last name"
FROM books
WHERE author_lname="Eggers" AND released_year > 2010;


SELECT title, author_fname AS "First name", author_lname AS "Last name"
FROM books
WHERE author_lname="Eggers" AND 
released_year > 2010 AND
title LIKE '%novel%';


SELECT title, author_lname AS "Last name", released_year AS 'Released year'
FROM books
WHERE author_lname="Eggers" || released_year > 2010;


SELECT title, 
    author_lname AS "Last name", 
    released_year AS 'Released year',
    stock_quantity AS "In stock"
FROM books
WHERE author_lname="Eggers" || 
released_year > 2010 ||
stock_quantity > 100;


SELECT title AS "Title", released_year AS "Year"
FROM books
WHERE released_year >= 2004 &&
released_year <= 2015
ORDER BY released_year DESC;



SELECT title AS "Title", released_year AS "Year"
FROM books
WHERE released_year BETWEEN 2004 AND 2015
ORDER BY released_year DESC;


SELECT title AS "Title", released_year AS "Year"
FROM books
WHERE released_year NOT BETWEEN 2004 AND 2015
ORDER BY released_year DESC;


SELECT CAST('2022/02/17 12:12:30' AS DATETIME);


SELECT title, author_lname AS "Last name"
FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');


SELECT title, released_year AS "Year"
FROM books
WHERE released_year IN (2017, 1985);


SELECT title, released_year AS "Year"
FROM books
WHERE released_year NOT IN 
(2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016);


SELECT title, released_year AS "Year"
FROM books
WHERE released_year >= 2000
AND released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016);


SELECT title, released_year AS "Year"
FROM books
WHERE released_year >= 2000
AND released_year % 2 != 0;


SELECT title AS "Title", released_year AS "Released year",
    CASE
        WHEN released_year >= 2000 THEN 'Modern lit'
        ELSE '20th century lit'
    END AS "Genre"
FROM books;


SELECT title AS "Title", stock_quantity AS "Stock",
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50 THEN "*"
        WHEN stock_quantity BETWEEN 51 AND 100 THEN "**"
        WHEN stock_quantity BETWEEN 101 AND 150 THEN "***"
        WHEN stock_quantity >= 1000 then "*****"
        ELSE "****"
    END AS "Visual stock"
FROM books
ORDER BY stock_quantity DESC;


SELECT title AS "Title", stock_quantity AS "Stock",
    CASE
        WHEN stock_quantity <= 50 THEN "*"
        WHEN stock_quantity <= 100 THEN "**"
        WHEN stock_quantity <= 150 THEN "***"
        WHEN stock_quantity >= 1000 then "*****"
        ELSE "****"
    END AS "Visual stock"
FROM books
ORDER BY stock_quantity DESC;


SELECT 10 != 10;

SELECT 15 > 14 && 99 - 5 <= 94;

SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;


SELECT title AS "Title", released_year AS "Released year"
FROM books
WHERE released_year < 1980;


SELECT title AS "Title", author_lname AS "Last name"
FROM books
WHERE author_lname="Eggers" || author_lname="Chabon";


SELECT title AS "Title", author_lname AS "Last name"
FROM books
WHERE author_lname IN ("Eggers", "Chabon");


SELECT title AS "Title", 
    author_lname AS "Last name", 
    released_year AS "Released year"
FROM books
WHERE author_lname="Lahiri" && released_year >= 2000;


SELECT title AS "Title", pages AS "Number of pages"
FROM books
WHERE pages BETWEEN 100 AND 200;


SELECT title AS "Title", pages AS "Number of pages"
FROM books
WHERE pages >= 100 && pages <= 200;


SELECT title AS "Title", author_lname AS "Last name"
FROM books
WHERE author_lname LIKE "c%" || author_lname LIKE "s%";


SELECT title AS "Title", author_lname AS "Last name"
FROM books
WHERE SUBSTRING(author_lname, 1, 1)="c%" || SUBSTRING(author_lname, 1, 1)="s%";


SELECT title AS "Title", author_lname AS "Last name"
FROM books
WHERE SUBSTRING(author_lname, 1, 1) IN ("C", "S");


SELECT title AS "Title", author_lname AS "Last name",
    CASE
        WHEN title LIKE "%stories%" THEN "Short story"
        WHEN title LIKE "Just Kids" || 
            title LIKE "A Heartbreaking Work%" THEN "Memoir"
        ELSE "Novel"
    END AS "Genre"
FROM books;


SELECT title AS "Title", author_lname AS "Last name",
    CASE
        WHEN COUNT(title) <= 1 THEN (SELECT CONCAT(COUNT(title), ' book'))
        ELSE (SELECT CONCAT(COUNT(title), ' books'))
    END AS "Book count"
FROM books
GROUP BY author_lname, author_fname;






