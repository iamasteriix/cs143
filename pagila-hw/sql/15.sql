/*
 * Use a JOIN to count the number of English language films in each category.
 * Use table category, film_category, film, and language.
 */

SELECT
    category.name,
    count(language_id) AS "sum"
FROM
    language
    JOIN film USING (language_id)
    JOIN film_category USING (film_id)
    JOIN category USING (category_id)
WHERE language.name='English'
GROUP BY category.name;
