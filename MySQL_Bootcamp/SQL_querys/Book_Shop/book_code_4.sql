DECIMAL(5,2);


CREATE TABLE items(price DECIMAL(5,2));

INSERT INTO items(price)
VALUES(7), (7853264), (34.88), (298.999), (1.9999);



CREATE TABLE people (
    name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES("Jenny", "1995/10/13", "22:37:20", "1995/10/13 22:37:20"), 
      ("Ken", "1988/02/21", "11:27:54", "1988/02/21 11:27:54");
      
     
INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES("Keith", CURDATE(), CURTIME(), NOW());


SELECT CONCAT (
    MONTHNAME(birthdate), ' ', 
    DAY(birthdate), ', ', 
    YEAR(birthdate)
) AS "New form of date"
FROM people;


SELECT DATE_FORMAT('2009/10/04 22:23:00', '%W %M %Y');


SELECT name, DATE_FORMAT(birthdt, 'was born on a %W') FROM people;


SELECT DATE_FORMAT(birthdt, '%d/%m/%Y at %h:%i') FROM people;


SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;


SELECT DATE_ADD('2000/12/31 23:59:59', INTERVAL 1 SECOND);


SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) AS "new date" FROM people;


SELECT birthdt, birthdt + INTERVAL 1 MONTH AS "new date" FROM people;


SELECT birthdt, 
    birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR AS "new date" FROM people;


CREATE TABLE comments(
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);


CREATE TABLE comments2(
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);


INSERT INTO comments2(content)
VALUES("lol, what a funny article");

INSERT INTO comments2(content)
VALUES("this is fake news");

INSERT INTO comments2(content)
VALUES("I don't agree with this. Reporting this post");


UPDATE comments2 SET content='This is offensive' WHERE content='this is fake news';


CREATE TABLE inventory(
    item_name VARCHAR(100),
    price DECIMAL(8,2),
    quantity INT
);

SELECT CURTIME();


SELECT DATE_FORMAT(CURDATE(), "%c/%d/%Y");


CREATE TABLE tweets(
    tweet_content VARCHAR(140),
    username VARCHAR(60),
    created TIMESTAMP DEFAULT NOW()
);


INSERT INTO tweets(tweet_content, username)
VALUES("This is my first tweet", "@user1"),
      ("I'm reporting this", "@user9");
      
      
      
      
      
