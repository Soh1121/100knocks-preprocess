SELECT
    product_cd,
    unit_price,
    unit_cost,
    (unit_price - unit_cost) AS profit
FROM
    product
LIMIT
    10
;
