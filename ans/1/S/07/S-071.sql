WITH time_age AS (
    SELECT
        c.customer_id,
        r.sales_ymd,
        c.application_date,
        AGE(
            TO_TIMESTAMP(CAST(r.sales_ymd AS VARCHAR), 'YYYYMMDD'),
            TO_TIMESTAMP(c.application_date, 'YYYYMMDD')
        ) AS age
    FROM
        receipt AS r
    JOIN
        customer AS c
    ON
        r.customer_id = c.customer_id
)
SELECT
    customer_id,
    sales_ymd,
    application_date,
    EXTRACT(YEAR FROM age) * 12 + EXTRACT(MONTH FROM age) AS elapsed_months
FROM
    time_age
LIMIT
    10
;
