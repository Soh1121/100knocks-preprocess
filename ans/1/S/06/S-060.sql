WITH receipt_customer AS (
    SELECT
        customer_id,
        SUM(amount) AS sum_amount
    FROM
        receipt
    WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
        customer_id
),
minmax AS (
    SELECT
        MIN(sum_amount) AS min,
        MAX(sum_amount) AS max
    FROM
        receipt_customer
)
SELECT
    c.customer_id,
    c.sum_amount,
    1.0 * (c.sum_amount - m.min) / (m.max - m.min) AS normalize
FROM
    receipt_customer AS c
CROSS JOIN
    minmax AS m
LIMIT
    10
;
