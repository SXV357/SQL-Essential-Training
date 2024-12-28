-- SQLite

/**
    Matches all records in both tables where the customer id is the same
    If there's a customerID in the customer table that doesn't exist in the invoice table then NULL is inserted for the corresponding InvoiceID in the result table. In addition, intersection between customer ID's in both tables is captured.
*/

SELECT
    c.LastName,
    c.FirstName,
    i.InvoiceId,
    i.CustomerId,
    i.InvoiceDate,
    i.Total
FROM 
    Invoice as i
RIGHT OUTER JOIN
    -- intersection between both tables as usual
    -- all rows in the right table(the one specified as part of the join statement)
    Customer as c
ON
    i.CustomerID = c.CustomerID
ORDER BY
    c.CustomerID