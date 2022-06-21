CREATE DATABASE shirts_db;


USE shirts_db;


CREATE TABLE shirts
(
    shirt_id INT NOT NULL AUTO_INCREMENT,
    article VARCHAR(20) DEFAULT 'not specified',
    color VARCHAR(20) DEFAULT 'not specified',
    shirt_size VARCHAR(4) DEFAULT 'NS',
    last_worn INT,
    PRIMARY KEY(shirt_id)
);


INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ("T-shirt", "White", "S", 10),
       ("T-shirt", "Green", "S", 200),
       ("Polo shirt", "Black", "M", 10),
       ("Tank top", "Blue", "S", 50),
       ("T-shirt", "Pink", "S", 0),
       ("Polo shirt", "Red", "M", 5),
       ("Tank top", "White", "S", 200),
       ("Tank top", "Blue", "M", 15);
  
  
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ("Polo shirt", "Purple", "M", 50);


SELECT article, color FROM shirts;


SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size='M';


UPDATE shirts SET shirt_size='L' WHERE article='Polo shirt';


UPDATE shirts SET last_worn=0 WHERE last_worn=15;







