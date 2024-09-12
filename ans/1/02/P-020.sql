SELECT
    customer_id, amount, ROW_NUMBER() OVER (ORDER BY amount DESC) AS rank
FROM
    receipt
LIMIT
    10
;
