WITH salse_summary AS (
    SELECT
        sales_ymd,
        SUM(amount) AS total_amount
    FROM
        receipt
    GROUP BY
        sales_ymd
),
ranked_sales AS (
    SELECT
        sales_ymd,
        total_amount,
        ROW_NUMBER() OVER (ORDER BY sales_ymd) AS rn
    FROM
        salse_summary
)
SELECT
    current.sales_ymd,
    current.total_amount,
    previous.sales_ymd,
    previous.total_amount
FROM
    ranked_sales AS current
JOIN
    ranked_sales AS previous
ON
    previous.rn < current.rn
    AND previous.rn >= current.rn - 3
ORDER BY
    current.sales_ymd
LIMIT
    10
;
