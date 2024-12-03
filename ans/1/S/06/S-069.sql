WITH customer_amount AS (
    SELECT
        customer_id,
        SUM(amount) AS sum_amount
    FROM
        receipt
    GROUP BY
        customer_id
),
cans_amount AS (
    SELECT
        customer_id,
        SUM(amount) AS sum_07
    FROM
        receipt AS r
    JOIN
        product AS p
        ON r.product_cd = p.product_cd
    WHERE
        p.category_major_cd = '07'
    GROUP BY
        customer_id
)
SELECT
    cu.customer_id AS customer_id,
    cu.sum_amount AS sum_amount,
    ca.sum_07 AS sum_07,
    ca.sum_07 * 1.0 / cu.sum_amount AS rate
FROM
    customer_amount AS cu
JOIN
    cans_amount AS ca
    ON cu.customer_id = ca.customer_id
LIMIT
    10
;
