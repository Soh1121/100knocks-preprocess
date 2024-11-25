WITH sales_amount AS (
    SELECT
        customer_id,
        SUM(amount) AS sum_amount
    FROM
        receipt
    GROUP BY
        customer_id
),
sales_percentage AS (
    SELECT
        PERCENTILE_CONT(0.25) WITHIN GROUP ( ORDER BY sum_amount ) AS percent_25,
        PERCENTILE_CONT(0.5) WITHIN GROUP ( ORDER BY sum_amount ) AS percent_50,
        PERCENTILE_CONT(0.75) WITHIN GROUP ( ORDER BY sum_amount ) AS percent_75
    FROM
        sales_amount
)
SELECT
    customer_id,
    sum_amount,
    CASE
        WHEN a.sum_amount < p.percent_25 THEN 1
        WHEN p.percent_25 <= a.sum_amount AND a.sum_amount < p.percent_50 THEN 2
        WHEN p.percent_50 <= a.sum_amount AND a.sum_amount < p.percent_75 THEN 3
        WHEN p.percent_75 <= a.sum_amount THEN 4
    END AS percent_group
FROM
    sales_amount AS a
CROSS JOIN
    sales_percentage AS p
LIMIT
    10
;

