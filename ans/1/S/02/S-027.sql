SELECT
    store_cd,
    AVG(amount) AS avg
FROM
    receipt
GROUP BY
    store_cd
ORDER BY
    avg DESC
LIMIT
    5
;
