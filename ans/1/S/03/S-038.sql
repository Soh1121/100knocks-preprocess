WITH customer_amount AS (
    SELECT
        customer_id,
        SUM(amount) AS sum_amount
    FROM
        receipt
    GROUP BY
        customer_id
),
customer_data AS (
    SELECT
        customer_id
    FROM
        customer
    WHERE
        gender_cd = '1'
        AND customer_id NOT LIKE 'Z%'
)
SELECT
    d.customer_id,
    COALESCE(a.sum_amount, 0)
FROM
    customer_data AS d
LEFT JOIN
    customer_amount AS a
ON
    d.customer_id = a.customer_id
LIMIT
    10
;
