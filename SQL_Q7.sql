USE Sakila;

-- 7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. --
-- As an unintended consequence, films starting with the letters K and Q have also --
-- soared in popularity. Use subqueries to display the titles of movies starting --
-- with the letters K and Q whose language is English. --

SELECT title
FROM film
WHERE title LIKE 'K%' OR 'Q%' IN
	(SELECT title
	FROM film
	WHERE language_id =
		(SELECT language_id 
		FROM language
		WHERE name = 'English'
	)
    );

-- 7b. Use subqueries to display all actors who appear in the film Alone Trip. --

SELECT first_name, last_name
FROM actor
WHERE actor_id IN
	(SELECT actor_id
	FROM film_actor
	WHERE film_id = 
		(SELECT film_id
		FROM film
		WHERE title = 'Alone Trip'
)
);
-- 7c. You want to run an email marketing campaign in Canada, for which you will -- 
-- need the names and email addresses of all Canadian customers. --
-- Use joins to retrieve this information. --

SELECT first_name, last_name, email
FROM customer
WHERE address_id IN
	(SELECT address_id
	FROM address
	WHERE city_id IN
		(SELECT city_id
		FROM city
		WHERE country_id =
			(SELECT country_id
			FROM country
			WHERE country = 'Canada'
			)
			)
			);
-- 7d. Sales have been lagging among young families, and you wish to target all --
-- family movies for a promotion. Identify all movies categorized as family films. --

SELECT title 
FROM film
WHERE film_id In
	(SELECT film_id
	FROM film_category
	WHERE category_id =
		(SELECT category_id
		FROM  category
		WHERE name = 'family'
		)
		); 

-- 7e. Display the most frequently rented movies in descending order. --

SELECT title, rental_rate 
FROM film
ORDER BY rental_rate DESC;

-- 7f. Write a query to display how much business, in dollars, each store brought in. --

SELECT staff_id as 'Store', SUM(amount) as 'Business ($)'
FROM payment
GROUP BY staff_id;

-- 7g. Write a query to display for each store its store ID, city, and country. --
SELECT country
FROM country
WHERE country_id IN
	(SELECT country_id
	FROM city
	WHERE city_id IN
		(SELECT city_id
		FROM address
		WHERE address_id IN
			(SELECT address_id
			FROM store
			)
			)
			);

-- 7h. List the top five genres in gross revenue in descending order. 
-- (Hint: you may need to use the following tables: category, film_category, 
-- inventory, payment, and rental.) --

SELECT inventory.film_id 
FROM inventory
JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE inventory.inventory_id IN 
(SELECT rental.inventory_id, SUM(payment.amount)
FROM rental
JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY inventory_id
);
 
 SELECT inventory.film_id, rental.inventory_id, SUM(payment.amount), 
 FROM rental, payment, inventory
 WHERE rental.rental_id = payment.rental_id AND rental.inventory_id = inventory.inventory_id
 GROUP BY inventory_id, film_id;
 