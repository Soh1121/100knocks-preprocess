SELECT
    current.sales_ymd AS sales_ymd,
    current.total_amount AS amount,
    current.prev_sales_ymd AS lag_ymd,
    prev.total_amount AS lag_amount,
    current.total_amount - prev.total_amount AS diff_amount
FROM (
    SELECT
        sales_ymd,
        SUM(amount)                              AS total_amount,
        LAG(sales_ymd) OVER (ORDER BY sales_ymd) AS prev_sales_ymd
    FROM receipt
    GROUP BY sales_ymd
) current
LEFT JOIN (
    SELECT
        sales_ymd,
        SUM(amount) AS total_amount
    FROM
        receipt
    GROUP BY
        sales_ymd
) prev ON current.prev_sales_ymd = prev.sales_ymd
ORDER BY current.sales_ymd
;
