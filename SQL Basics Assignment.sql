-- SQL Basics Assignment

-- 1. Create a table called employees with the following structure?

-- emp_id (integer, should not be NULL and should be a primary key)

-- emp_name (text, should not be NULL)

-- age (integer, should have a check constraint to ensure the age is at least 18)

-- email (text, should be unique for each employee)

-- salary (decimal, with a default value of 30,000).

-- Write the SQL query to create the above table with all constraints.

-- Answer:
Create database pw; 
use pw;
Create table employees 
(emp_id char(10),
 emp_name Varchar(30), 
 age int(2), 
 email text(20), 
 salary decimal(2));
 
 describe employees;
 
 -- 2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide examples of common types of constraints.
 
 -- Answer: Constraints in a database are rules that enforce data accuracy, consistency, and reliability by preventing invalid data from being entered or modified.
-- Purpose of Constraints
-- 1.Enforce Accuracy and Consistency:
-- Constraints define the rules for what data is permissible, ensuring that only valid and consistent information is stored.

-- 2.Maintain Data Reliability:
-- By preventing errors and inconsistencies, constraints build trust in the data's quality, making it a dependable resource for reporting and decision-making.

-- 3.Prevent Invalid Data:
-- Constraints act as gatekeepers, rejecting data that violates the defined rules during data entry, updates, or deletions.

-- 4.Establish Relationships:
-- Constraints, particularly Foreign Keys, define and maintain valid links between different tables, preventing "orphaned" records.

-- 5.Automate Validation:
-- Instead of relying on manual checks, constraints automatically enforce business logic and standards at the database level.

-- Examples of Common Constraint Types

-- 1.PRIMARY KEY Constraint: Ensures that each row in a table has a unique identifier and cannot have a NULL value.
-- (A). Example: In an Employees table, the EmployeeID column would be a primary key, guaranteeing that each employee has a distinct ID and no employee record is missing an ID.

-- 2.FOREIGN KEY Constraint: Establishes a link between two tables by referencing the Primary Key of another table.
-- (A). Example: In an Orders table, a CustomerID column could be a foreign key, ensuring that every order is linked to a valid, existing customer in the Customers table.

-- 3.NOT NULL Constraint: Prevents a column from containing NULL (empty) values.
-- (A). Example: A PhoneNumber column could be defined as NOT NULL, ensuring that every customer record has a phone number recorded.

-- 4.CHECK Constraint: Restricts the values that can be entered into a column by checking if a condition is met.
-- (A). Example: An Age column in an Applicants table could have a CHECK constraint to ensure that the value entered is greater than 18, preventing the entry of unrealistic ages.

-- 5.DEFAULT constraint:
-- This constraint sets a default value for a column if no value is explicitly provided during data insertion. It helps simplify data entry and ensures consistency by automatically populating a column with a predefined value. A DEFAULT constraint on an EntryDate column in a Product table could automatically set the value to the current date.

-- 3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.

-- Answer:  You would apply a NOT NULL constraint to ensure a column always contains a value, preventing it from being left empty or null, thus enforcing data integrity and requiring a value to be present for every record in that column. A primary key column cannot contain NULL values because a primary key's fundamental role is to uniquely identify each row, and a NULL value would fail to provide a valid and unique identifier.
-- Why apply the NOT NULL constraint?
-- 1.Data Integrity:
-- The primary reason to use NOT NULL is to ensure that essential data is always present in a column.
-- 2.Enforce Data Quality:
-- It guarantees that a field always has a value, preventing records from being inserted or updated with missing information.
-- 3.Mandatory Fields:
-- You can use NOT NULL to make certain fields mandatory for users to provide, like a user's email address.
-- 4.Query Performance:
-- In some cases, a NOT NULL constraint can improve query performance, especially when used with foreign keys, as it guarantees that a value will always be present to join with the parent table.

-- Can a primary key contain NULL values?
-- 1. No .
-- 2. Justification:
-- The definition of a primary key requires it to uniquely identify each record in a table. If a primary key column were allowed to contain a NULL value, that row would lack a valid and unique identifier, which is the fundamental purpose of a primary key. By definition, a primary key must be non-nullable.

