SELECT
    customer_id,
    SUM(amount) AS sum_amount,
    CASE
        WHEN SUM(amount) <= 2000 THEN 0
        ELSE 1
    END AS salse_flag
FROM
    receipt
WHERE
    customer_id NOT LIKE 'Z%'
GROUP BY
    customer_id
LIMIT
    10
;
