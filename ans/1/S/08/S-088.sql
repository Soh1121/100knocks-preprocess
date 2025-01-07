DROP TABLE IF EXISTS unique_customer;

CREATE TABLE unique_customer AS (
    WITH sales_amount AS (
        SELECT
            customer_id,
            customer_name,
            postal_cd,
            COALESCE(SUM(amount), 0) AS sum_amount
        FROM
            customer
        LEFT JOIN
            receipt
        USING(customer_id)
        GROUP BY
            customer_id, customer_name, postal_cd
    ),
    sales_rank AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY customer_name, postal_cd
                ORDER BY sum_amount DESC, customer_id
            ) AS ranking
        FROM
            sales_amount
    )
    SELECT
        c.*
    FROM
        customer AS c
    JOIN
        sales_rank AS r
    ON
        c.customer_id = r.customer_id
        AND r.ranking = 1
);

DROP TABLE IF EXISTS unique_id_customer;

CREATE TABLE unique_id_customer AS (
    SELECT
        c.*,
        u.customer_id AS integration_id
    FROM
        customer AS c
    JOIN
        unique_customer AS u
    ON
        c.customer_name = u.customer_name
        AND c.postal_cd = u.postal_cd
)
;

SELECT
    unique_id_count,
    integration_id_count,
    unique_id_count - integration_id_count AS diff
FROM (
    SELECT
        COUNT(DISTINCT customer_id) AS unique_id_count
    FROM
        customer
) AS customer
CROSS JOIN (
    SELECT
        COUNT(DISTINCT integration_id) AS integration_id_count
    FROM
        unique_id_customer
) AS unique_id_customer
;