-- 4.Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.
-- Answer: Adding and removing constraints on an existing SQL table are performed using the ALTER TABLE statement.
-- Adding a Constraint
-- Steps:
-- 1.Identify the table and the column(s) on which the constraint will be applied.
-- 2.Determine the type of constraint (e.g., PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, NOT NULL).
-- 3.Use the ALTER TABLE ADD CONSTRAINT command, specifying the constraint name and its definition.
-- SQL Command Example (Adding a UNIQUE constraint):
ALTER TABLE Employees
ADD CONSTRAINT UC_Email UNIQUE (Email);
-- Removing a Constraint
-- Steps:
-- 1.Identify the table from which the constraint will be removed.
-- 2.Determine the name of the constraint to be dropped.
-- 3.Use the ALTER TABLE DROP CONSTRAINT command.
-- SQL Command Example (Removing a UNIQUE constraint):
ALTER TABLE Employees
DROP CONSTRAINT UC_Email;

-- 5.Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.Provide an example of an error message that might occur when violating a constraint.

-- Answer: Attempting to insert, update, or delete data in a way that violates database constraints results in the database management system (DBMS) rejecting the operation and raising an error. This mechanism is crucial for maintaining data integrity and consistency within the database. The specific consequences depend on the type of constraint violated:
-- 1.Primary Key Constraint Violation:
-- If an insert or update operation attempts to create a row with a primary key value that already exists in the table, the operation will be rejected. This ensures that each row in a table can be uniquely identified.
-- 2.Unique Constraint Violation:
-- Similar to primary key constraints, if an insert or update operation attempts to introduce a duplicate value into a column or set of columns defined with a unique constraint, the operation will be rejected.
-- 3.Foreign Key (Referential Integrity) Constraint Violation:
-- (A). Insertion/Update:
-- If an insert or update operation attempts to add a row with a foreign key value that does not have a corresponding primary key in the referenced (parent) table, the operation will be rejected. This prevents "orphan" records.
-- (B). Deletion/Update on Parent Table:
-- If an attempt is made to delete a row from the parent table or update its primary key value, and there are dependent rows in a child table referencing that primary key, the operation will be rejected unless specific referential actions (like CASCADE or SET NULL) are defined.
-- 4.Check Constraint Violation:
-- If an insert or update operation attempts to store data that does not satisfy the conditions specified in a CHECK constraint, the operation will be rejected. This enforces domain integrity.
-- 5.Not Null Constraint Violation:
-- If an insert or update operation attempts to set a NULL value in a column defined with a NOT NULL constraint, the operation will be rejected.

-- Example of an Error Message (PostgreSQL):
-- ERROR: duplicate key value violates unique constraint "users_pkey"
-- DETAIL: Key (id)=(1) already exists.

-- 6.You created a products table without constraints as follows:
-- CREATE TABLE products (
-- product_id INT,
-- product_name VARCHAR(50),
-- price DECIMAL(10, 2));
-- Now, you realise that?
-- 1.The product_id should be a primary key
-- 2.The price should have a default value of 50.00.

-- Answer: -- Make product_id a PRIMARY KEY ALTER TABLE products ADD CONSTRAINT pk_product PRIMARY KEY (product_id);

-- Set a default value for price ALTER TABLE products ALTER COLUMN price SET DEFAULT 50.00;
-- Explanation:
-- ADD CONSTRAINT pk_product PRIMARY KEY (product_id)
-- (A). Adds a primary key on product_id.
-- (B). Ensures each product has a unique, non-null ID.
-- ALTER COLUMN price SET DEFAULT 50.00
-- (A). If you insert a new row without specifying price, it will automatically be 50.00.
-- SQL Code:
INSERT INTO products (product_id, product_name)
VALUES (1, 'Pen');
-- price will default to 50.00

-- 7.You have two tables:
-- . Students (table from question)
-- . Classes (table from question)
-- Write a query to fetch the student_name and class_name for each student using an INNER JOIN.

-- Answer: 
SELECT s.student_name, c.class_name
FROM students s
INNER JOIN classes c
ON 
s.class_id = c.class_id;
-- Explanation:
-- INNER JOIN → Fetches only those rows where class_id in students matches class_id in classes.
-- s.student_name, c.class_name → Selects the student’s name and their class name.

-- 8.Consider the following three tables:
-- . Orders (table from question)
-- . Customers (table from question)
-- . Products (table from question)
-- Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are listed even if they are not associated with an order
-- Hint: (use INNER JOIN and LEFT JOIN)

-- Answer: 
SELECT o.order_id, c.customer_name, p.product_name
FROM products p
INNER JOIN orders o ON p.product_id = o.product_id
LEFT JOIN customers c ON o.customer_id = c.customer_id;
-- Explanation:
-- 1.Start with products p → ensures all products appear in the result.
-- 2.INNER JOIN orders → shows orders if they exist, but keeps the product even if not ordered.
-- 3.LEFT JOIN customers → pulls in customer name for those orders (null if no customer/order).

