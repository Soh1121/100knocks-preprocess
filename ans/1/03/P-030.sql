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
    SUM((avg - amount)^2 / count) AS dispersion
FROM
    AVG
GROUP BY
    store_cd
ORDER BY
    dispersion DESC
LIMIT
    5
;
