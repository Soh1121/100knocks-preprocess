SELECT
    customer_id,
    birth_day,
    LEAST(TRUNC(age / 10) * 10, 60) AS era
FROM
    customer
GROUP BY
    customer_id, birth_day
LIMIT
    10
;
