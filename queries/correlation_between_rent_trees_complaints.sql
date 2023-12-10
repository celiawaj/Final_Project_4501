
SELECT
    rs.zipcode,
    TO_CHAR(AVG(rs.avg_rent), 'FM9,999,999.00') as average_rent,
    COUNT(DISTINCT t.id) AS tree_count,
    COUNT(DISTINCT c.id) AS complaint_count
FROM (
    SELECT
        r.zipcode,
        AVG(r.rent) AS avg_rent,
        ROW_NUMBER() OVER (ORDER BY AVG(r.rent) ASC) AS low_rank,
        ROW_NUMBER() OVER (ORDER BY AVG(r.rent) DESC) AS high_rank
    FROM
        rents r
    WHERE
        r.date BETWEEN '2023-01-01' AND '2023-01-31'
        AND r.rent IS NOT NULL
    GROUP BY
        r.zipcode
) rs
LEFT JOIN
    trees t ON rs.zipcode = t.zipcode
LEFT JOIN
    complaints c ON rs.zipcode = c.zipcode
WHERE
    rs.low_rank <= 5 OR rs.high_rank <= 5
GROUP BY
    rs.zipcode, rs.avg_rent
ORDER BY
    rs.avg_rent, rs.zipcode;
