SELECT
    *
FROM
    customer
WHERE
    status_cd ~ '^[A-F].*[1-9]$'
LIMIT
    10
;
