SELECT
    customer_id, amount, RANK() OVER (ORDER BY amount DESC) AS rank
FROM
    receipt
LIMIT
    10
;
