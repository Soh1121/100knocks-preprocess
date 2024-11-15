SELECT
    receipt_no,
    receipt_sub_no,
    CAST(TO_TIMESTAMP(sales_epoch) AS DATE) AS sales_ymd
FROM
    receipt
LIMIT
    10
;
