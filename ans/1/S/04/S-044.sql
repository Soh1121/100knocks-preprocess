SELECT
    TRUNC(c.age / 10) * 10 AS era,
    CASE c.gender_cd
        WHEN '0' THEN '00'
        WHEN '1' THEN '01'
        WHEN '9' THEN '99'
    END AS gender_cd,
    SUM(amount) as amount
FROM
    receipt AS r
JOIN
    customer AS c
ON
    r.customer_id = c.customer_id
GROUP BY
    era, gender_cd
ORDER BY gender_cd, era
;
