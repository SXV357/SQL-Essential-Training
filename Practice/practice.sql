-- SQLite

-- 1
SELECT
    Name AS "Track Name",
CASE
    WHEN Milliseconds < 200000 THEN 'Short'
    WHEN Milliseconds >= 200000 AND Milliseconds <= 400000 THEN 'Medium'
    ELSE 'Long'
    END AS "Length Category"
FROM
    Track

-- 2
/**
SELECT
    -- Pipe operator used to concatenate values in one or more columns
    (FirstName || ' ' || LastName) AS "Employee",
CASE
    -- this is how date comparisons can be done(the time technically isn't necessary here)
    WHEN DATE(HireDate) >= "2019-12-25 00:00:00" THEN 'Junior'
    ELSE 'Senior'
    END AS "Experience Level"
FROM    
    Employee
ORDER BY
    -- will anyways be ordered from the oldest to the youngest since ascending is default
    HireDate
-- gives top 5 most experiences employees
LIMIT 5


-- 3
SELECT
    Name AS "Track Name",
    UnitPrice AS "Unit Price",
    Bytes AS "Bytes Size",
CASE
    WHEN Bytes > 8000000 THEN 'High Quality'
    ELSE 'Standard Quality'
    END AS "Size Category"
FROM
    Track
WHERE 
    (UnitPrice > 0.99) AND (Bytes > 7000000)
ORDER BY
    Bytes DESC
LIMIT 10
**/