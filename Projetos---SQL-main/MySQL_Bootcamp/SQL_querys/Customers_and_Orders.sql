CREATE DATABASE section_12;

USE section_12;

CREATE TABLE customers(
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    PRIMARY KEY(id)
);


INSERT INTO customers(first_name, last_name, email)
VALUES("Boy", "George", "BG@email.com"),
      ("George", "Michael", "GM@email.com"),
      ("David", "Bowie", "DB@email.com"),
      ("Blue", "Steele", "BS@email.com"),
      ("Bette", "Davis", "BD@email.com");
      
      
CREATE TABLE orders(
    id INT NOT NULL AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    PRIMARY KEY(id),
    customer_id INT,
    FOREIGN KEY(customer_id) 
        REFERENCES customers(id)
    -- ON DELETE CASCADE
);


INSERT INTO orders(order_date, amount, customer_id)
VALUES("2016/02/10", 99.99, 1),
      ("2017/11/11", 35.50, 1),
      ("2014/12/12", 800.67, 2),
      ("2015/01/03", 12.50, 2),
      ("1999/04/11", 450.25, 5);


INSERT INTO orders(order_date, amount, customer_id)
VALUES("2016/06/06", 33.67, 98);


SELECT * FROM customers WHERE last_name="George";

SELECT * FROM orders WHERE customer_id=1;


SELECT * FROM orders WHERE customer_id=
    (
        SELECT id FROM customers
        WHERE last_name="George"
    );


SELECT * FROM customers, orders;


SELECT * FROM customers, orders 
WHERE customers.id = orders.customer_id;


SELECT first_name, last_name, order_date, amount 
FROM customers, orders 
WHERE customers.id = orders.customer_id;


SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id;


SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id
ORDER BY orders.amount DESC;


SELECT first_name, 
    last_name, 
    order_date, 
    SUM(amount) AS total_spent 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent DESC;


SELECT * 
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;


SELECT first_name, 
    last_name, 
    SUM(amount) AS total_spent 
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id;


SELECT first_name, 
    last_name, 
    IFNULL(SUM(amount), 0) AS total_spent 
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;


SELECT * 
FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id;