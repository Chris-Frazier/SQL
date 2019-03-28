USE Sakila;

-- 4a. List the last names of actors, as well as how many actors have that last name. --

SELECT COUNT(last_name), last_name
FROM actor
GROUP BY last_name;

-- 4b. List last names of actors and the number of actors who have that last name, --
-- but only for names that are shared by at least two actors --

SELECT COUNT(last_name), last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

-- 4c. The actor HARPO WILLIAMS was accidentally entered in the actor table as --
-- GROUCHO WILLIAMS. Write a query to fix the record. --

SELECT actor_id
FROM actor
WHERE first_name = 'GROUCHO' and last_name = 'WILLIAMS';

UPDATE actor
SET first_name = 'HARPO'
WHERE actor_id = '172';

SELECT first_name, last_name
FROM actor
WHERE actor_id = '172';

-- 4d. Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that --
-- GROUCHO was the correct name after all! In a single query, if the first name of -- 
-- the actor is currently HARPO, change it to GROUCHO. --

UPDATE actor
SET first_name = 'GROUCHO'
WHERE actor_id = '172';

SELECT first_name, last_name
FROM actor
WHERE actor_id = '172';