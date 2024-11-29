SELECT
    customer_id,
    SUM(amount) AS sum_amount,
    LN(SUM(amount)) AS log
FROM
    receipt
WHERE
    customer_id NOT LIKE 'Z%'
GROUP BY
    customer_id
LIMIT
    10
;
