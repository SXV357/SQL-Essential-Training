-- SQLite

/**
    Invoice: CustomerID(foreign)
        -> Customer: CustomerID(primary), SupportRepID(foreign)
                                            -> Employee: EmployeeID(primary)
    
    reward the employees that are responsible for the 10 highest individual sales
*/

-- necessary columns: employee first name, employee last name, employee ID, customer first name, customer last name, customer ID, invoice total
    -- order based on total in descending order and limit to top 10 entries

SELECT  
    e.FirstName AS "Employee First Name",
    e.lastName AS "Employee Last Name",

    e.EmployeeId,

    c.FirstName AS "Customer First Name",
    c.LastName AS "Customer Last Name",
 
    i.CustomerId,
    i.Total

FROM
    Invoice AS i

INNER JOIN 
    Customer AS c 
ON 
    i.CustomerId = c.CustomerId

INNER JOIN 
    Employee as e 
ON 
    e.EmployeeId = c.SupportRepId

ORDER BY
    i.Total DESC

LIMIT 10;