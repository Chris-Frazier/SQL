USE Sakila;


-- 8a. In your new role as an executive, --
-- you would like to have an easy way of viewing the Top five genres by gross --
-- revenue. Use the solution from the problem above to create a view. --
-- If you haven't solved 7h, you can substitute another query to create a view. --

CREATE VIEW Customer_Payment AS
SELECT customer.first_name, customer.last_name, SUM(payment.amount) AS 'Total Paid'
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.last_name
ORDER BY customer.last_name;

-- 8b. How would you display the view that you created in 8a? -- 
SELECT *
FROM Customer_Payment;

-- 8c. You find that you no longer need the view top_five_genres. --
-- Write a query to delete it. --

DROP VIEW Customer_Payment;