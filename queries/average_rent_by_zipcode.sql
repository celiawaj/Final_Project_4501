
SELECT trees.zipcode, TO_CHAR(AVG(rents.rent), 'FM9,999,999.00') AS august_rent
FROM trees
JOIN rents ON trees.zipcode = rents.zipcode
WHERE EXTRACT(MONTH FROM rents.date) = 8 AND EXTRACT(YEAR FROM rents.date) = 2023
GROUP BY trees.zipcode
ORDER BY COUNT(*) DESC
LIMIT 10;
