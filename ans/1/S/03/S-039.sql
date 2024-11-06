WITH sales_days AS (
    SELECT
        customer_id,
        COUNT(DISTINCT sales_ymd) AS count
    FROM
        receipt
    WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
        customer_id
    ORDER BY
        count DESC
    LIMIT
        20
),
sales_amount AS (
    SELECT
        customer_id,
        SUM(amount) AS amount
    FROM
        receipt
    WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
        customer_id
    ORDER BY
        amount DESC
    LIMIT
        20
)
SELECT
    COALESCE(d.customer_id, a.customer_id),
    count,
    amount
FROM
    sales_days AS d
FULL OUTER JOIN
    sales_amount AS a
ON
    d.customer_id = a.customer_id
;
