
SELECT
    zipcodes.zipcode,
    COUNT(*) AS total_trees
FROM
    zipcodes
JOIN
    trees ON ST_Within(trees.geometry, zipcodes.geometry)
WHERE
    status = 'Alive'
GROUP BY
    zipcodes.zipcode
ORDER BY
    total_trees DESC
LIMIT 10;
