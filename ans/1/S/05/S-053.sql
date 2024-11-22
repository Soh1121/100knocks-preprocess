WITH postal_flags AS (
    SELECT customer_id,
         CASE
             WHEN CAST(SUBSTR(postal_cd, 1, 3) AS INTEGER) BETWEEN 100 AND 209 THEN 1
             ELSE 0
         END AS postal_cd_flag
    FROM customer
),
salse_customer AS (
    SELECT
        DISTINCT customer_id
    FROM
        receipt
)
SELECT
    p.postal_cd_flag,
    COUNT(DISTINCT s.customer_id)
FROM
    postal_flags AS p
JOIN
    salse_customer AS s ON p.customer_id = s.customer_id
GROUP BY
    p.postal_cd_flag
;
