USE Sakila;

-- 1a.  Display the first and last names of all actors from the table actor  --
SELECT first_name, last_name
FROM actor;

-- 1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name--
CREATE TABLE Actor_Name (
	Actor_Name VARCHAR(30) NOT NULL,
);

SELECT first_name, last_name
INTO Actor_Name  
FROM actor;

