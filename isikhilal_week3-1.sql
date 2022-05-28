use sakila;
-- Explore tables by selecting all columns from each table or using the in built review features for your client.
select * from actor;
select * from address;
select * from category;
select * from city;
select * from country;
select * from customer;
select * from film;
select * from film_actor;
select * from film_category;
select * from film_text;
select * from inventory;
select * from language;
select * from payment;
select * from rental;
select * from staff;
select * from store;
-- Select one column from a table. Get film titles.
select title from film;
-- Get unique list of film languages under the alias language
select DISTINCT name  as language from language;
-- 5.1 Find out how many stores does the company have?
select count(*) from store;
-- 5.2 Find out how many employees staff does the company have?
select count(*) from staff;
-- Return a list of employee first names only?
select first_name from staff;

