-- SQLite

-- aggregate functions

-- what are the all time global sales?

SELECT
    SUM(i.Total) AS "Total Sales",

    -- ROUND function takes in the value along with number of decimal places to round to
    ROUND(AVG(i.Total), 2) AS "Average Sale Amount",

    MAX(i.Total) AS "Highest Sale Amount",
    MIN(i.Total) AS "Lowest Sale Amount",

    -- if we want the total number of sales(also represents the total non-NULL table records)
    COUNT(*) AS "Total Sales"
FROM
    Invoice AS i;