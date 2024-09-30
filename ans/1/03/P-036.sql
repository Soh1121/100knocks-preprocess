SELECT
    receipt.*,
    store.store_name
FROM
    receipt
INNER JOIN
    store
ON
    receipt.store_cd = store.store_cd
LIMIT
    10
;
