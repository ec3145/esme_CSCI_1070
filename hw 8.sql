--Q1
ALTER TABLE rental
ADD COLUMN status VARCHAR(10);
UPDATE rental
SET status = CASE
WHEN return_date < rental_date THEN 'Early'
WHEN return_date = rental_date THEN 'on time'
WHEN return_date > rental_date THEN 'Late'
END;
SELECT status
from rental 

--Q2
SELECT city, SUM(payment.amount) AS total_payment
FROM payment
left join staff
ON payment.payment_id = staff.staff_id
left join address
ON staff.staff_id = address.address_id
left join city
ON address.address_id = city.city_id
WHERE city.city IN ('Kansas City', 'Saint Louis')
GROUP BY city.city;

--Q3
SELECT category.name, COUNT(film_category.film_id) AS count_category
from category
JOIN film_category
ON category.category_id = film_category.category_id
GROUP BY category.name;

--Q4
--there is a table for category and one for film_category because one is to store the 
--names of films and the other is act as a connector to identify other films to to other categories

--Q5
SELECT film.film_id, film.title, film.length, rental.return_date
from film
JOIN inventory
ON film.film_id = inventory.inventory_id
JOIN rental
ON inventory.inventory_id = rental.rental_id
WHERE rental.return_date BETWEEN '05-15-2005' AND '05-31-2005';

--Q6
SELECT film.title, film.rental_rate
from film
WHERE film.rental_rate < (SELECT AVG(rental_rate) FROM film);

--Q7
UPDATE rental
SET status = CASE
WHEN return_date < rental_date THEN 'Early'
WHEN return_date = rental_date THEN 'on time'
WHEN return_date > rental_date THEN 'Late'
END;

SELECT status, COUNT(*) AS count
from rental
GROUP BY status;

--q8
SELECT film.length, film.title,
PERCENT_RANK() OVER(ORDER BY film.length) as percent
from film;

--Q9
EXPLAIN SELECT category.name, COUNT(film_category.film_id) AS count_category
from category
JOIN film_category
ON category.category_id = film_category.category_id
GROUP BY category.name;
--the explain plan shows the joins being made in category and film_category 

EXPLAIN SELECT film.title, film.rental_rate
from film
WHERE film.rental_rate < (SELECT AVG(rental_rate) FROM film);
--the explain plan shows the scan of the table and the operation of averaging out the rental rate
