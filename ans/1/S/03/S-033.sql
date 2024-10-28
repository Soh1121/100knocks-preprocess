SELECT
    store_cd,
    AVG(amount) AS avg
FROM
    receipt
GROUP BY
    store_cd
HAVING
    AVG(amount) >= 330
;
