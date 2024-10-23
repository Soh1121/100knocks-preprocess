SELECT
    store_cd,
    sum(amount) AS amount,
    sum(quantity) AS quantity
FROM
    receipt
GROUP BY
    store_cd
;
