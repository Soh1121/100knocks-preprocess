DROP TABLE IF EXISTS product_fill_avg;

CREATE TABLE product_fill_avg AS (
    WITH price_cost_avg AS (
        SELECT
            AVG(unit_price) AS price_avg,
            AVG(unit_cost) AS cost_avg
        FROM
            product
    )
    SELECT product_cd,
         category_major_cd,
         category_medium_cd,
         category_small_cd,
         ROUND(COALESCE(unit_price, price_avg)) AS unit_price,
         ROUND(COALESCE(unit_cost, cost_avg)) AS unit_cost
    FROM
        product
    CROSS JOIN
        price_cost_avg
);

SELECT
    count(*)
FROM
    product_fill_avg
;

SELECT
    *
FROM
    product_fill_avg
;

SELECT
    count(*)
FROM
    product_fill_avg
WHERE
    unit_price IS NULL
    OR unit_cost IS NULL
;
