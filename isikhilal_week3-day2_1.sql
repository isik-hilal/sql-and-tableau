-- Instructions
-- 1- Which actor has appeared in the most films?(Hint films and actors) asla emin değilim
use sakila;
select actor.first_name, last_name, count(*) as 'total_acted' from film_actor inner join actor using(actor_id) order by first_name desc limit 1;

-- 2- Most active customer (the customer that has rented the most number of films) hint: rental customer id, rental date more records for rental, 
-- maybe max, give the customer name

select customer.customer_id, first_name, last_name, count(*) as 'Total_Rentals' from rental
inner join customer using(customer_id) group by customer_id order by Total_Rentals DESC LIMIT 1

-- 3- List number of films per category. hint: group by but maybe it is possible to do it without grouping?
select count(film_id) as 'how_many' from category left join film_category using(category_id) group by category_id;

select count(film_id) as 'how_many_movies', name from category left join film_category using(category_id) group by category_id;

select category_id, count(category.film_id) as 'how_many'from category left join film f on f.category_id = c.category_id
group by category.category_id, category.name;

-- 4- Display the first and last names, as well as the address, of each staff member. DONE
Select first_name, last_name, address from staff inner join address using (address_id);

-- 5- Display the total amount rung up by each staff member in August of 2005.?? DONE
Select first_name, last_name, SUM(amount) from staff inner join payment using(staff_id) 
group by payment.staff_id order by last_name;

-- 6- List each film and the number of actors who are listed for that film. DONE
SELECT film.title, COUNT(film_actor.actor_id) as `Number_of_Actors`
from film_actor INNER JOIN film using(film_id) GROUP BY film.title;

-- 7- Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name. DONE
Select customer.last_name, customer.first_name, SUM(payment.amount) as 'total_paid' from customer  
inner join payment using(customer_id) group by customer.last_name order by customer.last_name;

Select customer.last_name, customer.first_name, SUM(payment.amount) as 'total_paid' from customer  
inner join payment using(customer_id) group by customer.last_name;
-- Optional: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. Give it a try.