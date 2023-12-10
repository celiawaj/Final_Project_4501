
SELECT
    zipcode,
    COUNT(*) AS total_trees
FROM
    trees
WHERE
    status = 'Alive'
GROUP BY
    zipcode
ORDER BY
    total_trees DESC
LIMIT 10;
