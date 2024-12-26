-- SQLite

-- Overall structure of a SQL query(For convention purposes)
    -- SELECT
    -- CASE
    -- FROM
    -- WHERE
    -- ORDER BY
    -- LIMIT

SELECT
    -- Renaming columns can be done using the following methods
        -- 1. In quotes
        -- 2. In square brackets(No quotes needed within the brackets)
        -- 3. If the new column name is just a single word no quotes or square brackets needed
    InvoiceDate AS "Invoice Date",
    BillingAddress AS "Billing Address",
    BillingCity AS "Billing City",
    Total,

-- If we want to create a new column that is based on values in an existing column we can use a switch statement
-- Based on the value, we can assign a value to that corresponding row in the new column
CASE
    WHEN Total BETWEEN 0.99 AND 1.99 THEN "Baseline Purchase"
    WHEN Total BETWEEN 2.00 AND 6.99 THEN "Low Purchase"
    WHEN Total BETWEEN 7.00 AND 15.00 THEN "Target Purchase"
    -- The below statement could also be written as ELSE "Top Performer" for brevity
    WHEN Total > 15.00 THEN "Top Performer"
    -- This statement is used to set the name of the new column
    END AS "Purchase Type"
FROM
    Invoice
WHERE 
    -- Matches rows where the total > 1.98 and the billing city either begins with a "P" or a "D"
    (Total > 1.98) AND (BillingCity LIKE "P%" OR BillingCity LIKE "D%")
ORDER BY
    -- The default sort order is ascending so no need to explicitly specify it
    -- Can specify as many columns as you need
    InvoiceDate