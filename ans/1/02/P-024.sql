WITH
    ranked_data
AS (
    SELECT
        *,
        row_number() OVER (
            PARTITION BY customer_id
            ORDER BY sales_ymd DESC
        ) AS rank
    FROM
        receipt
)
SELECT
    customer_id, sales_ymd
FROM
    ranked_data
WHERE
    rank = 1
LIMIT
    10
;
