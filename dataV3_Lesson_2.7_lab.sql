USE sakila;

-- 1
SELECT c.name AS category_name, COUNT(fc.film_id) AS number_of_films
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY number_of_films DESC;

-- 2
SELECT staff_id, SUM(amount) AS sales_amount FROM payment
WHERE MONTH(payment_date) = 8 AND YEAR (payment_date) = 2005
 GROUP BY staff_id ORDER BY sales_amount DESC;

-- 3
SELECT actor_id, COUNT(*) AS acted_films FROM film_actor GROUP BY actor_id ORDER BY acted_films DESC;
SELECT first_name, last_name AS actor_name FROM actor WHERE actor_id = 107; 
#GINA DEGENERES is the actor that appeared the most

-- 4
SELECT concat(c.first_name, ' ', c.last_name) AS customer_id, COUNT(p.rental_id) AS number_of_rentals
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY number_of_rentals DESC;
# Eleanor hunt

-- 5
SELECT concat(s.first_name, ' ', s.last_name), a.address FROM staff s
JOIN address a ON s.address_id = a.address_id;

-- 6
SELECT f.film_id, f.title, COUNT(a.actor_id) AS number_of_actors FROM film f 
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY f.film_id, f.title
ORDER BY number_of_actors DESC;
#I really don't know why is it not working

-- 7
SELECT concat(c.first_name, ' ', c.last_name) AS customer_id, COUNT(amount) AS total_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY total_paid DESC;
#Also here the same problem, it's not working

-- 8
SELECT c.name AS category_name, f.title AS film_title
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
ORDER BY c.name, f.title;
