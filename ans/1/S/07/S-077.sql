WITH customer_amount AS (
    SELECT
        customer_id,
        SUM(amount) AS sum_amount,
        LN(SUM(amount) + 0.5) AS log_sum_amount
    FROM
        receipt
    GROUP BY
        customer_id
),
calc_tbl AS (
    SELECT
        AVG(log_sum_amount) AS avg_log,
        STDDEV_POP(log_sum_amount) AS std_log
    FROM
        customer_amount
)
SELECT
    customer_id,
    sum_amount,
    log_sum_amount
FROM
    customer_amount AS a
CROSS JOIN
    calc_tbl AS c
WHERE
    ABS(log_sum_amount - avg_log) / std_log > 3
;
