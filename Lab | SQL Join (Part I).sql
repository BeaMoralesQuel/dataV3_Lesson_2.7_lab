-- Lab | SQL Join (Part I)

-- In this lab, you will be using the Sakila database of movie rentals.

USE sakila;

-- 1.How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT category.name, COUNT(film.title) AS num_films
FROM film_category
JOIN film
ON film_category.film_id = film.film_id
JOIN category
ON film_category.category_id = category.category_id
GROUP BY category.name
;

-- 2.Display the total amount rung up by each staff member in August of 2005.

SELECT COUNT(amount) AS rung_up, staff_id
FROM payment
WHERE payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY staff_id
;

-- 3.Which actor has appeared in the most films?

SELECT CONCAT(a.first_name, ' ', a.last_name) AS top_actor
FROM actor a
JOIN film_actor b
ON a.actor_id = b.actor_id
GROUP BY last_name, first_name
ORDER BY COUNT(b.film_id) DESC
LIMIT 1
;

-- 4.Most active customer (the customer that has rented the most number of films)

SELECT CONCAT(a.first_name, ' ', a.last_name) AS top_customer
FROM customer AS a
JOIN rental AS b
ON a.customer_id = b.customer_id
GROUP BY last_name, first_name
ORDER BY COUNT(b.rental_id) DESC
LIMIT 1
;

-- 5.Display the first and last names, as well as the address, of each staff member.

SELECT staff.first_name, staff.last_name, address.address, city.city, address.district, country.country
FROM address
JOIN staff
ON address.address_id = staff.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
;

-- 6.List each film and the number of actors who are listed for that film.

SELECT film.title,COUNT(film_actor.actor_id) AS number_actors
FROM film_actor
LEFT JOIN film
ON film_actor.film_id = film.film_id
GROUP BY film.title
ORDER BY number_actors DESC
;

-- 7.Using the tables payment and customer and the JOIN command, list the total paid by 
-- each customer. List the customers alphabetically by last name.

SELECT  customer.first_name, customer.last_name, SUM(payment.amount)
FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id
GROUP BY customer.first_name, customer.last_name
ORDER BY customer.last_name
;
-- 8.List the titles of films per category.

SELECT *
FROM film
JOIN film_category
ON film.film_id = film_category.film_id
JOIN category
ON film_category.category_id = category.category_id
;