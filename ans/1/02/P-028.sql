WITH RankedSales AS (
    SELECT
        store_cd,
        amount,
        row_number() OVER (PARTITION BY store_cd ORDER BY amount) AS row_num,
        count(*) OVER (PARTITION BY store_cd) AS total_rows
    FROM
        receipt
)
, MedianValues AS (
    SELECT
        store_cd,
        CASE
            WHEN total_rows % 2 = 1 THEN
                max(CASE WHEN row_num = (total_rows + 1) / 2 THEN amount END)
            ELSE
                AVG(CASE WHEN row_num IN (total_rows / 2, total_rows / 2 + 1) THEN amount END)
        END AS median
    FROM
        RankedSales
    GROUP BY
        store_cd, total_rows
)
SELECT
    *
FROM
    MedianValues
ORDER BY
    median DESC
LIMIT
    5
;
