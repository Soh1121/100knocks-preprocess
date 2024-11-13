SELECT
    customer_id,
    TO_CHAR(birth_day, 'yyyymmdd') AS birth_day
FROM
    customer
LIMIT
    10
;
