USE sakila;

DESC film;

SELECT title, description, rating
	FROM film
    LIMIT 30;
    
SELECT title, description, rating, 
CASE WHEN rating IN ('R', 'NC-17') THEN 'Young Adults Only'
ELSE 'General Audience' END 
AS rating2
FROM film; 

SELECT title, description, rating, 
CASE WHEN rating  = 'R' THEN 'R-rated Movie'
WHEN rating = 'NC-17' THEN 'Not for 17 year or younger'
WHEN rating = 'PG' THEN 'Parental Guidance'
WHEN rating = 'PG-13' THEN 'Parental Guidance 13'
ELSE 'General Audience' END AS rating2,
CASE WHEN rating IN ('R', 'NC-17') THEN 'Young Adults Only'
ELSE 'General Audience' END AS rating3
FROM film;

SELECT payment_id, amount,
CASE WHEN amount > 9 THEN 'Payment large'
WHEN amount < 9 THEN 'Payment small'
ELSE 'Payment 9' END AS payment_large
FROM payment;

SELECT payment_id, amount,
CASE WHEN amount > 9 THEN 'Payment large'
ELSE 'Payment small' END AS payment_large, count(*) AS num_payments
FROM payment
GROUP BY payment_large;

SELECT rating, CASE WHEN rating IN
('R', 'NC-17') THEN 'Restricted Audience'
WHEN rating = 'PG-13' THEN '13 years or older'
ELSE 'General Audience' END AS rating2 
FROM film;

SELECT payment_id, amount,
CASE WHEN amount > 9 THEN 'Payment large'
WHEN amount < 3 THEN "Payment small"
ELSE 'Payment medium' END AS payment_code, count(*) AS num_payments
FROM payment
GROUP BY payment_code;

SELECT concat(first_name, ' ', last_name)
AS actor_full_name
FROM actor
ORDER BY last_name, first_name;

DESC customer;

SELECT customer_id, lower(email), concat(first_name, ' ', last_name) AS customer_name
FROM customer
ORDER BY last_name, first_name;

SELECT customer_id, upper(email), concat(first_name, ' ', last_name) AS customer_name
FROM customer
ORDER BY last_name, first_name;

SELECT s.first_name, s.last_name, a.address, a.district, a.postal_code, a.city_id
FROM staff AS s #staff is the left dataset
LEFT JOIN address AS a
ON s.address_id = a.address_id;

SELECT first_name, last_name, address, district, postal_code, city_id
FROM staff AS s
LEFT JOIN address AS a
ON s.address_id = a.address_id;

SELECT first_name, last_name, address, district, postal_code, city_id
FROM staff
LEFT JOIN address
USING(address_id);

SELECT * FROM staff;

SELECT * FROM customer;

SELECT first_name, last_name, address, postal_code, city_id
FROM customer
LEFT JOIN address
USING(address_id);

SELECT first_name, last_name, address, postal_code, ct.city, co.country
FROM customer as c
LEFT JOIN address as a
USING(address_id)
LEFT JOIN city AS ct
on a.city_id = ct.city_id
LEFT JOIN country as co
on ct.country_id = co.country_id;

