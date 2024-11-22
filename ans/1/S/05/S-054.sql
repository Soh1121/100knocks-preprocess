SELECT
    customer_id,
    address,
    CASE SUBSTR(address, 1, 3)
        WHEN '埼玉県' THEN 11
        WHEN '千葉県' THEN 12
        WHEN '東京都' THEN 13
        WHEN '神奈川' THEN 14
    END AS address_code
FROM
    customer
LIMIT
    10
;
