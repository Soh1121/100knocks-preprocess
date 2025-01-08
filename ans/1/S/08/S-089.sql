SELECT
    SETSEED(0.1)
;

DROP TABLE IF EXISTS rand_sales_customer;
CREATE TABLE rand_sales_customer AS (
    SELECT
        customer_id,
        ROW_NUMBER() OVER (ORDER BY RANDOM()) AS row
    FROM
        customer AS c
    JOIN
        receipt AS r
    USING(customer_id)
    GROUP BY
        customer_id
    HAVING
        SUM(r.amount) > 0
);

DROP TABLE IF EXISTS customer_train;
CREATE TABLE customer_train AS (
    SELECT
        c.*
    FROM
        rand_sales_customer AS r
    JOIN
        customer AS c
    USING(customer_id)
    WHERE
        r.row <= (
            SELECT
                COUNT(1)
            FROM
                rand_sales_customer
        ) * 0.8
);

DROP TABLE IF EXISTS customer_test;
CREATE TABLE customer_test AS (
    SELECT
        c.*
    FROM
        rand_sales_customer AS r
    JOIN
        customer AS c
    USING(customer_id)
    EXCEPT
        SELECT
            *
        FROM
            customer_train
);

SELECT
    train_count * 1.0 / all_count AS 学習データ割合,
    test_count * 1.0 / all_count AS テストデータ割合
FROM (
    SELECT
        COUNT(1) AS all_count
    FROM
        rand_sales_customer
 ) AS rand_sales_customer
CROSS JOIN (
    SELECT
        COUNT(1) AS train_count
    FROM
        customer_train
) AS customer_train
CROSS JOIN (
    SELECT
        COUNT(1) AS test_count
    FROM
        customer_test
) AS customer_test
;
