SELECT
    PERCENTILE_CONT(0.25) WITHIN GROUP ( ORDER BY amount ) AS percentile_25,
    PERCENTILE_CONT(0.50) WITHIN GROUP ( ORDER BY amount ) AS percentile_50,
    PERCENTILE_CONT(0.75) WITHIN GROUP ( ORDER BY amount ) AS percentile_75,
    PERCENTILE_CONT(1.0) WITHIN GROUP ( ORDER BY amount ) AS percentile_100
FROM
    receipt
;
