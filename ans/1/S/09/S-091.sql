SELECT
    SETSEED(0.1)
;

CREATE TEMP TABLE IF NOT EXISTS down_sampling AS (
    WITH pre_table_1 AS (
        SELECT
            c.*,
            COALESCE(r.sum_amount, 0) AS sum_amount
        FROM
            customer AS c
        LEFT JOIN (
            SELECT
                customer_id,
                SUM(amount) AS sum_amount
            FROM
                receipt
            GROUP BY
                customer_id
        ) AS r
        USING(customer_id)
    ),
    pre_table_2 AS (
        SELECT
            *,
            CASE WHEN sum_amount > 0 THEN 1 ELSE 0 END AS is_buy_flag,
            CASE WHEN sum_amount = 0 THEN 1 ELSE 0 END AS is_not_buy_flag
        FROM
            pre_table_1
    ),
    pre_table_3 AS (
        SELECT
            *,
            ROW_NUMBER() OVER (PARTITION BY is_buy_flag ORDER BY RANDOM()) AS row
        FROM
            pre_table_2
        CROSS JOIN (
            SELECT
                SUM(is_buy_flag) AS buying
            FROM
                pre_table_2
        ) AS t1
        CROSS JOIN (
            SELECT
                SUM(is_not_buy_flag) AS not_buying
            FROM
                pre_table_2
        ) AS t2
    )
    SELECT
        *
    FROM
        pre_table_3
    WHERE
        row <= buying
        AND row <= not_buying
);

SELECT
    is_buy_flag,
    COUNT(1)
FROM
    down_sampling
GROUP BY
    is_buy_flag
;
