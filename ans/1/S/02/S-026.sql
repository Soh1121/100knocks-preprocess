SELECT
    customer_id,
    MAX(sales_ymd),
    MIN(sales_ymd)
FROM
    receipt
GROUP BY
    customer_id
HAVING
    MAX(sales_ymd) != MIN(sales_ymd)
LIMIT
    10
;
