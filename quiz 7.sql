--Q1
select *
from payment
where amount>=9.99;

--Q2

select title
from payment
left join rental
on payment.payment_id = rental.rental_id
left join inventory
on rental.rental_id = inventory.inventory_id
left join film
on inventory.inventory_id = film.film_id
where amount = 11.99;

--Q3
select first_name, last_name, address.address_id, city.city_id, country.country_id
from staff
left join address
on staff.address_id = address.address_id
left join city
on address.city_id = city.city_id
left join country
on country.country_id = country.country_id

--Q4
-- Well i dont have a specific company as to where i want to work but i do want
--to be in the law industry. Google would be so nice but its super hard.






