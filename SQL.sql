-- Display the first and last names of all actors from the table actor.
USE sakila;
-- Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.

Select  first_name, last_name from actor;

-- You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe."
Select first_name, last_name,
concat(first_name," ", last_name) as `Actor Name` from actor; 

select first_name, 
last_name, 
actor_id from actor where first_name = "Joe";

Select first_name, last_name from actor where last_name like '%GEN%'; 

-- Find all actors whose last names contain the letters LI

Select last_name, first_name 
from actor
Where last_name 
like '%LI%' 
order by last_name;

-- Using IN, display the country_id and country columns
-- of the following countries: Afghanistan, Bangladesh, and China:


select country, country_id from country
where country in (
 'Afghanistan' 
,'Bangladesh' 
,'China'
); 

-- alter table 
--  List the -- last names of actors, 
-- as well as how many actors have that last name.
-- create a description columne to actor 



 Alter table actor
 add column (description BLOB not null);
 
 Alter table actor
drop column description; 


-- List the last names of actors, as well as 
-- how many actors have that last name.

Select last_name,count(*)
from actor
group by last_name;

-- List last names of
-- actors and the number of by
-- actors who have that last name, 
-- but only for names that are shared 
-- by at least two actors

use sakila; 
Select last_name, count(*)
from actor
group by last_name 
having count(*) >= 2;

-- The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS. Write a query to fix the record.

update actor
set first_name = "Groucho"
where last_name = "William";

-- Perhaps we were too hasty in changing
-- GROUCHO to HARPO. 
-- It turns out that GROUCHO was the correct 
-- name after all! In a single query, if the first name of the actor is currently HARPO, change it to GROUCHO.
select first_name = 'Grouch'
where firs_naame = 'Harpo';

-- locate the schema of the address table. 
-- Which query would you use to re-create it?
select first_name, last_name, a.address from staff s
inner join address a
on a.address_id = s.address_id; 
-- JOIN to display the total amount rung up by each staff member in August of 2005.
-- Use tables staff and payment.
Select first_name, s.last_name,sum(p.amount)
from staff s inner join payment p
on p.staff_id = s.staff_id
where p.payment_date Like "2005-08%"
group by p.staff_id; 

-- ist each film and the number of actors who are listed for that film. 
-- Use tables film_actor and film. Use inner join.
Select title, count(actor_id) AS "Number of Actor"
from film f inner join film_actor fa
on fa.film_id = f.film_id
group by f.film_id;
-- Number of Hunchback Impossible exist in the inventory system
select title, count(i.film_id)As "Copies Available" 
from film f inner join inventory i on i.film_id = f.film_id
where title Like "HunchBack Impossible"
group by f.film_id;


 -- Using the tables payment and customer and the JOIN command, list the total paid by each 
 -- customer. List the customers alphabetically by last name:

select first_name, last_name, sum(p.amount)AS "total Paid"
from payment p inner join customer c
on p.customer_id =c.customer_id
group by p.customer_id
order by last_name;
-- rectrieve music of Queen and Kris Kristofferson
-- have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the 
-- letters K and Q whose language is English. 
select title from film where language_id in 
(select language_id from language 
where name = "English") And title Like "K%"
or title Like "Q%";
-- Use subqueries to display all actors who appear in the film Alone Trip.
select first_name, Last_name 
from actor where actor_id in (select actor_id from film_actor
where film_id in (select film_id from film where title = "Alone Trip"));
-- run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. 
-- Use joins to retrieve this information.
Select Concat(first_name,"", last_name)As "Name", email
from customer cu inner join address a 
on a.address_id = cu.address_id
inner join city c 
on c.city_id = a.city_id
inner join country co 
on co.country_id = c.city_id
where country = "Canada";

-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies 
-- categorized as family films.
select title as "film", category as "Category"
from film_list 
where category = "Family";


-- Display the most frequently rented movies in descending order.
select f.title, Count(rental_id)As 'Number of Times Rented'
from rental r join inventory i
on (r.inventory_id = i.inventory_id)
join film f on (i.film_id = f. film_id)
group by f.title
order by 'Number of Times Rented' DESC;

-- Write a query to display how much business, in dollars, 
-- each store brought in.
select s.store_id, sum(amount)As 'Business Amount'
from payment p join rental r
on (p.rental_id = r.rental_id)
join inventory i
on (i.inventory_id =r.inventory_id)
join store s on (s.store_id = i.store_id)
group by s.store_id;

-- Write a query to display for each 
-- store its store ID, city, and country.
select s.store_id, c.city, co.country 
from store s
join address a 
on (s.address_id = a.address_id)
join city c
on (c.city_id = a.city_id)
join country co
on (co.country_id = c.country_id);
-- List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: 
-- category, film_category, inventory, payment, and rental.)
select c.name AS 'Genre', sum(p.amount) AS 'Gross' 
from category c
join film_category fc 
on (c.category_id=fc.category_id)
join inventory i 
on (fc.film_id=i.film_id)
join rental r 
on (i.inventory_id=r.inventory_id)
join payment p 
on (r.rental_id=p.rental_id)
group by  c.name order by Gross  LIMIT 5;

-- Use the solution from the problem above to create a view.
select c.name as 'Top Genres', sum(amount) As 'Amount' 
from category c left join film_category fc
on c.category_id = fc.category_id
left join inventory i on fc.film_if = i.film_id
inner join payment p on r.rental_id = p.rental_id
group by c.name 
order by amount DESC  limit 5;

-- How would you display the view that you created in 8a
select * from sakila.`top genres`;
-- Write a query to delete it.
drop view `top genres`;


