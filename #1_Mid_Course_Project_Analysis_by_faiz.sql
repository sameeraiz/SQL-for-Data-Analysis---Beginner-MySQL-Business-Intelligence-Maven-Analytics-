USE mavenmovies;
-- Que.1 : We will need a list of all staff members, including their FIRSTNAME, LASTNAME, EMAIL & STORE ID.alter
SELECT first_name, last_name, email, store_id
FROM staff;

-- Que.2 : We will need seperate counts of inventory items held at each of your 2 stores.
SELECT store_id, COUNT(inventory_id) as 'Inventory items' 
FROM inventory 
GROUP BY store_id;
 
-- Que.3 : We will need a count of active customers for each of your stores. Seperately please
SELECT store_id, COUNT(customer_id) as total_active_users
FROM customer
WHERE active = 1
GROUP BY store_id;

-- Que.4 : In order to asses the liability of a data breach, we will need you to provide a count of all customer email addresses stores in a database.
SELECT COUNT(email) as Total_emails
FROM customer;

-- Que.5 : We are interested in how diverse your firm is as a means of understanding how likely you are to keep customers engaged in the future.
-- Please provide a count of unique films titles you have in inventory at each store and then provide a count of the unique categories film
-- you provide.
SELECT store_id, COUNT(DISTINCT(film_id)) AS 'count of unique films'  
FROM inventory
GROUP BY store_id;

SELECT COUNT(DISTINCT(name)) AS 'Unique film categories'
FROM category;

/*
Que.6 : We would like to understand the replacement cost of your firms. Please provide the replacement cost for the film that is least expensive to 
replace, the most expensive to replace, and the average of all films you carry.
*/
SELECT min(replacement_cost) as least_expensive,
max(replacement_cost) as most_expensive,
avg(replacement_cost) as average_replacememt_cost
FROM film; 

-- Que.7 : We are interested in having you put payment monitoring system and maximum payment processing restriction in place in order to minimize
-- the future risk of fraud by your staff. Please provide the average payment you process, as well as the max. payment you have processed.
SELECT AVG(amount) as average_amount_processed, MAX(amount) as max_amount_processed
FROM payment;


-- Que.8 : We would like to better understand what your customer base looks like. Please provide a list of customer identification values,
-- with a count of rentals they have made all-time, with your highest volume customers at the top of the list.
SELECT customer_id, COUNT(rental_id) as rental_counts
FROM rental
GROUP BY customer_id
ORDER BY rental_counts DESC;
