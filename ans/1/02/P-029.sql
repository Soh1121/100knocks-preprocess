WITH count AS (
    SELECT
        store_cd,
        product_cd,
        count(*) AS frequency,
        row_number() OVER (PARTITION BY store_cd ORDER BY count(*) DESC) as rank
    FROM
        receipt
    GROUP BY
        store_cd, product_cd
)
SELECT
    store_cd, product_cd, frequency
FROM
    count
WHERE
    rank = 1
LIMIT
    10
;
