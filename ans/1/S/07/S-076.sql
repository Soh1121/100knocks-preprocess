WITH customer_random AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY gender_cd ORDER BY RANDOM()) AS random,
        COUNT(*) OVER (PARTITION BY gender_cd) AS count
    FROM
        customer
)
SELECT
    gender_cd,
    COUNT(1) AS customer_num
FROM
    customer_random
WHERE
    random <= count * 0.1
GROUP BY
    gender_cd
;
