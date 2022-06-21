CREATE TABLE cats
(
    cat_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	breed VARCHAR(100) DEFAULT 'not speciified',
	age INT NOT NULL,
	PRIMARY KEY (cat_id)
);


INSERT INTO cats(name, breed, age)
VALUES ("Ringo", "Tabby", 4),
	   ("Cindy", "Maine Coon", 10),
	   ("Dumbledore", "Maine Coon", 11),
	   ("Egg", "Persian", 4),
	   ("Misty", "Tabby", 13),
	   ("George Michael", "Ragdoll", 9),
	   ("Jackson", "Sphynx", 7);
	   

UPDATE cats SET age=12 WHERE breed='Maine Coon';


DELETE FROM cats WHERE name='Egg';