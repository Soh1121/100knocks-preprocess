SELECT
    customer_id,
    birth_day,
    gender_cd || TO_CHAR(LEAST(TRUNC(age / 10) * 10, 60), 'FM00') AS code
FROM
    customer
GROUP BY
    customer_id, birth_day
LIMIT
    10
;
