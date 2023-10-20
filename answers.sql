-- Problem 1: Select all email addresses from the customers table in alphabetical order.
SELECT email
FROM customers
ORDER BY email;

-- Problem 2: Use a subquery to find all orders placed by Elizabeth Crocker.
SELECT id
FROM orders
WHERE customer_id = (
    SELECT id
    FROM customers
    WHERE fname = 'Elizabeth' AND lname = 'Crocker'
);

-- Problem 3: Write a query to get the total number of cupcakes from unprocessed orders.
SELECT SUM(num_cupcakes)
FROM orders
WHERE processed = 'f';

-- Problem 4: Write a query that shows the name of each cupcake and their total number of orders,
-- sorted in ascending alphabetical order of cupcake name.
SELECT name, SUM(num_cupcakes) AS sum
FROM cupcakes
LEFT JOIN orders
ON cupcakes.id = orders.cupcake_id
GROUP BY name
ORDER BY name;

-- Problem 5: Write a query to show the email address of each customer and the total number of
-- cupcakes they've ordered. Results should be sorted by total number of cupcakes, descending.
SELECT email, SUM(num_cupcakes) AS total
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id
GROUP BY email
ORDER BY SUM(num_cupcakes) DESC;

-- Problem 6: Wrtie a query that shows the first and last name as well as the email for customers
-- who have processed orders of funfetti cupcakes. There should only be one record per customer.
SELECT fname, lname, email
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id
WHERE orders.cupcake_id = 5 AND orders.processed = 't'
GROUP BY fname, lname, email;