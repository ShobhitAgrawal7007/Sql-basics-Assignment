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
    p.product_name,
    SUM(s.amount) AS total_sales
FROM sales s
INNER JOIN products p 
    ON s.product_id = p.product_id
GROUP BY p.product_name;

-- 10.You are given three tables:
-- Orders (table from question)
-- Customers (table from question)
-- Order_Details (table from question)
-- Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables.

-- Answer: 
SELECT 
    o.order_id,
    c.customer_name,
    SUM(od.quantity) AS total_quantity
FROM orders o
INNER JOIN customers c 
    ON o.customer_id = c.customer_id
INNER JOIN order_details od 
    ON o.order_id = od.order_id
GROUP BY o.order_id, c.customer_name
ORDER BY o.order_id;

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
-- What is 1NF?
-- A table is in First Normal Form (1NF) if:
-- 1.All attributes contain atomic (indivisible) values.
-- 2.There are no repeating groups or arrays.
-- 3.Each record is unique.

-- Table in Sakila that violates 1NF
-- The film table is a good example.
-- It has a column called special_features, which stores multiple values in a comma-separated list (e.g., "Trailers,Commentaries,Deleted Scenes,Behind the Scenes").
-- This violates 1NF because:
-- 1.The values are not atomic (more than one feature stored in a single field).
-- 2.Searching/filtering for a single feature (like "Behind the Scenes") becomes inefficient.

-- How to Normalize to 1NF
-- To achieve 1NF, we split multi-valued attributes into a separate table.
-- Current situation (not 1NF):
-- film(film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features, last_update)

-- Normalized structure:
-- 1.Keep film table without special_features.
-- film(film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update)
-- 2.Create a new table film_special_feature:
-- film_special_feature(film_id, feature)
-- (A).film_id → foreign key referencing film(film_id)
-- (B).feature → stores a single feature (e.g., "Trailer", "Behind the Scenes")

-- 2. Second Normal Form (2NF):
 -- a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. 
 -- If it violates 2NF, explain the steps to normalize it.
 
 -- Answer:
-- What is 2NF?
-- A table is in 2NF if:
-- 1.It is already in 1NF.
-- 2.Every non-key attribute is fully functionally dependent on the whole primary key (not just part of it).
-- (In other words, there should be no partial dependency).
-- Partial dependency happens when:
-- 1.A table has a composite primary key (more than one column).
-- 2.A non-key column depends only on part of that key, instead of the whole key.

-- Candidate Table in Sakila: film_actor
-- film_actor(film_id, actor_id, last_update)
-- (Primary Key = (film_id, actor_id))

-- Better Example: rental Table
-- rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
-- (Primary Key = rental_id (single column, not composite).
-- Since the key is single, 2NF is automatically satisfied).

-- Example Where 2NF Issues Could Happen
-- film_category_info(film_id, category_id, category_name)
-- 1.Primary Key = (film_id, category_id)
-- 2.Non-key column = category_name
-- Violation of 2NF:
-- 1.category_name depends only on category_id, not on the whole composite key (film_id + category_id).
-- 2.This means partial dependency exists.

-- Steps to Normalize to 2NF
-- Remove the partial dependency.
-- Split into two tables:
-- 1.film_category(film_id, category_id)           -- relationship table
-- 2.category(category_id, category_name)          -- category details
-- Now:
-- film_category only links films and categories (no extra attributes).
-- category stores category names.

-- 3. Third Normal Form (3NF):
-- a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies present and outline the steps to normalize the table to 3NF.

-- Answer:
-- What is 3NF?
-- A table is in 3NF if:
-- 1.It is already in 2NF.
-- 2.There are no transitive dependencies.
-- Transitive dependency = A non-key attribute depends on another non-key attribute, instead of directly depending on the primary key.

-- Table in Sakila that violates 3NF
-- A good candidate is the address table:
-- address(address_id, address, address2, district, city_id, postal_code, phone, last_update)
-- city(city_id, city, country_id, last_update)
-- country(country_id, country, last_update)
-- Problem:
-- address table has a foreign key city_id.
-- But city_id → country_id → country.
-- That means country is indirectly dependent on address_id through city_id.
-- This is a transitive dependency:
-- address_id → city_id → country_id → country

-- Steps to Normalize to 3NF
-- 1.Keep only city_id in address table:
-- address(address_id, address, address2, district, city_id, postal_code, phone, last_update)
-- 2.Separate city details:
-- city(city_id, city, country_id, last_update)
-- 3.Separate country details:
-- country(country_id, country, last_update)
-- Now:
-- 1.address depends directly on address_id.
-- 2.city depends directly on city_id.
-- 3.country depends directly on country_id.
-- (All transitive dependencies removed → now in 3NF).

-- 4. Normalization Process:
-- a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form upto at least 2NF.

-- Answer:
-- Step 1: Choose a Table
-- We’ll take the film table, since it has some columns that clearly illustrate normalization.
-- Original structure (slightly simplified):
-- film(film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features, last_update)

-- Step 2: Unnormalized Form (UNF)
-- Imagine in a denormalized (raw) form, the film table looked like this:
-- film_id | title        | release_year | language_id | category_name | special_features
-- 1       | Matrix       | 1999         | 1           | Action, Sci-Fi| Trailers, Behind the Scenes
-- 2       | Toy Story    | 1995         | 1           | Animation     | Deleted Scenes
-- Problems:
-- category_name contains multiple values (Action, Sci-Fi).
-- special_features also has multi-valued attributes (Trailers, Behind the Scenes).
-- Data is not atomic → violates 1NF.

