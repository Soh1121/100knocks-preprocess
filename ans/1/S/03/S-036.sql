SELECT
    receipt.*,
    store_name
FROM
    receipt
JOIN
    store
ON
    receipt.store_cd = store.store_cd
LIMIT
    10
;
