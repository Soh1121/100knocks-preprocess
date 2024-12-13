WITH customer_amount AS (
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
    customer_amount
CROSS JOIN (
    SELECT
        PERCENTILE_CONT(0.25) WITHIN GROUP ( ORDER BY sum_amount ) AS amount_25,
        PERCENTILE_CONT(0.75) WITHIN GROUP ( ORDER BY sum_amount ) AS amount_75
    FROM
        customer_amount
) stats_amount
WHERE
    sum_amount < amount_25 - (amount_75 - amount_25) * 1.5
    OR amount_75 + (amount_75 - amount_25) * 1.5 < sum_amount
LIMIT
    10
;
