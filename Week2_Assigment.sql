use mavenmovies;

select * from rental;

/*
Question 1: 
Retrieve the total number of rentals made in the Sakila database. 
Hint: Use the COUNT() function. 
*/
 select count(rental_id) from rental;
 
 /*
 Question 2: 
Find the average rental duration (in days) of movies rented from the Sakila database.
Hint: Utilize the AVG() function.
 */

select * from film;
select avg(rental_duration) from film;

/*
Question 3: 
Display the first name and last name of customers in uppercase. 
Hint: Use the UPPER () function. 
*/

select * from customer;
select upper(first_name)as First_Name, upper(last_name)as Last_Name from customer;

/*
Question 4: 
Extract the month from the rental date and display it alongside the rental ID. 
Hint: Employ the MONTH() function. 
*/
select * from rental;
select month(rental_date), rental_id from rental ;

/*
Question 5: 
Retrieve the count of rentals for each customer (display customer ID and the count of rentals). 
Hint: Use COUNT () in conjunction with GROUP BY. 
*/
select * from rental;
select count(rental_id), customer_id from rental group by customer_id;

/*
Question 6: 
Find the total revenue generated by each store. 
Hint: Combine SUM() and GROUP BY. 
*/
select * from store;
select * from film;

/*
Display the title of the movie, customer s first name, and last name who rented it. 
Hint: Use JOIN between the film, inventory, rental, and customer tables. 
*/
select * from film;
select * from inventory;
select * from rental;
select * from customer;

select title, first_name , last_name from customer
inner join rental on rental.customer_id = customer.customer_id
inner join  inventory on inventory.inventory_id =rental.inventory_id
inner join film on film.film_id= inventory.film_id;

/*
Question 8: 
Retrieve the names of all actors who have appeared in the film "Gone with the Wind." 
Hint: Use JOIN between the film actor, film, and actor tables. 
*/

select * from actor;
select  * from film;
select * from film_actor;

select concat(first_name, " ", last_name) as Name from actor 
left Join film_actor on film_actor.actor_id= actor.actor_id
left join film on film.film_id =film_actor.film_id where film.title="Gone with the Wind";

/*
Question 1: 
Determine the total number of rentals for each category of movies. 
Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY. 
*/


/*
Question 2: 
Find the average rental rate of movies in each language. 
Hint: JOIN film and language tables, then use AVG () and GROUP BY. 
*/
Select avg(rental_rate) from film as f inner join language as l on f.language_id =l.language_id group by name;
Select * from film as f inner join language as l on f.language_id =l.language_id;


/*
Question 3: 
Retrieve the customer names along with the total amount they've spent on rentals. 
Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY. 
*/
select * from customer;
select * from payment;
select * from rental;
select first_name, last_name , sum(amount) from customer as c inner join payment as p on c.customer_id=p.customer_id
inner join rental as r on r.customer_id = p.customer_id group by first_name, last_name;

/*
Question 4: 
List the titles of movies rented by each customer in a particular city (e.g., 'London'). 
Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY. 
*/
select * from customer;
select * from address;
select * from city;
select * from rental;
select * from inventory;
select * from film;

select title, customer.customer_id from customer join address on address.address_id=customer.address_id 
join city on city.city_id=address.city_id 
join rental on rental.customer_id=customer.customer_id
join inventory on inventory.inventory_id=rental.inventory_id
join film on film.film_id =inventory.film_id
where city.city='LONDON';


/*
Question 5: 
Display the top 5 rented movies along with the number of times they've been rented. 
Hint: JOIN film, inventory, and rental tables, then use cOUNT() and GROUP BY, and limit the results. 
*/
-- not able to see  payment/rental details that's why just showing the film and count
select * from film;
select * from inventory;
select * from rental;

select title, count(*) from film join inventory as i on i.film_id=film.film_id
join rental as r on r.inventory_id =i.inventory_id
group by title limit 5;

/*
Question 6: 
Determine the customers who have rented movies from both stores (store ID 1 and store ID 2). 
Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY. 
*/
select * from customer;
select * from rental;
select * from inventory;

select * from customer join rental on rental.customer_id=customer.customer_id
join inventory as i on i.inventory_id= rental.inventory_id;


