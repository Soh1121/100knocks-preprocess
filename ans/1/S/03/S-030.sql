SELECT
    store_cd,
    VAR_POP(amount) AS variance
FROM
    receipt
GROUP BY
    store_cd
ORDER BY
    variance DESC
LIMIT
    5
;
