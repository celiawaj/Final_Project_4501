WITH RentSummary AS (
        SELECT
            r.zipcode,
            AVG(r.rent) AS avg_rent
        FROM
            rents r
        WHERE
            r.date BETWEEN '2023-01-01' AND '2023-01-31'
            AND r.rent IS NOT NULL
        GROUP BY
            r.zipcode
    ),
    RankedRents AS (
        SELECT
            zipcode,
            avg_rent,
            ROW_NUMBER() OVER (ORDER BY avg_rent ASC) AS low_rank,
            ROW_NUMBER() OVER (ORDER BY avg_rent DESC) AS high_rank
        FROM
            RentSummary
    ),
    TreeCounts AS (
        SELECT
            zipcode,
            COUNT(*) AS tree_count
        FROM
            trees
        WHERE
            status = 'Alive'
        GROUP BY
            zipcode
    ),
    ComplaintCounts AS (
        SELECT
            zipcode,
            COUNT(*) AS complaint_count
        FROM
            complaints
        WHERE
            date BETWEEN '2023-01-01' AND '2023-01-31'
        GROUP BY
            zipcode
    )
    SELECT
        R.zipcode,
        TO_CHAR(R.avg_rent, 'FM9,999,999.00') as average_rent,
        COALESCE(T.tree_count, 0) AS tree_count,
        COALESCE(C.complaint_count, 0) AS complaint_count
    FROM
        RankedRents R
    LEFT JOIN
        TreeCounts T ON R.zipcode = T.zipcode
    LEFT JOIN
        ComplaintCounts C ON R.zipcode = C.zipcode
    WHERE
        R.low_rank <= 5 OR R.high_rank <= 5
    ORDER BY
        R.avg_rent, R.zipcode;
    