CREATE TABLE students
(
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100),
    PRIMARY KEY (id)
);


CREATE TABLE papers
(
    title VARCHAR(500),
    grade INT,
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id)
);


DESC students;

DESC papers;


INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');


INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);


SELECT * FROM students;

SELECT * FROM papers;


SELECT first_name AS "First name", 
    title AS "Title of the essay", 
    grade AS "Grade"
FROM students
JOIN papers
    ON papers.student_id = students.id;


SELECT first_name AS "First name", 
    title AS "Title of the essay", 
    grade AS "Grade"
FROM students
LEFT JOIN papers
    ON papers.student_id = students.id;


SELECT first_name AS "First name", 
    IFNULL(title, "Missing") AS "Title of the essay", 
    IFNULL(grade, 0) AS "Grade"
FROM students
LEFT JOIN papers
    ON papers.student_id = students.id;


SELECT first_name AS "First name",
    IFNULL(AVG(grade), 0) AS "Average"
FROM students
LEFT JOIN papers
    ON papers.student_id = students.id
GROUP BY students.id
ORDER BY AVG(grade) DESC;


SELECT first_name AS "First name",
    IFNULL(AVG(grade), 0) AS "Average",
    CASE
        WHEN AVG(grade) >= 75 THEN "PASSING"
        ELSE "FAILED"
    END AS "Student status"
FROM students
LEFT JOIN papers
    ON papers.student_id = students.id
GROUP BY students.id
ORDER BY AVG(grade) DESC;



