SELECT
    AVG((unit_price * 1.0 - unit_cost) / unit_price) AS profit_avg
FROM
    product
;
