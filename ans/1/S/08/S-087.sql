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

SELECT
    customer_count,
    unique_customer_count,
    customer_count - unique_customer_count AS diff
FROM
    (
        SELECT
            COUNT(1) AS customer_count
        FROM
            customer
    ) AS customer
CROSS JOIN
    (
        SELECT
            COUNT(1) AS unique_customer_count
        FROM
            unique_customer
    ) AS unique_customer
;
