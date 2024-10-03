WITH sales_days AS (
    SELECT
        customer_id,
        count(DISTINCT sales_ymd) AS sales_day
    FROM
        receipt
    WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
        customer_id
    ORDER BY
        sales_day DESC
    LIMIT
        20
), sales_sum AS (
    SELECT
        customer_id,
        sum(amount) AS sum
    FROM
        receipt
        WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
        customer_id
    ORDER BY
        sum(amount) DESC
    LIMIT
        20
)
SELECT
    COALESCE(sales_days.customer_id, sales_sum.customer_id) AS customer_id,
    sales_days.sales_day,
    sales_sum.sum
FROM
    sales_days
FULL OUTER JOIN
    sales_sum
ON sales_sum.customer_id = sales_days.customer_id
ORDER BY
    sales_day DESC NULLS LAST, sum DESC
;
