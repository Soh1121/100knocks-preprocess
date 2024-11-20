SELECT
    receipt_no,
    receipt_sub_no,
    TO_CHAR(EXTRACT(DAY FROM TO_TIMESTAMP(sales_epoch)), 'FM00') AS sales_day
FROM
    receipt
LIMIT
    10
;
