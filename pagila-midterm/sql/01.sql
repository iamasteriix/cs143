/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 * List the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */


SELECT DISTINCT film.title
FROM actor
JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN customer USING (customer_id)
WHERE
    film.title NOT LIKE '%F%'
    AND actor.first_name || ' ' || actor.last_name NOT LIKE '%F%'
    AND customer.first_name || ' ' || customer.last_name NOT LIKE '%F%'
ORDER BY film.title;
