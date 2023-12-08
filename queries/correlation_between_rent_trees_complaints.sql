
SELECT * FROM (
    SELECT
        r.zipcode,
        TO_CHAR(AVG(r.jan_rent), 'FM9,999,999.00') AS average_rent,
        (SELECT COUNT(*) FROM trees t WHERE t.zipcode = r.zipcode) AS tree_count,
        (SELECT COUNT(*) FROM complaints c 
         WHERE c.zipcode = r.zipcode 
         AND date_trunc('month', c.date) = '2023-01-01') AS complaint_count
    FROM
        rents r
    GROUP BY
        r.zipcode
    ORDER BY
        average_rent
    LIMIT 5
) AS LowestRent
UNION ALL
SELECT * FROM (
    SELECT
        r.zipcode,
        TO_CHAR(AVG(r.jan_rent), 'FM9,999,999.00') AS average_rent,
        (SELECT COUNT(*) FROM trees t WHERE t.zipcode = r.zipcode) AS tree_count,
        (SELECT COUNT(*) FROM complaints c 
         WHERE c.zipcode = r.zipcode 
         AND date_trunc('month', c.date) = '2023-01-01') AS complaint_count
    FROM
        rents r
    GROUP BY
        r.zipcode
    ORDER BY
        average_rent DESC
    LIMIT 5
) AS HighestRent;
