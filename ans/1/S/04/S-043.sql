WITH gender_era_amount AS (
    SELECT
        TRUNC(age / 10) * 10 AS era,
        c.gender_cd AS gender,
        SUM(r.amount) AS amount
    FROM
        customer AS c
    JOIN
        receipt AS r
    ON
        c.customer_id = r.customer_id
    GROUP BY
        c.customer_id
)
SELECT
    era,
    SUM(CASE WHEN gender = '0' THEN amount END) AS male,
    SUM(CASE WHEN gender = '1' THEN amount END) AS female,
    SUM(CASE WHEN gender = '9' THEN amount END) AS unknown
FROM
    gender_era_amount
GROUP BY
    era
ORDER BY
    era
;
