SELECT
    sales_ymd,
    customer_id,
    product_cd,
    amount
FROM
    receipt
WHERE
    customer_id = 'CS018205000001'
    AND product_cd != 'P071401019'
;
