SELECT
    store_cd,
    STDDEV_POP(amount) AS std
FROM
    receipt
GROUP BY
    store_cd
ORDER BY
    std DESC
LIMIT
    5
;
