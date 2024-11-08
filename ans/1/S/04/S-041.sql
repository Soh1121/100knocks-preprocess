WITH sales_amount_by_date AS (
    SELECT
        sales_ymd,
        SUM(amount) as sum_amount
    FROM
        receipt
    GROUP BY
        sales_ymd
),
sales_amount_by_date_lag AS (
    SELECT
        sales_ymd,
        LAG(sales_ymd) OVER (ORDER BY sales_ymd) AS lag_ymd,
        sum_amount,
        LAG(sum_amount) OVER (ORDER BY sales_ymd) AS lag_amount
    FROM
        sales_amount_by_date
)
SELECT
    sales_ymd,
    sum_amount,
    lag_ymd,
    lag_amount,
    sum_amount - lag_amount AS diff
FROM
    sales_amount_by_date_lag
LIMIT
    10
;
