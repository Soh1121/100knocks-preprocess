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
        customer AS c
    JOIN
        geocode_avg AS g
    USING(postal_cd)
)
;

SELECT
    *
FROM
    geo_customer
LIMIT
    10
;
