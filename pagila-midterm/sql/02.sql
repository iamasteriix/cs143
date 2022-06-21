/*
 * Count the number of distinct customers who have rented a movie that 'RUSSELL BACALL' has acted in.
 *
 * NOTE:
 * You cannot hard-code Russell Bacall's actor_id.
 * You're where clause must include a condition using the "first_name" and "last_name" fields of the "actor" table.
 */


SELECT count (DISTINCT customer_id)
FROM customer
JOIN rental USING (customer_id)
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
JOIN film_actor USING (film_id)
JOIN actor USING (actor_id)
WHERE actor.first_name || ' ' || actor.last_name = 'RUSSELL BACALL';