-- Step 3: First Normal Form (1NF)
-- Rule: Eliminate repeating groups, multi-valued attributes, ensure atomic values.
-- Fix:
-- 1.Keep film table atomic (remove multi-valued columns).
-- 2.Create new tables for categories and special features.
-- film(film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update)
-- film_category(film_id, category_id)
-- category(category_id, category_name)
-- film_special_feature(film_id, feature)
-- film_id | title
-- 1       | Matrix
-- 2       | Toy Story

-- film_id | category_id
-- 1       | 1
-- 1       | 2
-- 2       | 3

-- category_id | category_name
-- 1           | Action
-- 2           | Sci-Fi
-- 3           | Animation

-- film_id | feature
-- 1       | Trailer
-- 1       | Behind the Scenes
-- 2       | Deleted Scenes

-- Step 4: Second Normal Form (2NF)
-- Rule: No partial dependency on part of a composite primary key.
-- 1.In film_category(film_id, category_id), the primary key = (film_id, category_id).
-- 2.No other non-key attributes are present → ✅ already in 2NF.
-- 3.In film_special_feature(film_id, feature), same logic → ✅ already in 2NF.
-- 4.film itself has a single-column primary key (film_id) → ✅ automatically in 2NF.

-- 5. CTE Basics:
 -- a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film_actor tables.
 -- Answer:
 WITH ActorFilmCount AS (
    SELECT 
        a.actor_id,
        a.first_name,
        a.last_name,
        COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id, a.first_name, a.last_name
)
SELECT 
    first_name, 
    last_name, 
    film_count
FROM ActorFilmCount
ORDER BY film_count DESC;

-- 6. CTE with Joins:
 -- a. Create a CTE that combines information from the film and language tables to display the film title, language name, and rental rate.
-- Answer:
WITH FilmLanguage AS (
    SELECT 
        f.film_id,
        f.title,
        l.name AS language_name,
        f.rental_rate
    FROM film f
    JOIN language l 
        ON f.language_id = l.language_id
)
SELECT 
    title, 
    language_name, 
    rental_rate
FROM FilmLanguage
ORDER BY title;

-- 7. CTE for Aggregation:
-- a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment table.
-- Answer:
WITH CustomerRevenue AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_revenue
    FROM customer c
    JOIN payment p 
        ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT 
    customer_id,
    first_name,
    last_name,
    total_revenue
FROM CustomerRevenue
ORDER BY total_revenue DESC;

-- 8. CTE with Window Functions:
 -- a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.
WITH FilmRanking AS (
    SELECT 
        film_id,
        title,
        rental_duration,
        RANK() OVER (ORDER BY rental_duration DESC) AS rental_rank
    FROM film
)
SELECT 
    film_id,
    title,
    rental_duration,
    rental_rank
FROM FilmRanking
ORDER BY rental_rank, title;

-- 9. CTE and Filtering:
-- a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve additional customer details.
-- Answer:
WITH FrequentRenters AS (
    SELECT 
        r.customer_id,
        COUNT(r.rental_id) AS rental_count
    FROM rental r
    GROUP BY r.customer_id
    HAVING COUNT(r.rental_id) > 2
)
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    f.rental_count
FROM FrequentRenters f
JOIN customer c 
    ON f.customer_id = c.customer_id
ORDER BY f.rental_count DESC;

-- 10. CTE for Date Calculations:
 -- a. Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table.
-- Answer:
WITH MonthlyRentals AS (
    SELECT 
        YEAR(rental_date) AS rental_year,
        MONTH(rental_date) AS rental_month,
        COUNT(rental_id) AS total_rentals
    FROM rental
    GROUP BY YEAR(rental_date), MONTH(rental_date)
)
SELECT 
    rental_year,
    rental_month,
    total_rentals
FROM MonthlyRentals
ORDER BY rental_year, rental_month;

-- 11. CTE and Self-Join:
 -- a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.
-- Answer:
WITH ActorPairs AS (
    SELECT 
        fa1.film_id,
        fa1.actor_id AS actor1_id,
        fa2.actor_id AS actor2_id
    FROM film_actor fa1
    JOIN film_actor fa2 
        ON fa1.film_id = fa2.film_id
       AND fa1.actor_id < fa2.actor_id   -- avoid duplicates & self-pairing
)
SELECT 
    ap.film_id,
    a1.first_name || ' ' || a1.last_name AS actor1_name,
    a2.first_name || ' ' || a2.last_name AS actor2_name
FROM ActorPairs ap
JOIN actor a1 ON ap.actor1_id = a1.actor_id
JOIN actor a2 ON ap.actor2_id = a2.actor_id
ORDER BY ap.film_id, actor1_name, actor2_name;

-- 12. CTE for Recursive Search:
-- a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to column.
-- Answer:
WITH RECURSIVE StaffHierarchy AS (
    -- Anchor member: Start with the manager
    SELECT 
        s.staff_id,
        s.first_name,
        s.last_name,
        s.reports_to,
        0 AS level
    FROM staff s
    WHERE s.staff_id = 1   -- starting manager

    UNION ALL

    -- Recursive member: Find employees reporting to previous level
    SELECT 
        e.staff_id,
        e.first_name,
        e.last_name,
        e.reports_to,
        sh.level + 1 AS level
    FROM staff e
    JOIN StaffHierarchy sh ON e.reports_to = sh.staff_id
)
SELECT 
    staff_id,
    first_name,
    last_name,
    reports_to,
    level
FROM StaffHierarchy
ORDER BY level, staff_id;






































  











  
  







