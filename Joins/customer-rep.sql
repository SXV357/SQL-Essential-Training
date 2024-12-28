-- SQLite

-- Generates a report that lists each customer along with their assigned support representative

    SELECT
        c.FirstName AS CustomerFirstName,
        c.LastName AS CustomerLastName,
        e.FirstName AS SupportRepFirstName,
        e.LastName AS SupportRepLastName
    FROM
        Customer AS c
    INNER JOIN
        Employee AS e
    ON
        c.SupportRepId = e.EmployeeId
    ORDER BY
        e.LastName,
        c.LastName