--Q1
select *
from customer
where last_name LIKE 'T%'
ORDER BY first_name;

--Q2
select *
from rental
where rental_date BETWEEN '5/28/2005' AND '6/1/2005';

--Q3
select title
from rental
left join inventory
on rental.rental_id = inventory.inventory_id
left join film
on inventory.inventory_id = film.film_id
ORDER BY rental_id DESC
LIMIT 10;

--Q4
SELECT customer_id, SUM(amount) AS total_amt
from payment
GROUP BY customer_id
ORDER BY total_amt ASC;

--Q5
SELECT (actor.actor_id) AS "Actor Name",MAX(film_actor.film_id) AS "Number of Movies"
FROM actor
LEFT JOIN film_actor
on actor.actor_id = film_actor.actor_id
LEFT JOIN film
on film_actor.film_id = film.film_id
WHERE film.release_year = 2006
GROUP BY actor.actor_id
ORDER BY "Number of Movies" DESC;

--Q6 Write and explain plan for 4 and 5. 
SELECT customer_id, SUM(amount) AS total_amt -- The sum will indicate he amount spent from each customer and the as will give it an alias 
from payment --this is folder in which you can see the payment to categorize the amount
GROUP BY customer_id --this group by groups the customers id to the total amount spent
ORDER BY total_amt ASC; --this order by orders the amount spent by the customer

--Q7
SELECT category_id, AVG(rental_rate) AS avg_rent_rate
from film_category
JOIN film
ON film_category.category_id = film.film_id
GROUP BY film_category.category_id;

--Q8
SELECT category_id, SUM(payment.rental_id) AS total_rent, SUM(amount) AS total_sale
from film_category
JOIN film
on film_category.film_id = film.film_id
JOIN inventory
on film.film_id = inventory.film_id
JOIN rental
on inventory.inventory_id = rental.inventory_id
JOIN payment
on rental.rental_id = payment.rental_id
GROUP BY film_category.category_id
ORDER BY total_sale DESC
LIMIT 5;
