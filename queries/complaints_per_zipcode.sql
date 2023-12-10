
SELECT
    zipcode,
    COUNT(*) AS num_complaints
FROM
    complaints
WHERE
    date BETWEEN TIMESTAMP '2022-10-01 00:00:00' AND TIMESTAMP '2023-09-30 23:59:59'
GROUP BY
    zipcode;
