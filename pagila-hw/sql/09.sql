/*
 * Use a JOIN to display the total amount rung up by each staff member in January of 2020.
 * Use tables staff and payment.
 */

SELECT
    first_name,
    last_name,
    sum(amount) AS "sum"
FROM
    staff
    JOIN payment
    USING (staff_id)
WHERE
    payment.payment_date >= '2020-01-01 00:00:00'
    AND payment.payment_date < '2020-02-01 00:00:00'
GROUP BY
    staff.first_name,
    staff.last_name;
