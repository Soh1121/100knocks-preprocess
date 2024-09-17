SELECT
    store_cd,
    sum(amount) AS amount_sum,
    sum(quantity) AS quantity_sum
FROM
    receipt
GROUP BY store_cd
ORDER BY store_cd
;
