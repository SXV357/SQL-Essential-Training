-- SQLite

-- to join multiple fields, need to concatenate them
    -- use the || operator to do so

-- display customer first name, last name, address and mailing address

SELECT
    c.FirstName AS "First Name",
    c.LastName AS "Last Name",
    c.Address,

    -- string concatenation using the || operator
    (c.FirstName || ' ' || c.LastName || ', ' || c.Address || ', ' || c.City || ', ' || c.State || ', ' || c.PostalCode) AS "Mailing Address",

    -- length function just takes in the string and outputs the length
    LENGTH(c.PostalCode) AS "Postal Code Length",


    -- format of substring function: SUBSTRING(string, start position(always 1), end position(it's inclusive))
    SUBSTRING(c.PostalCode, 1, 5) AS "Truncated Zip Code",

    -- upper and lower case functions which take a string and convert all characters either to upper or lower case
    UPPER(c.FirstName) AS "First Name UpperCase",
    LOWER(c.LastName) AS "Last Name LowerCase"
FROM
    Customer AS c
WHERE
    c.Country = "USA"