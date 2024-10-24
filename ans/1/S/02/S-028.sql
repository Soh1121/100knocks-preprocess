SELECT
    store_cd,
    PERCENTILE_CONT(0.5) WITHIN GROUP ( ORDER BY amount ) AS median
FROM
    receipt
GROUP BY
    store_cd
ORDER BY
    median DESC
LIMIT
    5
;
