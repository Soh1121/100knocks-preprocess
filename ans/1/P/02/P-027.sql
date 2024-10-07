SELECT
    store_cd,
    avg(amount) as avg
FROM
    receipt
GROUP BY
    store_cd
ORDER BY
    avg DESC
LIMIT
    5
;
