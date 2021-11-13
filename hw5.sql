/* Homework SQL - QTM 385 */
/* Your name here  DAOYANG E */


/* Question 1: Use the database sakila */
USE Sakila;

/* Question 2: Check the description of table "payment" */
DESC payment;

/* Question 3: Count all the amounts payed in payments
   table that are greater than zero. */
SELECT count(*) 
	FROM payment
    WHERE amount > 0;

/* Question 4: Compute the mean of amounts in the table 
   payments using only values greater than zero. */
SELECT AVG(amount)
	FROM payment
	WHERE amount > 0;

/* Question 5: Show all the variables for film_text for
   the first two movies. */
SELECT *
	FROM film_text
    ORDER BY film_id
    lIMIT 2;

