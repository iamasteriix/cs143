/*
 * Count the number of movies rented every day.
 * Use the ROLLUP clause to get subtotals for each month and year.
 *
 * NOTE:
 * SQL is a weird language with a lot of syntactic sugar built-in.
 * This syntactic sugar can seem daunting at first because there is so much of it (far too much to be covered in any class).
 * The purpose of this problem is to help get you comfortable learning this syntactic sugar on your own when you encounter it in the real world.
 *
 * To complete this problem, you should read the textbook's explanation of the ROLLUP clause at <https://www.postgresqltutorial.com/postgresql-rollup/>.
 * The explanation happens to have an example query on the pagila database that solves this problem.
 * (To pass the test cases, however, you'll have to modify the column names and add an ORDER BY clause).
 *
 * It turns out that the ROLLUP clause is syntactic sugar over the CUBE clause, which is syntactic sugar over the GROUPING SETS clause, which is syntactic sugar over the UNION ALL clause.
 * I recommend you skim the tutorials of those clauses just so you have a sense of what they can do:
 * 1. <https://www.postgresqltutorial.com/postgresql-grouping-sets/>
 * 2. <https://www.postgresqltutorial.com/postgresql-cube/>
 */

SELECT
    extract(year FROM rental_date) AS "year",
    extract(month FROM rental_date) AS "month",
    extract(day FROM rental_date) AS "day",
    count(rental_id) AS "count"
FROM rental
GROUP BY rollup("year", "month", "day")
ORDER BY "year", "month", "day";
