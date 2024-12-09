WITH random_tbl AS (
    SELECT
        *,
        ROW_NUMBER() OVER (ORDER BY RANDOM()) AS row,
        COUNT(*) OVER () AS count
    FROM
        customer
)
SELECT
    customer_id,
    customer_name,
    gender_cd,
    gender,
    birth_day,
    age,
    postal_cd,
    address,
    application_store_cd,
    application_date,
    status_cd
FROM
    random_tbl
WHERE
    row / count <= 0.01
LIMIT
    10
;
