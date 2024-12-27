DROP TABLE IF EXISTS geo_customer;

CREATE TABLE geo_customer AS (
    WITH geocode_avg AS (
        SELECT
            postal_cd,
            AVG(longitude) AS longitude,
            AVG(latitude) AS latitude
        FROM
            geocode
        GROUP BY
            postal_cd
    )
    SELECT
        *
    FROM
        customer
    JOIN
        geocode_avg
    USING(postal_cd)
)
;

SELECT
    customer_id,
    g.address AS customer_address,
    s.address AS store_address,
    6371 * ACOS(
        SIN(RADIANS(g.latitude)) * SIN(RADIANS(s.latitude))
        + COS(RADIANS(g.latitude)) * COS(RADIANS(s.latitude)) * COS(RADIANS(g.longitude) - RADIANS(s.longitude))
    ) AS distance
FROM
    geo_customer AS g
JOIN
    store AS s
ON
    g.application_store_cd = s.store_cd
LIMIT
    10
;
