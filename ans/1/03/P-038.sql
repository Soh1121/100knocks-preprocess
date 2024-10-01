SELECT
    limited_customer.customer_id,
    CASE
        WHEN sum_amount.amount IS NULL THEN 0
        ELSE sum_amount.amount
    END AS amount
FROM (
    SELECT
        *
    FROM
        customer
    WHERE
        gender_cd = '1'
        AND customer_id NOT LIKE 'Z%'
) AS limited_customer
LEFT JOIN (
    SELECT
        customer_id,
        sum(amount) AS amount
    FROM
        receipt
    GROUP BY
        customer_id
) AS sum_amount
ON
    limited_customer.customer_id = sum_amount.customer_id
;

SELECT
    customer.customer_id,
    CASE
        WHEN sum_amount.amount IS NULL THEN 0
        ELSE sum_amount.amount
    END AS amount
FROM
    customer
LEFT JOIN (
    SELECT
        customer_id,
        sum(amount) AS amount
    FROM
        receipt
    GROUP BY
        customer_id
) AS sum_amount
ON
    customer.customer_id = sum_amount.customer_id
WHERE
    gender_cd = '1'
    AND sum_amount.customer_id NOT LIKE 'Z%'
;
