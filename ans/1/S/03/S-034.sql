WITH per_customer AS (
    SELECT
        customer_id,
        SUM(amount) as amount_sum
    FROM
        receipt
    WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
        customer_id
)
SELECT
    AVG(amount_sum)
FROM
    per_customer
;
