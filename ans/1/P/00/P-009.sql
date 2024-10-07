-- before
SELECT
    *
FROM
    store
WHERE
    NOT (prefecture_cd = '13' OR floor_area > 900)
;

-- after
SELECT
    *
FROM
    store
WHERE
    prefecture_cd != '13'
    AND floor_area <= 900
;