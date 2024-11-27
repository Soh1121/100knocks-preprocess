SELECT
    customer_id,
    CASE WHEN gender_cd = '0' THEN 1 ELSE 0 END,
    CASE WHEN gender_cd = '1' THEN 1 ELSE 0 END,
    CASE WHEN gender_cd = '9' THEN 1 ELSE 0 END
FROM
    customer
LIMIT
    10
;
