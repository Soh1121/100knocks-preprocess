SELECT
    c.customer_id,
    r.sales_ymd,
    c.application_date,
    TO_DATE(CAST(r.sales_ymd AS VARCHAR), 'yyyymmdd') - TO_DATE(c.application_date, 'yyyymmdd') AS elapsed_days
FROM
    receipt AS r
JOIN
    customer AS c
ON
    r.customer_id = c.customer_id
GROUP BY
    c.customer_id, r.sales_ymd
LIMIT
    10
;

WITH receipt_distinct AS (
    SELECT
        DISTINCT customer_id,
        sales_ymd
    FROM
        receipt
)
SELECT
    c.customer_id,
    r.sales_ymd,
    c.application_date,
    EXTRACT(
        DAY FROM (
            TO_TIMESTAMP(CAST(r.sales_ymd AS VARCHAR), 'YYYYMMDD')
            - TO_TIMESTAMP(c.application_date, 'YYYYMMDD')
        )
    ) AS elapsed_days
FROM
    receipt_distinct AS r
JOIN
    customer AS c
ON
    r.customer_id = c.customer_id
LIMIT
    10
;
