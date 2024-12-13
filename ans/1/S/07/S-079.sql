SELECT
    SUM(CASE WHEN product_cd IS NULL THEN 1 ELSE 0 END) AS null_product_code,
    SUM(CASE WHEN category_major_cd IS NULL THEN 1 ELSE 0 END) AS null_category_major_cd,
    SUM(CASE WHEN category_medium_cd IS NULL THEN 1 ELSE 0 END) AS null_category_medium_cd,
    SUM(CASE WHEN category_small_cd IS NULL THEN 1 ELSE 0 END) AS null_category_small_cd,
    SUM(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END) AS null_unit_price,
    SUM(CASE WHEN unit_cost IS NULL THEN 1 ELSE 0 END) AS null_unit_cost
FROM
    product
;
