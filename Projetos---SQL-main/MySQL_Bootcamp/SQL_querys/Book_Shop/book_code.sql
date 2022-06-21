-- SELECT 
   -- CONCAT
  --  (
    --    SUBSTRING(title, 1, 10), 
  --      '...'
  --  ) AS "Short title" 
-- FROM books;


SELECT 
	SUBSTRING
		(
			REPLACE(title, 'e', '3'), 
			1, 
			10
		) AS "combination"
FROM books;


SELECT REVERSE("Hello World");


SELECT REVERSE(author_fname) FROM books;


SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;


SELECT author_lname, CHAR_LENGTH(author_lname) AS "Length" FROM books;


SELECT 
	CONCAT
		(
			author_lname, 
			' is ', 
			CHAR_LENGTH(author_lname), 
			' characters long.'
		) AS 'Combination' 
FROM books;


SELECT UPPER('Hello world');


SELECT UPPER('Hello World');


SELECT LOWER('Hello World');


SELECT UPPER(title) FROM books;


SELECT CONCAT
	('MY FAVORITE BOOK IS THE ', UPPER(title)) AS "Someone is yelling" 
FROM books;


SELECT 
	REPLACE
	(
	CONCAT('I', ' ', 'like', ' ', 'cats'),
	' ',
	'_'
	);


SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));


SELECT REPLACE(title, ' ', '->') AS "Title" FROM books;


SELECT 
    author_lname AS 'Forwards', 
    REVERSE(author_lname) AS 'Backwards' 
FROM books;


SELECT 
    CONCAT
    (
    UPPER(author_fname), 
    ' ', 
    UPPER(author_lname)
    ) AS "Full name in caps" 
FROM books;


SELECT
    UPPER
    (
    CONCAT(author_fname, ' ', author_lname)
    ) AS "full name in caps"
FROM books;


SELECT 
    CONCAT
    (
    title, 
    ' was released in ', 
    released_year
    ) AS "information" 
FROM books;


SELECT 
    title AS "title", 
    CHAR_LENGTH(title) AS "character count" 
FROM books;


SELECT
    CONCAT(SUBSTRING(title, 1, 15), '...') AS "short title",
    CONCAT(author_lname, ', ', author_fname) AS "author",
    CONCAT(stock_quantity, ' in stock') AS "quantity"
FROM books;



