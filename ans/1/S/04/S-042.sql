WITH sales_amount_by_date AS (
    SELECT
        sales_ymd,
        SUM(amount) AS sum_amount
    FROM
        receipt
    GROUP BY
        sales_ymd
),
sales_amount_by_date_with_lag AS (
    SELECT
        sales_ymd,
        sum_amount,
        LAG(sales_ymd, 1) OVER (ORDER BY sales_ymd) AS lag_ymd_1,
        LAG(sum_amount, 1) OVER (ORDER BY sales_ymd) AS lag_amount_1,
        LAG(sales_ymd, 2) OVER (ORDER BY sales_ymd) AS lag_ymd_2,
        LAG(sum_amount, 2) OVER (ORDER BY sales_ymd) AS lag_amount_2,
        LAG(sales_ymd, 3) OVER (ORDER BY sales_ymd) AS lag_ymd_3,
        LAG(sum_amount, 3) OVER (ORDER BY sales_ymd) AS lag_amount_3
    FROM
        sales_amount_by_date
)
SELECT
    *
FROM
    sales_amount_by_date_with_lag
WHERE
    lag_amount_3 IS NOT NULL
LIMIT
    10
;
