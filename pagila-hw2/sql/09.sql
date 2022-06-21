/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT
    special_features,
    count(special_features)
FROM (
    SELECT
        title,
        unnest(special_features) AS special_features
    FROM film) t
GROUP BY special_features
ORDER BY  special_features;
