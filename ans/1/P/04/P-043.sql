SELECT
    FLOOR(age / 10) * 10 AS 年代,
    SUM(CASE WHEN gender_cd = '0' THEN amount ELSE 0 END) AS 男性の売上,
    SUM(CASE WHEN gender_cd = '1' THEN amount ELSE 0 END) AS 女性の売上,
    SUM(CASE WHEN gender_cd = '9' THEN amount ELSE 0 END) AS 性別不明の売上
FROM
    receipt
INNER JOIN
    customer
ON
    receipt.customer_id = customer.customer_id
GROUP BY
    FLOOR(age / 10) * 10
;
