/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

SELECT title
FROM (
    SELECT title
    FROM (
        SELECT
            title,
            unnest(special_features) AS special_features
        FROM film) t1a
    WHERE special_features='Behind the Scenes') t1
JOIN (
    SELECT
        title,
        features
    FROM (
        SELECT
            title,
            unnest(special_features) AS features
        FROM film) t2a
        WHERE features='Trailers') t2 USING (title)
ORDER BY title;
