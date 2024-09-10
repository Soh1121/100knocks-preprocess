SELECT
    *
FROM
    customer
WHERE
    status_cd ~ '[1-9]$'
LIMIT
    10
;
