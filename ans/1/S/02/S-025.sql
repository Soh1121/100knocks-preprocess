SELECT
    customer_id,
    MIN(sales_ymd)
FROM
    receipt
GROUP BY
    customer_id
LIMIT
    10
;
