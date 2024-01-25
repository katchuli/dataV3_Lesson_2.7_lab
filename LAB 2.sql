use sakila;
-- 1 How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT c.name AS category, COUNT(f.film_id) AS number_of_films
FROM sakila.category c
JOIN sakila.film_category fc ON c.category_id = fc.category_id
JOIN sakila.film f ON fc.film_id = f.film_id
GROUP BY c.name; 

select film_id from sakila.film;

-- 2 Display the total amount rung up by each staff member in August of 2005.

SELECT s.staff_id, SUM(p.amount) AS total_payment
FROM sakila.staff s
JOIN sakila.payment p ON s.staff_id = p.staff_id
WHERE p.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY s.staff_id;

-- 3 Which actor has appeared in the most films?

select a.actor_id, count(*) as film_count
from sakila.actor a 
join sakila.film_actor fa
on a.actor_id=fa.actor_id
group by actor_id
order by film_count desc;

-- 4 Most active customer (the customer that has rented the most number of films)

SELECT r.customer_id, COUNT(*) AS rental_count
FROM sakila.rental r
JOIN sakila.customer c ON r.customer_id = c.customer_id
GROUP BY r.customer_id
ORDER BY rental_count DESC
LIMIT 1;

-- 5 Display the first and last names, as well as the address, of each staff member.

select s.staff_id, s.first_name, s.last_name, a.address
from sakila.staff straight_join sakila.address a
join sakila.address a
on a.address_id=address_id;

-- 6 List each film and the number of actors who are listed for that film.
SElECT f.film_id, f.title, count(fa.actor_id)
from sakila.film f
join sakila.film_actor fa
on fa.film_id = f.film_id
group by f.film_id, f.title
order by f.film;

-- 7 Using the tables payment and customer and the JOIN command
-- list the total paid by each customer. List the customers alphabetically by last name.
select c.customer_id, c.last_name, sum(p.amount) as total_paid
from customer c 
join payment p
on p.customer_id = c.customer_id
group by p.customer_id
order by c.last_name;


-- 8 List the titles of films per category
SELECT f.title, c.name
from category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id 
ORDER BY c.name, f.title;

  