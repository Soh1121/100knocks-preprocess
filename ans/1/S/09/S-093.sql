DROP TABLE IF EXISTS product_full;

CREATE TABLE product_full AS (
    SELECT
        p.product_cd,
        p.category_major_cd,
        c.category_major_name,
        p.category_medium_cd,
        c.category_medium_name,
        p.category_small_cd,
        c.category_small_name,
        p.unit_price,
        p.unit_cost
    FROM
        product AS p
    JOIN
        category AS c
    USING(category_small_cd)
);

SELECT
    *
FROM
    product_full
LIMIT
    3
;
