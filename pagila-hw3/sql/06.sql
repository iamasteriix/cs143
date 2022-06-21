/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

SELECT first_name || ' ' || last_name AS "Actor Name"
FROM actor
JOIN film_actor USING (actor_id)
WHERE film_id IN (
    SELECT film_id
    FROM film_actor
    JOIN actor actor_table USING (actor_id)
    WHERE actor_table.first_name || ' ' || actor_table.last_name = 'RUSSELL BACALL'
) AND first_name || ' ' || last_name != 'RUSSELL BACALL'
GROUP BY "Actor Name"
ORDER BY "Actor Name";
