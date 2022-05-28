-- Lab | SQL Subqueries
-- In this lab, you will be using the Sakila database of movie rentals. Create appropriate joins wherever necessary.
use sakila;
-- Instructions
-- 1- How many copies of the film Hunchback Impossible exist in the inventory system?
select title, COUNT(inventory_id) from film inner join inventory using(film_id)
where title = 'Hunchback Impossible';

-- It is also going to work like this, since it is inner join right or left does not matter. Good point!
select title, COUNT(inventory_id) from inventory inner join film using(film_id)
where title = 'Hunchback Impossible';

-- 2- List all films whose length is longer than the average of all the films.
select title, length from film where length > (select avg(length) as average from film);

-- check the average
select avg(length) as average from film;

-- 3- Use subqueries to display all actors who appear in the film Alone Trip.
-- We need to get info from 3 different tables: actor, film_actor, film tables
select first_name, last_name from actor where actor_id in
	(select actor_id from film_actor
	where film_id in 
		(select film_id from film
		where title = "Alone Trip"));
        
-- 4- Sales have been lagging among young families, and you wish to target all family movies for a promotion. -->
-- Identify all movies categorized as family films.

-- We need to get info from 3 different tables: film, film_category, category tables

select title from film where film_id in
	(select film_id from film_category
	where category_id in 
		(select category_id from category
		where category.name = 'family'));

-- 5- Get name and email from customers from Canada using subqueries. -->
-- Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, 
-- that will help you get the relevant information.

-- We need to get info from 4 different tables: customer, address, city, country tables
select first_name, last_name, email from customer where address_id in
	(select address_id from address
	where city_id in 
		(select city_id from city
		where country_id in 
			(select country_id from country
            where country ='Canada')));
            
-- with join ufff
select first_name, last_name, email from customer inner join address using(address_id)
inner join city using(city_id)
inner join country using(country_id)
where country ='Canada';

-- Optional
-- 6 Which are films starred by the most prolific actor? 
-- Most prolific actor is defined as the actor that has acted in the most number of films. 
-- First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

-- instead of using firs_name I used actor_id to make the connection with other tables
select title from film where film_id in
	(select film_id from film_actor
	where actor_id = 
		(select actor.actor_id from film_actor
inner join actor using(actor_id) group by actor_id order by count(*) desc limit 1));

-- If you want to work on that instead of using inner join, you can use another where...

-- 7- Films rented by most profitable customer. 
-- You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
select title from film where film_id in
	(select film_id from film_actor
	where actor_id =
select customer.customer_id from rental
inner join customer using(customer_id) group by customer_id order by count(*) DESC LIMIT 1));
-- 8- Customers who spent more than the average payments.