-- 9.Given the following tables:
-- Sales (table from Question)
-- Products (table from Question)
-- Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.

-- Answer: 
SELECT 
p.product_name, SUM(s.amount) AS total_sales
FROM sales s 
INNER JOIN products p
ON s.product_id = p.product_id
GROUP BY p.product_name;

describe products;

-- 10.You are given three tables:
-- Orders (table from question)
-- Customers (table from question)
-- Order_Details (table from question)
-- Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables.

-- Answer: 
SELECT
o.order_id,
c.customer_name,
od.quantity
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN order_details od
ON o.order_id = od.order_id;

## SQL Commands

-- 1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences.

-- Answer: Primary Keys in Maven Movies DB
 -- A Primary Key (PK) uniquely identifies each record in a table.
-- Examples in Maven Movies DB:
-- 1.actor → actor_id (PK)
-- 2.film → film_id (PK)
-- 3.category → category_id (PK)
-- 4.language → language_id (PK)
-- 5.customer → customer_id (PK)
-- 6.rental → rental_id (PK)
-- 7.payment → payment_id (PK)
-- 8.store → store_id (PK)
-- 9.staff → staff_id (PK)
-- 10.inventory → inventory_id (PK)

-- Foreign Keys in Maven Movies DB
-- A Foreign Key (FK) is a column (or set of columns) in one table that refers to the Primary Key in another table, creating a relationship.
-- Examples:
-- 1.film → language_id
-- 2.film_actor → film_id (FK → film.film_id), actor_id (FK → actor.actor_id)
-- 3.film_category → film_id (FK → film.film_id), category_id (FK → category.category_id)
-- 3.inventory → film_id (FK → film.film_id), store_id (FK → store.store_id)
-- 4.rental → inventory_id (FK → inventory.inventory_id), customer_id (FK → customer.customer_id), staff_id (FK → staff.staff_id)
-- 5.payment → rental_id (FK → rental.rental_id), customer_id (FK → customer.customer_id), staff_id (FK → staff.staff_id)
-- 6.customer → store_id (FK → store.store_id), address_id (FK → address.address_id)
-- 7.staff → store_id (FK → store.store_id), address_id (FK → address.address_id)

-- Differences:
-- 1.Uniqueness
-- PK uniquely identifies each row in its own table.FK identifies a row in another table.
-- 2.NULL values
-- PK cannot be NULL.FK can be NULL (if relationship is optional).
-- 3.Duplicates
-- PK has no duplicates allowed.FK has Duplicates allowed (many rows can reference the same parent).
-- 4.Table Role
-- PK Defines the entity (e.g., customer_id defines a customer).FK defines a relationship (e.g., customer_id in rental links to a customer).
-- 5.Example in Maven Movies
-- PK is customer.customer_id. FK is rental.customer_id.

-- 2. List all details of actors.
-- Answer: 
Create database sakila;
use sakila;
SELECT CONCAT(first_name, ' ', last_name) AS actor_full_name
FROM actor
limit 10;

-- 3.List all customer information from DB.
-- Answer: 
SELECT * FROM customer;

-- 4.List different countries.
-- Answer:
SELECT country 
FROM country;

-- 5 -Display all active customers.
-- Answer: 
SELECT * FROM customer
WHERE active = 1;

-- 6 -List of all rental IDs for customer with ID 1.
-- Answer: 
SELECT rental_id
FROM rental
WHERE customer_id = 1;

-- 7 - Display all the films whose rental duration is greater than 5 .
-- Answer:
SELECT film_id, title, rental_duration
FROM film
WHERE rental_duration > 5;

-- 8 - List the total number of films whose replacement cost is greater than $15 and less than $20.
-- Answer: 
SELECT COUNT(*) AS total_films
FROM film
WHERE replacement_cost > 15 
  AND replacement_cost < 20;
  
-- 9 - Display the count of unique first names of actors.
-- Answer:
SELECT COUNT(DISTINCT first_name) AS unique_first_names
FROM actor;

-- 10- Display the first 10 records from the customer table .
-- Answer:
SELECT * FROM customer
LIMIT 10;

-- 11 - Display the first 3 records from the customer table whose first name starts with ‘b’.
-- Answer:
SELECT * FROM customer
WHERE first_name LIKE 'B%'
LIMIT 3;

-- 12.Display the names of the first 5 movies which are rated as ‘G’.
-- Answer:
SELECT title
FROM film
WHERE rating = 'G'
LIMIT 5;

