WITH AVG AS (
    SELECT
        *,
        AVG(amount) OVER (PARTITION BY store_cd) AS avg,
        COUNT(*) OVER (PARTITION BY store_cd) AS count
    FROM
        receipt
)
SELECT
    store_cd,
    SQRT(SUM((avg - amount)^2 / count)) AS sigma
FROM
    AVG
GROUP BY
    store_cd
ORDER BY
    sigma DESC
LIMIT
    5
;
