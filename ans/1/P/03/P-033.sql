SELECT
    store_cd,
    AVG(amount) as avg
FROM
    receipt
GROUP BY
    store_cd
HAVING
    330 <= AVG(amount)
ORDER BY
    store_cd
;
