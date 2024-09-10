SELECT
    *
FROM
    store
WHERE
    tel_no ~ '^[0-9]{3}-[0-9]{3}-[0-9]{4}$'
;
