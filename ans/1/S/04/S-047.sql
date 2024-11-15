SELECT
    receipt_no,
    receipt_sub_no,
    TO_DATE(CAST(sales_ymd AS VARCHAR), 'yyyymmdd')
FROM
    receipt
LIMIT
    10
;
