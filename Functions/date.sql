-- SQLite

-- date functions

-- calculate the age of all employees(can leverage BirthDate column to do so)
SELECT
    e.FirstName,
    e.LastName,
    e.BirthDate,

    -- strftime function is a date function that takes in a date string and formats it in a different way
        -- here we are formatting the original date string in the year-month-day format
    strftime("%Y-%m-%d", e.BirthDate) AS "Birth Date w/o timestamp",

    -- actually calculating the age
        -- we first use the now function and convert it into the year-month-day format
        -- then we subtract the formatted string for the birth date column as earlier
        -- important to ensure both dates are in the same format for the calculation to go through properly
    strftime("%Y-%m-%d", "now") - strftime("%Y-%m-%d", e.BirthDate) AS "Employee Age"
FROM
    Employee AS e