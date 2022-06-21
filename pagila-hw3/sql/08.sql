/*
 * The film 'BUCKET BROTHERHOOD' is your favorite movie, but you're tired of watching it.
 * You want to find something new to watch that is still similar to 'BUCKET BROTHERHOOD'.
 * To find a similar movie, you decide to search the history of movies that other people have rented.
 * Your idea is that if a lot of people have rented both 'BUCKET BROTHERHOOD' and movie X,
 * then movie X must be similar and something you'd like to watch too.
 * Your goal is to create a SQL query that finds movie X.
 * Specifically, write a SQL query that returns all films that have been rented by at least 3 customers who have also rented 'BUCKET BROTHERHOOD'.
 *
 * HINT:
 * This query is very similar to the query from problem 06,
 * but you will have to use joins to connect the rental table to the film table.
 *
 * HINT:
 * If your query is *almost* getting the same results as mine, but off by 1-2 entries, ensure that:
 * 1. You are not including 'BUCKET BROTHERHOOD' in the output.
 * 2. Some customers have rented movies multiple times.
 *    Ensure that you are not counting a customer that has rented a movie twice as 2 separate customers renting the movie.
 *    I did this by using the SELECT DISTINCT clause.
 */

SELECT title
FROM (
    SELECT
        title,
        count(DISTINCT c.customer_id) AS "customer count"
        FROM film
        JOIN inventory USING (film_id)
        JOIN rental USING (inventory_id)
        JOIN customer c USING (customer_id)
        WHERE c.customer_id IN (
            SELECT customer_id
            FROM customer
            JOIN rental USING (customer_id)
            JOIN inventory USING (inventory_id)
            JOIN film f USING (film_id)
            WHERE f.title = 'BUCKET BROTHERHOOD'
        )
        GROUP BY title
    ) t
    WHERE "customer count" > 2 AND title != 'BUCKET BROTHERHOOD'
    ORDER BY title;
