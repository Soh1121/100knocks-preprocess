SELECT
    sales_ymd, customer_id, product_cd, quantity, amount
FROM
    receipt
WHERE
    customer_id = 'CS018205000001'
    AND (amount >= 1000 OR quantity >= 5)
;