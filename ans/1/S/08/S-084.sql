DROP TABLE IF EXISTS sales_rates;

CREATE TABLE sales_rates AS (
    WITH sales_amount_2019 AS (
        SELECT
            customer_id,
            SUM(amount) AS sum_amount_2019
        FROM
            receipt
        WHERE
            sales_ymd BETWEEN '20190101' AND '20191231'
        GROUP BY
            customer_id
    ),
    sales_amount_all AS (
        SELECT
            customer_id,
            SUM(amount) AS sum_amount
        FROM
            receipt
        GROUP BY
            customer_id
    )
    SELECT
        a.customer_id,
        COALESCE(a_2019.sum_amount_2019, 0) AS sales_amount_2019,
        COALESCE(a.sum_amount, 0) AS sales_amount_all,
        CASE COALESCE(a.sum_amount, 0)
            WHEN 0 THEN 0
            ELSE COALESCE(a_2019.sum_amount_2019, 0) * 1.0 / a.sum_amount
        END AS sales_rate
    FROM
        customer AS c
    JOIN
        sales_amount_2019 AS a_2019
    ON
        c.customer_id = a_2019.customer_id
    JOIN
        sales_amount_all AS a
    ON
        c.customer_id = a.customer_id
)
;

SELECT
    *
FROM
    sales_rates
WHERE
    sales_rate > 0
LIMIT
    10
;

SELECT
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS customer_id,
    SUM(CASE WHEN sales_amount_2019 IS NULL THEN 1 ELSE 0 END) AS sales_amount_2019,
    SUM(CASE WHEN sales_amount_all IS NULL THEN 1 ELSE 0 END) AS sales_amount_all,
    SUM(CASE WHEN sales_rate IS NULL THEN 1 ELSE 0 END) AS sales_rate
FROM
    sales_rates
;
