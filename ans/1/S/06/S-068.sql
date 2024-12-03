SELECT
    product_cd,
    unit_price,
    TRUNC(unit_price * 1.1) AS tax_price
FROM
    product
LIMIT
    10
;
