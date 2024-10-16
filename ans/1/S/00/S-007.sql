SELECT
    sales_ymd,
    customer_id,
    product_cd,
    amount
FROM
    receipt
WHERE
    customer_id = 'CS018205000001'
    AND amount BETWEEN 1000 AND 2000
;
