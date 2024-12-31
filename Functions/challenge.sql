-- SQLite


SELECT
    (c.FirstName || ' ' || c.LastName) AS CustomerFullName,
    SUBSTRING(c.PostalCode, 1, 5) AS StandardizedPostalCode
FROM
    Customer AS c
WHERE
    c.Country = 'USA'
ORDER BY
    CustomerFullName ASC