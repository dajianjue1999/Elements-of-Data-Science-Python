Use sakila;

SELECT 
MAX(customer_id) from customer;

SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id = 599;

SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id = (SELECT MAX(customer_id) FROM customer);


SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
SELECT actor_id
FROM film_actor
WHERE film_id IN (
SELECT film_id
FROM film
WHERE lower(title) =
lower('Alone Trip')));

SELECT film_id, title
FROM film
WHERE lower(title) =
lower('Alone Trip');

SELECT actor_id
FROM film_actor
WHERE film_id IN (
SELECT film_id
FROM film
WHERE lower(title) =
lower('Alone Trip'));

SELECT A.*, B.sales
FROM (SELECT sto.store_id, cit.city, cou.country
FROM store sto
LEFT JOIN address adr
ON sto.address_id = adr.address_id
JOIN city cit
ON adr.city_id = cit.city_id
JOIN country cou
ON cit.country_id = cou.country_id
) AS A
JOIN (SELECT cus.store_id,
sum(pay.amount) sales
FROM customer cus
JOIN payment pay
ON pay.customer_id = cus.customer_id
GROUP BY cus.store_id
) AS B
ON A.store_id = B.store_id
ORDER BY a.store_id;

SELECT sto.store_id, cit.city, cou.country
FROM store sto
LEFT JOIN address adr
ON sto.address_id = adr.address_id
JOIN city cit #don't see join specified, it's an inner join
ON adr.city_id = cit.city_id
JOIN country cou
ON cit.country_id = cou.country_id;

SELECT cat.name category_name,
sum( IFNULL(pay.amount, 0) ) revenue
FROM category cat
LEFT JOIN film_category flm_cat
ON cat.category_id = flm_cat.category_id
LEFT JOIN film fil
ON flm_cat.film_id = fil.film_id
LEFT JOIN inventory inv
ON fil.film_id = inv.film_id
LEFT JOIN rental ren
ON inv.inventory_id = ren.inventory_id
LEFT JOIN payment pay
ON ren.rental_id = pay.rental_id
GROUP BY cat.name
ORDER BY revenue desc
LIMIT 5;

CREATE VIEW top_five_genres AS
SELECT cat.name category_name,
sum( IFNULL(pay.amount, 0) ) revenue
FROM category cat
LEFT JOIN film_category flm_cat
ON cat.category_id = flm_cat.category_id
LEFT JOIN film fil
ON flm_cat.film_id = fil.film_id
LEFT JOIN inventory inv
ON fil.film_id = inv.film_id
LEFT JOIN rental ren
ON inv.inventory_id = ren.inventory_id
LEFT JOIN payment pay
ON ren.rental_id = pay.rental_id
GROUP BY cat.name
ORDER BY revenue desc
LIMIT 5;

SELECT * FROM top_five_genres