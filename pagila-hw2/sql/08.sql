/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT title
FROM (
    SELECT
        title,
        rating,
        unnest(special_features) AS features
    FROM film) t
WHERE rating='G' AND features='Trailers'
ORDER BY title;
