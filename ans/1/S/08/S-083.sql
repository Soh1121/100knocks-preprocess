DROP TABLE IF EXISTS product_fill_med_per_category_small;

CREATE TABLE product_fill_med_per_category_small AS (
    WITH med AS (
        SELECT
            category_small_cd,
            ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP ( ORDER BY unit_price )) AS unit_price_med,
            ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP ( ORDER BY unit_cost ))  AS unit_cost_med
        FROM product
        GROUP BY category_small_cd
    )
    SELECT
        product_cd,
        category_major_cd,
        category_medium_cd,
        p.category_small_cd,
        COALESCE(p.unit_price, m.unit_price_med) AS unit_price,
        COALESCE(p.unit_cost, m.unit_cost_med)   AS unit_cost
    FROM
        product AS p
    JOIN
        med AS m
    ON
        p.category_small_cd = m.category_small_cd
)
;

SELECT
    count(*)
FROM
    product_fill_med_per_category_small
;

SELECT
    *
FROM
    product_fill_med_per_category_small
;

SELECT
    count(*)
FROM
    product_fill_med_per_category_small
WHERE
    unit_price IS NULL
    OR unit_cost IS NULL
;
