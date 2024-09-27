SELECT
    AVG(sum) AS avg
FROM (
    SELECT
        SUM(amount) AS sum
    FROM
        receipt
    WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
        customer_id
) AS customer_totals
;
