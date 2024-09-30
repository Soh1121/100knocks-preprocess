SELECT
    customer_id, sum(amount) AS sum
FROM
    receipt
WHERE customer_id NOT LIKE 'Z%'
GROUP BY
    customer_id
HAVING
    sum(amount) >= (SELECT avg(sum)
                    FROM (SELECT sum(amount) as sum
                          FROM receipt
                          WHERE customer_id NOT LIKE 'Z%'
                          GROUP BY customer_id) AS avg)
ORDER BY
    customer_id
LIMIT
    10
;
