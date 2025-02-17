WITH distinct_receipt AS (
    SELECT DISTINCT
        customer_id,
        sales_ymd
    FROM
        receipt
)
SELECT
    r.customer_id,
    r.sales_ymd,
    c.application_date,
    EXTRACT(
        YEAR FROM AGE(
            TO_TIMESTAMP(CAST(r.sales_ymd AS VARCHAR), 'YYYYMMDD'),
            TO_TIMESTAMP(c.application_date, 'YYYYMMDD')
        )
    ) AS elapsed_years
FROM
    distinct_receipt AS r
JOIN
    customer AS c
ON
    r.customer_id = c.customer_id
LIMIT
    10
;
