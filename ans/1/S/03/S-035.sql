WITH customer_sum AS (
    SELECT
        customer_id,
        SUM(amount) AS sum_amount
    FROM
        receipt
    WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
        customer_id
)
SELECT
    customer_id,
    sum_amount
FROM
    customer_sum
WHERE
    sum_amount >= (
        SELECT
            AVG(sum_amount)
        FROM
            customer_sum
    )
LIMIT
    10
;
