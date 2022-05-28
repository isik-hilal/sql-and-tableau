-- 1- In the table actor, what last names are not repeated? For example if you would sort the data in the table actor by last_name, 
-- you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. 
-- So we do not want to include this last name in our output. 
-- Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
use sakila;
-- to see the last names 
select distinct first_name, last_name from actor order by last_name limit 3;

select last_name from actor group by last_name having count(last_name) <2;
-- or
select last_name from actor group by last_name having count(last_name) =1;

-- 2- Which last names appear more than once? 
-- We would use the same logic as in the previous question but this time we want to include the last names of the actors 
-- where the last name was present more than once
-- I used the same function with >
select last_name from actor group by last_name having count(last_name) >1;

-- 3- Using the rental table, find out how many rentals were processed by each employee.
select * from rental;
-- check
select count(rental_id) from rental;

select rental.staff_id, count(rental_id) as 'how many' from rental group by staff_id;

-- 4 Using the film table, find out how many films there are of each rating.
select film.rating, count(film_id) as 'how many' from film group by rating;

-- 5 What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select film.rating, round(avg(length),2) as 'average' from film group by rating;

-- 6 Which kind of movies (rating) have a mean duration of more than two hours?
select film.rating, round(avg(length),2) as 'average' from film group by rating having average> 120;
