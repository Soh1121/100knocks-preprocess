SELECT
    receipt_no,
    receipt_sub_no,
    EXTRACT(YEAR FROM TO_TIMESTAMP(sales_epoch)) AS sales_year
FROM
    receipt
LIMIT
    10
;
