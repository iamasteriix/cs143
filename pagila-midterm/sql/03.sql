/*
 * List the titles of all films in the 'Children' category that have a rating of 'R' or 'NC-17'.
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */

SELECT DISTINCT film.title
FROM category
JOIN film_category USING (category_id)
JOIN film USING (film_id)
WHERE
    category.name = 'Children'
    AND (film.rating = 'R' OR film.rating = 'NC-17')
GROUP BY film.title, category.name
ORDER BY title;
