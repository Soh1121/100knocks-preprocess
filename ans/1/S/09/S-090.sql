DROP TABLE IF EXISTS ym_amount;

CREATE TABLE ym_amount AS (
    SELECT
        SUBSTR(CAST(sales_ymd AS VARCHAR), 1, 6) AS sales_ym,
        SUM(amount) AS sum_amount,
        ROW_NUMBER() OVER (
            ORDER BY SUBSTR(CAST(sales_ymd AS VARCHAR), 1, 6)
        ) AS row
    FROM
        receipt
    GROUP BY
        sales_ym
);

DROP TABLE IF EXISTS series_data_1;

CREATE TABLE series_data_1 AS(
    WITH lag_amount AS (
        -- ym_amount と変わらない結果となるが、後続で使い回せるように作成
        SELECT
            sales_ym,
            sum_amount,
            LAG(row, 0) OVER (ORDER BY row) AS row
        FROM
            ym_amount
    )
    SELECT
        sales_ym,
        sum_amount,
        CASE WHEN row <=12 THEN 0 WHEN 12 < row THEN 1 END as test_flag
    FROM
        lag_amount
    WHERE
        row BETWEEN 1 AND 18
);

DROP TABLE IF EXISTS series_data_2;

CREATE TABLE series_data_2 AS(
    WITH lag_amount AS (
        SELECT
            sales_ym,
            sum_amount,
            LAG(row, 6) OVER (ORDER BY row) AS row
        FROM
            ym_amount
    )
    SELECT
        sales_ym,
        sum_amount,
        CASE WHEN row <=12 THEN 0 WHEN 12 < row THEN 1 END as test_flag
    FROM
        lag_amount
    WHERE
        row BETWEEN 1 AND 18
);

DROP TABLE IF EXISTS series_data_3;

CREATE TABLE series_data_3 AS(
    WITH lag_amount AS (
        SELECT
            sales_ym,
            sum_amount,
            LAG(row, 12) OVER (ORDER BY row) AS row
        FROM
            ym_amount
    )
    SELECT
        sales_ym,
        sum_amount,
        CASE WHEN row <=12 THEN 0 WHEN 12 < row THEN 1 END as test_flag
    FROM
        lag_amount
    WHERE
        row BETWEEN 1 AND 18
);