-- 13.Find all customers whose first name starts with "a".
-- Answer: 
SELECT * FROM customer
WHERE first_name LIKE 'A%';

-- 14- Find all customers whose first name ends with "a".
-- Answer:
SELECT * FROM customer
WHERE first_name LIKE '%a';

-- 15.Display the list of first 4 cities which start and end with ‘a’.
-- Answer:
SELECT city
FROM city
WHERE city LIKE 'A%a'
LIMIT 4;

-- 16- Find all customers whose first name have "NI" in any position.
-- Answer:
SELECT * FROM customer
WHERE first_name LIKE '%NI%';

-- 17- Find all customers whose first name have "r" in the second position .
-- Answer:
SELECT * FROM customer
WHERE first_name LIKE '_r%';

-- 18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.
-- Answer:
SELECT * FROM customer
WHERE first_name LIKE 'A%'
  AND LENGTH(first_name) >= 5;
  
-- 19- Find all customers whose first name starts with "a" and ends with "o".
-- Answer:
SELECT * FROM customer
WHERE first_name LIKE 'A%o';

-- 20 - Get the films with pg and pg-13 rating using IN operator.
-- Answer:
SELECT title, rating
FROM film
WHERE rating IN ('PG', 'PG-13');

-- 21 - Get the films with length between 50 to 100 using between operator.
-- Answer:
SELECT title, length
FROM film
WHERE length BETWEEN 50 AND 100;

-- 22 - Get the top 50 actors using limit operator.
-- Answer:
SELECT * FROM actor
LIMIT 50;

-- 23 - Get the distinct film ids from inventory table.
-- Answer:
SELECT DISTINCT film_id
FROM inventory;

## Functions
## Basic Aggregate Functions:

-- Question 1: Retrieve the total number of rentals made in the Sakila database.
-- Hint: Use the COUNT() function.
-- Answer:
SELECT COUNT(*) AS total_rentals
FROM rental;

-- Question 2: Find the average rental duration (in days) of movies rented from the Sakila database.
-- Hint: Utilize the AVG() function.
-- Answer:
SELECT AVG(rental_duration) AS average_rental_duration
FROM film;

## String Functions:
-- Question 3: Display the first name and last name of customers in uppercase.
-- Hint: Use the UPPER () function.
-- Answer:
SELECT UPPER(first_name) AS first_name_upper,
       UPPER(last_name) AS last_name_upper
FROM customer;

-- Question 4: Extract the month from the rental date and display it alongside the rental ID.
-- Hint: Employ the MONTH() function.
-- Answer:
SELECT rental_id, MONTH(rental_date) AS rental_month
FROM rental;

## GROUP BY:
-- Question 5: Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
-- Hint: Use COUNT () in conjunction with GROUP BY.
-- Answer:
SELECT customer_id, COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id;

-- Question 6: Find the total revenue generated by each store.
-- Hint: Combine SUM() and GROUP BY.
-- Answer:
Create database sakila;
use sakila;
SELECT store_id, SUM(amount) AS total_revenue
FROM payment
GROUP BY store_id;

-- Question 7: Determine the total number of rentals for each category of movies.
-- Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.
-- Answer:
SELECT c.name AS category_name, COUNT(r.rental_id) AS total_rentals
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY total_rentals DESC;

-- Question 8: Find the average rental rate of movies in each language.
-- Hint: JOIN film and language tables, then use AVG () and GROUP BY.
-- Answer:
SELECT l.name AS language_name, AVG(f.rental_rate) AS avg_rental_rate
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.name
ORDER BY avg_rental_rate DESC;

## Joins
-- Questions 9 - Display the title of the movie, customer s first name, and last name who rented it.
-- Hint: Use JOIN between the film, inventory, rental, and customer tables.
-- Answer:
SELECT f.title AS movie_title, c.first_name, c.last_name
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
ORDER BY f.title, c.first_name;

-- Question 10: Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
-- Hint: Use JOIN between the film actor, film, and actor tables.
-- Answer:
SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Gone with the Wind';

-- Question 11: Retrieve the customer names along with the total amount they've spent on rentals.
-- Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
-- Answer:
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_amount_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
JOIN rental r ON p.rental_id = r.rental_id
GROUP BY c.first_name, c.last_name
ORDER BY total_amount_spent DESC;

-- Question 12: List the titles of movies rented by each customer in a particular city (e.g., 'London').
-- Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.
-- Answer:
SELECT c.first_name, c.last_name, f.title AS movie_title
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
ORDER BY c.last_name, c.first_name, f.title;

