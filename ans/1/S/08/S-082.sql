DROP TABLE IF EXISTS product_fill_med;

CREATE TABLE product_fill_med AS (
    WITH med AS (
        SELECT
            PERCENTILE_CONT(0.5) WITHIN GROUP ( ORDER BY unit_price ) AS unit_price_med,
            PERCENTILE_CONT(0.5) WITHIN GROUP ( ORDER BY unit_cost ) AS unit_cost_med
        FROM
            product
    )
    SELECT
        product_cd,
        category_major_cd,
        category_medium_cd,
        category_small_cd,
        COALESCE(unit_price, unit_price_med) AS unit_price,
        COALESCE(unit_cost, unit_cost_med) AS unit_cost
    FROM
        product
    CROSS JOIN
        med
);

SELECT
    count(*)
FROM
    product_fill_med
;

SELECT
    *
FROM
    product_fill_med
;

SELECT
    count(*)
FROM
    product_fill_med
WHERE
    unit_price IS NULL
    OR unit_cost IS NULL
;

