SELECT
    *
FROM
    customer
WHERE
    status_cd ~ '^[A-F]'
LIMIT
    10
;
