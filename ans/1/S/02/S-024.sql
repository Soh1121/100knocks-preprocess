SELECT
    customer_id,
    MAX(sales_ymd)
FROM
    receipt
GROUP BY
    customer_id
LIMIT
    10
;
