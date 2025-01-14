DROP TABLE IF EXISTS customer_std;

CREATE TABLE customer_std AS (
    SELECT
        customer_id,
        customer_name,
        gender_cd,
        birth_day,
        age,
        postal_cd,
        address,
        application_store_cd,
        application_date,
        status_cd
    FROM
        customer
);

DROP TABLE IF EXISTS gender_std;

CREATE TABLE gender_std AS (
    SELECT DISTINCT
        gender_cd,
        gender
    FROM
        customer
);

SELECT
    *
FROM
    customer_std
LIMIT
    3
;

SELECT
    *
FROM
    gender_std
LIMIT
    3
;
