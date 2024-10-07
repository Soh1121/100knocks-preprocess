SELECT
    customer_id,
    max(sales_ymd) AS newest,
    min(sales_ymd) AS oldest
FROM
    receipt
GROUP BY
    customer_id
HAVING
    max(sales_ymd) <> min(sales_ymd)
ORDER BY
    customer_id
LIMIT
    10
;
