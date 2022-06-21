/*
 * Compute the country with the most customers in it. 
 */

SELECT country
FROM country
JOIN city USING (country_id)
JOIN address USING (city_id)
JOIN customer USING (address_id)
GROUP BY country.country
HAVING count(customer_id) = (
    SELECT max(count_customers)
    FROM (
        SELECT count(customer_id) AS count_customers
        FROM customer
        JOIN address USING (address_id)
        JOIN city USING (city_id)
        JOIN country USING (country_id)
        GROUP BY country.country) t
);
