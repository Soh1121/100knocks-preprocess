DROP TABLE IF EXISTS not_null_product;

CREATE TABLE not_null_product AS (
    SELECT
        *
    FROM
        product
    WHERE
        unit_price IS NOT NULL
        AND unit_cost IS NOT NULL
);

SELECT
    count(*) AS 削除前
FROM
    product
;

SELECT
    count(*) AS 削除後
FROM
    not_null_product
;
