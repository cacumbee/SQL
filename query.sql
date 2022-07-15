-- Select average length of films and order by the average length
SELECT film_id, AVG(length)  AS "avg length" FROM film
GROUP BY film_id
ORDER BY "avg length";

-- Round the results to use only two decimal places
SELECT film_id, ROUND(AVG(length), 2)  AS "avg length" FROM film
GROUP BY film_id
ORDER BY "avg length";

-- Order by descending values
SELECT film_id, ROUND(AVG(length), 2)  AS "avg length" FROM film
GROUP BY film_id
ORDER BY "avg length" DESC;

-- Limit results to 5
SELECT film_id, ROUND(AVG(length), 2)  AS "avg length" FROM film
GROUP BY film_id
ORDER BY "avg length" DESC
LIMIT 5;


-- 1. What is the average cost to rent a film in the pagila stores?
SELECT AVG(rental_rate) AS "Average rental rate"
FROM film;

-- 2. What is the average rental cost of films by rating? On average, what is the cheapest rating of films to rent? Most expensive?
SELECT rating, AVG(rental_rate) AS "Average rental rate"
FROM film
GROUP BY rating;

-- 3. How much would it cost to replace all the films in the database?
SELECT SUM(replacement_cost) AS "Total replacement cost"
FROM film;

-- 4. How much would it cost to replace all the films in each ratings category?
SELECT rating, SUM(replacement_cost) AS "Replacement cost"
FROM film
GROUP BY rating;

-- 5. How long is the longest movie in the database? The shortest?
SELECT MAX(length)
FROM film;

-- Select count of actors first names in descending order
SELECT first_name, COUNT(first_name) AS "actor count"
FROM actor
GROUP BY first_name
ORDER BY "actor count" DESC;

-- Select the average duration of movies by rating
SELECT rating, ROUND(AVG(rental_duration),2) AS "avg duration"
FROM film
GROUP BY rating
ORDER BY "avg duration";

-- Select top ten replace costs for the length of the movie
SELECT length, ROUND(AVG(replacement_cost)) AS "avg cost"
FROM film
GROUP BY length
ORDER BY "avg cost" DESC
LIMIT 10;

-- Select the count of countries
SELECT country.country, COUNT(country.country) AS "country count"
FROM city
JOIN country ON city.country_id = country.country_id
GROUP BY country.country
ORDER BY "country count" DESC;

-- Query 1

SELECT DISTINCT ON (r.customer_id) c.first_name, c.last_name, c.email, r.rental_date 
FROM rental AS r
JOIN customer AS c 
ON (r.customer_id=c.customer_id)
ORDER BY r.customer_id, r.rental_date DESC;


-- Query 2

SELECT DISTINCT ON (f.title ) f.title, r.rental_date
FROM rental AS r
JOIN inventory as i
ON (i.inventory_id = r.inventory_id)
JOIN film as f
ON (f.film_id = i.film_id)
ORDER BY f.title, r.rental_date DESC;

-- Bonus

SELECT film_id, title
FROM film 
WHERE film_id NOT IN
  (SELECT film_id 
   FROM inventory);
