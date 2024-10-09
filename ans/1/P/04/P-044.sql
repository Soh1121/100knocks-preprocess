WITH sales_summary AS (
    SELECT
        FLOOR(age / 10) * 10 AS era,
        SUM(CASE WHEN gender_cd = '0' THEN amount ELSE 0 END) AS male_amount,
        SUM(CASE WHEN gender_cd = '1' THEN amount ELSE 0 END) AS female_amount,
        SUM(CASE WHEN gender_cd = '9' THEN amount ELSE 0 END) AS unkown_amount
    FROM
        receipt
    JOIN
        customer
    ON
        receipt.customer_id = customer.customer_id
    GROUP BY
        FLOOR(age / 10) * 10
)
SELECT
    era,
    '00' AS gender_cd,
    male_amount
FROM
    sales_summary
WHERE
    male_amount > 0

UNION ALL

SELECT
    era,
    '01' AS gender_cd,
    female_amount
FROM
    sales_summary
WHERE
    female_amount > 0

UNION ALL

SELECT
    era,
    '99' AS gender_cd,
    sales_summary.unkown_amount
FROM
    sales_summary
WHERE
    sales_summary.unkown_amount > 0

ORDER BY era, gender_cd
;
