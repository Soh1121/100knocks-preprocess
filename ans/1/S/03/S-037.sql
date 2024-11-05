SELECT
    product.*,
    category.category_small_name
FROM
    product
JOIN
    category
ON
    product.category_small_cd = category.category_small_cd
LIMIT
    10
;
