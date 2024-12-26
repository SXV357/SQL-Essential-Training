-- SQLite

/**
    Selects track names, composers, and unit prices and categorizes
    each track based on its price.
*/

SELECT 
    t.Name AS "Track Name",
    t.Composer,
    -- Quotes technically not needed here since it's just one word
    t.UnitPrice AS "Price",
CASE
    WHEN t.UnitPrice <= 0.99 THEN "Budget"
    -- Should be > 0.99 AND <= 1.49
    WHEN t.UnitPrice >= 1.00 AND t.UnitPrice <= 1.49 THEN "Regular"
    -- Should be > 1.49 AND <= 1.99
    WHEN t.UnitPrice >= 1.50 AND t.UnitPrice <= 1.99 THEN "Premium"
    ELSE "Exclusive"
    END AS PriceCategory
FROM 
    -- we alias the table so all column names will need to be referred wrt this title
    Track AS t
ORDER BY
    -- Don't need to specify ASC since that's the default sorting order
    t.UnitPrice