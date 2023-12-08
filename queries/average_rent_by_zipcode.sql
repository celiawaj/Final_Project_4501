
SELECT trees.zipcode, TO_CHAR(AVG(rents.aug_rent), 'FM9,999,999.00') AS august_rent
FROM trees
LEFT OUTER JOIN rents ON trees.zipcode = rents.zipcode
GROUP BY trees.zipcode
ORDER BY COUNT(*) DESC
LIMIT 10;