## Advanced Joins and GROUP BY:
-- Question 13: Display the top 5 rented movies along with the number of times they've been rented.
-- Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.
-- Answer:
SELECT f.title AS movie_title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;

-- Question 14: Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
-- Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.
-- Answer:
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT i.store_id) = 2;

## Windows Function:
-- 1. Rank the customers based on the total amount they've spent on rentals.
-- Answer:
SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_amount_spent, RANK() OVER (ORDER BY SUM(p.amount) DESC) AS rank_position
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY rank_position;

-- 2. Calculate the cumulative revenue generated by each film over time.
-- Answer:
SELECT f.title AS film_title, r.rental_date, SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY r.rental_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
ORDER BY f.title, r.rental_date;

-- 3. Determine the average rental duration for each film, considering films with similar lengths.
-- Answer:
SELECT f.title, f.length, f.rental_duration, AVG(f.rental_duration) OVER (PARTITION BY f.length) AS avg_rental_duration_for_length
FROM film f
ORDER BY f.length, f.title;

-- 4. Identify the top 3 films in each category based on their rental counts.
-- Answer:
SELECT category_name, film_title, rental_count, film_rank
FROM (SELECT c.name AS category_name, f.title AS film_title, COUNT(r.rental_id) AS rental_count, RANK() OVER (PARTITION BY c.category_id ORDER BY COUNT(r.rental_id) DESC) AS film_rank
    FROM category c
    JOIN film_category fc ON c.category_id = fc.category_id
    JOIN film f ON fc.film_id = f.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.category_id, c.name, f.film_id, f.title
) ranked
WHERE film_rank <= 3
ORDER BY category_name, film_rank, rental_count DESC;

-- 5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
-- Answer:
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals, AVG(COUNT(r.rental_id)) OVER () AS avg_rentals_all_customers, COUNT(r.rental_id) - AVG(COUNT(r.rental_id)) OVER () AS rental_difference
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY rental_difference DESC;

-- 6. Find the monthly revenue trend for the entire rental store over time.
-- Answer:
SELECT YEAR(p.payment_date) AS year, MONTH(p.payment_date) AS month, SUM(p.amount) AS monthly_revenue
FROM payment p
GROUP BY YEAR(p.payment_date), MONTH(p.payment_date)
ORDER BY year, month;

-- 7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.
-- Answer:
WITH customer_spending AS (
     SELECT c.customer_id,
            c.first_name,
            c.last_name, 
            SUM(p.amount) AS total_spent
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
),
ranked AS (
    SELECT customer_id,
           first_name,
           last_name,
           total_spent,
           PERCENT_RANK() OVER (ORDER BY total_spent DESC) AS spending_percentile
    FROM customer_spending
)
SELECT customer_id,
       first_name,
       last_name,
       total_spent
FROM ranked
WHERE spending_percentile <= 0.20
ORDER BY total_spent DESC;

-- 8. Calculate the running total of rentals per category, ordered by rental count.
-- Answer:
WITH category_rentals AS (
    SELECT c.name AS category_name,
           COUNT(r.rental_id) AS rental_count
    FROM category c
    JOIN film_category fc ON c.category_id = fc.category_id
    JOIN film f ON fc.film_id = f.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.name
)
SELECT category_name,
       rental_count,
       SUM(rental_count) OVER (ORDER BY rental_count DESC) AS running_total_rentals
FROM category_rentals
ORDER BY rental_count DESC;

-- 9. Find the films that have been rented less than the average rental count for their respective categories.
-- Answer:
WITH film_rentals AS (
    SELECT f.film_id,
           f.title,
           c.name AS category_name,
           COUNT(r.rental_id) AS rental_count
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY f.film_id, f.title, c.name
),
category_avg AS (
    SELECT category_name,
           AVG(rental_count) AS avg_rentals
    FROM film_rentals
    GROUP BY category_name
)
SELECT fr.title,
       fr.category_name,
       fr.rental_count,
       ca.avg_rentals
FROM film_rentals fr
JOIN category_avg ca ON fr.category_name = ca.category_name
WHERE fr.rental_count < ca.avg_rentals
ORDER BY fr.category_name, fr.rental_count ASC;

-- 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.
-- Answer:
SELECT 
    YEAR(p.payment_date) AS year,
    MONTH(p.payment_date) AS month,
    SUM(p.amount) AS monthly_revenue
FROM payment p
GROUP BY YEAR(p.payment_date), MONTH(p.payment_date)
ORDER BY monthly_revenue DESC
LIMIT 5;

## Normalisation & CTE
-- 1. First Normal Form (1NF):
-- a. Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.
-- Answer:






























  











  
  







