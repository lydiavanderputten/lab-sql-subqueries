USE Sakila;
# Question 1 How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT * FROM Sakila.film;
SELECT * FROM Sakila.inventory;
SELECT * FROM Sakila.rental;

SELECT f.flm_id, i.inventory_id, f.title
FROM Sakila.film f 
JOIN Sakila.inventory i
USING(film_id)
WHERE f.title = 'Hunchback Impossible';

# Question 2 List all films whose length is longer than the average of all the films.
# step 1: calculate the average
SELECT AVG(length) FROM Sakila.film;

# step 2 --> pseudo code the main goal of this ste
SELECT * FROM Sakila.film
WHERE title > 'AVERAGE';

# -- step 3 ... create the query
SELECT * FROM Sakila.film
WHERE title > (
  SELECT avg(length)
  FROM Sakila.film
  );
  
# -- step 4 - Prettify the result.
SELECT * FROM Sakila.film
WHERE title > (SELECT avg(length)
                FROM Sakila.film)
ORDER BY title desc;

# Question 3 Use subqueries to display all actors who appear in the film Alone Trip.
SELECT * from Sakila.film_actor;
SELECT * FROM Sakila.film;
SELECT * from Sakila.actor;

SELECT f.title, f.description, 
FROM Sakila.film f JOIN Sakila.actor a
USING film_id
JOIN Sakila.film_actor fa on af.actor_id = a.actor_id
WHERE f.title = 'Alone Trip';


# Question 4 Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
SELECT * from Sakila.film_category;
SELECT * FROM Sakila.film;
# Identify all movies categorized as family films.
SELECT f.title
FROM Sakila.film f 
JOIN Sakila.film_category
on f.film_id = fa.film_id
WHERE c.category_id = '8'; 

# Question 5 Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant informatio
SELECT * from Sakila.customer;
SELECT * from Sakila.country;
SELECT * from Sakila.address;
SELECT * from Sakila.city;

# The USING clause is used if several columns share the same name but you don’t want to join using all of these common columns. 
# The columns listed in the USING clause can’t have any qualifiers in the statement, including the WHERE clause:

SELECT cu.first_name, cu.last_name, cu.email, co.country
From Sakila.customer cu JOIN Sakila.address 
USING(address_id)
JOIN Sakila.city ci 
On ci.country_id = ad.city_id
JOIN Sakila.country co
on co.country_id = ci.country_id
WHERE co.country = 'CANADA'; 

# Question 6 Which are films starred by the most prolific actor? 
# Most prolific actor is defined as the actor that has acted in the most number of films. 
# First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
SELECT * from Sakila.film_actor;
SELECT * from Sakila.actor;

#find the most prolific actor
SELECT a.first_name, a.last_name
FROM Sakila.actor a
JOIN Sakila.film_actor fa
ON a.actor_id = fa.actor_id;

# and then use that actor_id to find the different films that he/she starred.
# still working on it
SELECT a.first_name, a.last_name, title
FROM Sakila.film_actor ac
JOIN Sakila.film f
ON f.film_id = ac.film_id;
GROUP BY film_id desc;

# Question 7 Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
# Could not finalize this question, I will continue to work on this

# Question 8 Customers who spent more than the average payments.
# Could not finalize this question, I will continue to work on this