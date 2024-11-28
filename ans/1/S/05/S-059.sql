WITH customer_amount AS (
    SELECT
        customer_id,
        SUM(amount) AS amount
    FROM
        receipt
    WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
        customer_id
),
standard_amount AS (
    SELECT
        AVG(amount) AS avg,
        STDDEV(amount) AS stddev
    FROM
        customer_amount
)
SELECT
    c.customer_id,
    c.amount,
    (amount - s.avg) / s.stddev AS standardized
FROM
    customer_amount AS c
CROSS JOIN
    standard_amount AS s
LIMIT
    10
;
