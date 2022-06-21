CREATE TABLE users
(
    email VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY(email)
);


INSERT INTO users(email)
VALUES('Katie43@yahoo.com'), ('Tunde@gmail.com');


-- CODE - EXERCISES
SELECT 
    DATE_FORMAT(MIN(created_at), '%M %D %Y') AS "Earliest Date" 
FROM users;

SELECT email AS "First User", created_at AS "Date "
FROM users WHERE created_at = (SELECT MIN(created_at) FROM users);


SELECT
    DATE_FORMAT(created_at, '%M') AS Months,
    COUNT(*) AS "Count"
FROM users
GROUP BY Months
ORDER BY COUNT(*) DESC;


SELECT COUNT(*) AS "Number of users"
FROM users WHERE email LIKE '%@yahoo.com%';


SELECT
    CASE
        WHEN email LIKE "%@gmail.com%" THEN "Gmail"
        WHEN email LIKE "%@yahoo.com%" THEN "Yahoo"
        WHEN email LIKE "%@hotmail.com%" THEN "Hotmail"
        ELSE 'Other'
    END AS Provider,
    COUNT(*)
FROM users
GROUP BY Provider
ORDER BY COUNT(*) DESC;