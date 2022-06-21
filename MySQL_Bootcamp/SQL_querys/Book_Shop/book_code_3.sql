SELECT COUNT(*) FROM books;


SELECT COUNT(author_fname) FROM books;


SELECT COUNT(DISTINCT author_fname) FROM books;


SELECT COUNT(DISTINCT author_lname) FROM books;


SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;


SELECT COUNT(title) AS "titles with 'the'"
FROM books
WHERE title LIKE "%the%";


SELECT author_fname, author_lname, COUNT(*)
FROM books
GROUP BY author_lname;


SELECT author_fname, author_lname, COUNT(*)
FROM books
GROUP BY author_lname, author_fname;


SELECT released_year, COUNT(*)
FROM books
GROUP BY released_year;


SELECT CONCAT(released_year, ' has ', COUNT(*), ' book(s).') AS 'Counting books'
FROM books
GROUP BY released_year;


SELECT MIN(released_year)
FROM books;


SELECT MIN(pages)
FROM books;


SELECT MAX(pages)
FROM books;


SELECT title, pages FROM books
WHERE pages = (SELECT MIN(pages) FROM books);


SELECT title, pages
FROM books
ORDER BY pages ASC
LIMIT 1;


SELECT author_fname AS "first name", 
       author_lname AS "last name", 
       MIN(released_year)
FROM books
GROUP BY author_lname, author_fname;


SELECT author_fname AS "first name", 
       author_lname AS "last name",
       MAX(pages) AS "longest page count"
FROM books
GROUP BY author_lname, author_fname;


SELECT 
    CONCAT(author_fname, ' ', author_lname) AS "Author",
    MAX(pages) AS "Longest book"
FROM books
GROUP BY author_lname, author_fname;


SELECT author_fname AS "First name", 
       author_lname AS "Last name", 
       AVG(released_year) AS "Average"
FROM books
GROUP BY author_lname, author_fname;


SELECT CONCAT(author_fname, ' ', author_lname) AS "Full name", 
       pages AS "Number of pages"
FROM books
WHERE pages = (SELECT MAX(pages) FROM books);


SELECT CONCAT(author_fname, ' ', author_lname) AS "Full name",
       pages AS "Number of pages"
FROM books
GROUP BY author_lname, author_fname
ORDER BY pages DESC
LIMIT 1;


SELECT released_year AS "Year", 
       COUNT(title) AS "Number of books", 
       AVG(pages) AS "Average pages"
FROM books
GROUP BY released_year;


SELECT COUNT(*) AS "Number of books" FROM books;