WITH product_count AS (
    SELECT
        store_cd,
        product_cd,
        COUNT(1) AS count
    FROM
        receipt
    GROUP BY store_cd, product_cd
),
product_mode AS (
    SELECT
        store_cd,
        product_cd,
        count AS mode,
        RANK() OVER (PARTITION BY store_cd ORDER BY count DESC) AS rank
    FROM
        product_count
)
SELECT
    store_cd,
    product_cd,
    mode
FROM
    product_mode
WHERE
    rank = 1
LIMIT
    10
;
