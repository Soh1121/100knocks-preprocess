DROP TABLE IF EXISTS product_full_import;
CREATE TABLE product_full_import (
    product_cd              VARCHAR(10),
    category_major_cd       VARCHAR(2),
    category_major_name     VARCHAR(32),
    category_medium_cd      VARCHAR(4),
    category_medium_name    VARCHAR(32),
    category_small_cd       VARCHAR(6),
    category_small_name     VARCHAR(32),
    unit_price              INTEGER,
    unit_cost               INTEGER
);

COPY
    product_full_import
FROM
    '/tmp/data/S_product_full_UTF-8_noheader.csv'
WITH
    CSV
ENCODING
    'UTF-8'
;

SELECT
    *
FROM
    product_full_import
LIMIT
    3
;
