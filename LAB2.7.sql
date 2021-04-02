LAB-2.7
USE sakila;
-- How many films are there for each of the catagories table.Use appropriate join to write this query
SELECT c.category_id AS category,COUNT(f.film_id) as num_films
FROM sakila.film_category c
JOIN sakila.film f
USING (film_id)
GROUP BY c.category_id;


-- Display the total amount rung up by each staff member in august 2005
SELECT CONCAT(s.first_name,' ',s.last_name) AS Staff, SUM(p.amount) as Amount_in_August_2005
FROM sakila.payment p
JOIN sakila.staff as s
ON (p.staff_id = s.staff_id)
WHERE payment_date >= "2005-08-01" AND payment_date <= "2005-08-31"
GROUP BY p.staff_id;


-- Which actor has appeared in the most films?
SELECT  CONCAT(first_name,last_name), COUNT(actor_id) AS num_films
FROM sakila.actor 
JOIN sakila.film_actor 
USING  (actor_id)
GROUP BY actor_id
ORDER BY  num_films DESC;



-- Most active customer (the customer that has rented the most number of films)
SELECT CONCAT(c.first_name,c.last_name) AS Customer, COUNT(r.rental_id) AS Video_Rented
FROM sakila.customer c
JOIN sakila.rental r
USING (customer_id)
GROUP BY customer_id
ORDER BY Video_Rented DESC
LIMIT 1;



-- Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name,s.last_name,a.address_id
FROM staff s
JOIN address a
ON a.address_id = s.address_id;



-- List each film and the number of actors who are listed for that film.
SELECT title as Title, COUNT(fa.actor_id) as Nb_of_Actors_per_each_Films
FROM sakila.film_actor fa
JOIN sakila.film f
USING (film_id)
RIGHT JOIN sakila.actor a
USING (actor_id)
GROUP BY Title;


-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.last_name, SUM(p.amount) AS amount
FROM sakila.customer c
JOIN sakila.payment p
ON c.customer_id = p.customer_id
GROUP BY last_name
ORDER BY last_name ASC;

-- List number of films per category.
SELECT SUM(fc.category_id) AS catagory, f.film_id AS  films
FROM sakila.film_category fc
JOIN sakila.film f
ON f.film_id = fc.film_id
GROUP BY films;
