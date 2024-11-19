SELECT
    receipt_no,
    receipt_sub_no,
    TO_CHAR(EXTRACT(MONTH FROM TO_TIMESTAMP(sales_epoch)), 'FM00') AS sales_month
FROM
    receipt
LIMIT
    10
;
