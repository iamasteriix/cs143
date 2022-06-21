/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */

SELECT
    country.country,
    sum(payment.amount) AS "total_payments"
FROM payment
JOIN customer USING (customer_id)
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
GROUP BY country.country
ORDER BY total_payments DESC, country.country;
