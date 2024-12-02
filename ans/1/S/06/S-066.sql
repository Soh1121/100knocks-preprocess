WITH new_price AS (
    SELECT
        product_cd,
        unit_price,
        unit_cost,
        ROUND(unit_cost / 0.7) AS new_unit_price
    FROM
        product
)
SELECT
    *,
    (new_unit_price * 1.0 - unit_cost) / new_unit_price AS new_profit_rate
FROM
    new_price
LIMIT
    10
;
