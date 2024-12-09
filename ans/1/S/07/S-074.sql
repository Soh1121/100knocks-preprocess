WITH elapsed_days_tbl AS (
    SELECT
        TO_DATE(CAST(sales_ymd AS VARCHAR), 'YYYYMMDD') AS sales_ymd,
        EXTRACT(DOW FROM
            TO_DATE(CAST(sales_ymd AS VARCHAR), 'YYYYMMDD') - 1
        ) AS elapsed_days
    FROM
        receipt
)
SELECT
    sales_ymd,
    elapsed_days,
    sales_ymd - CAST(elapsed_days AS INTEGER) AS monday
FROM
    elapsed_days_tbl
LIMIT
    10
;
