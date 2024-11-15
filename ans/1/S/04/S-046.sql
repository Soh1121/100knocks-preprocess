SELECT
    customer_id,
    TO_DATE(application_date, 'yyyymmdd') AS application_date
FROM
    customer
LIMIT
    10
;
