-- SQLite

-- 1. Get all tracks with their album titles - display the track name and album title

SELECT 
    a.Title AS "Album Title",
    t.Name AS "Track Name"
FROM
    Track AS t
INNER JOIN
    Album AS a
ON
    t.AlbumId = a.AlbumId;

-- 2. List all tracks with their genre names

SELECT
    t.Name AS "Track Name",
    g.Name AS "Genre Name"
FROM
    Track AS t
INNER JOIN
    Genre AS g
ON
    t.GenreId = g.GenreId;

-- 3. Show all invoices with customer names

SELECT
    (c.FirstName || ' ' || c.LastName) AS "Customer Name",
    c.CustomerId,
    i.InvoiceDate,
    i.invoiceId,
    i.Total
FROM
    Invoice AS i
INNER JOIN
    Customer AS c
ON
    i.CustomerId = c.CustomerId;

-- 4. Display a complete track listing showing: track name, album title, artist name, genre name

SELECT
    t.Name AS "Track Name",
    al.Title AS "Album Title",
    ar.Name AS "Artist Name",
    g.Name AS "Genre Name"
FROM
    Track AS t
INNER JOIN Album AS al ON t.AlbumId = al.AlbumId
INNER JOIN Artist AS ar ON al.ArtistId = ar.ArtistId
INNER JOIN Genre AS g ON t.GenreId = g.GenreId;

-- 5. Show invoice details: invoice ID, customer full name, total amount, full name of employee who handled the customer

SELECT
    i.InvoiceId AS "Invoice ID",
    (c.FirstName || ' ' || c.LastName) AS "Customer Full Name",
    i.Total AS "Total Amount",
    (e.FirstName || ' ' || e.LastName) AS "Employee Full Name"
FROM
    Customer AS c
INNER JOIN Invoice AS i ON c.CustomerId = i.CustomerId
INNER JOIN Employee AS e ON e.EmployeeId = c.SupportRepId;

-- 6. list tracks with unit price > $1.00 showing track name, unit price, album title, artist name

SELECT
    t.Name AS "Track Name",
    t.UnitPrice AS "Unit Price",
    al.Title AS "Album Title",
    ar.Name AS "Artist Name"
FROM
    Track AS t
INNER JOIN Album AS al ON al.AlbumId = t.AlbumId
INNER JOIN Artist AS ar on ar.ArtistId = al.ArtistId
WHERE
    t.UnitPrice > 1.00;

-- 7. show all tracks > 300k milliseconds: track name, length(ms), album title, genre name

SELECT
    t.Name AS "Track Name",
    t.Milliseconds AS "Track Length(ms)",
    a.Title AS "Album Title",
    g.Name AS "Genre Name"
FROM
    Track AS t
INNER JOIN Album AS a ON t.AlbumId = a.AlbumId
INNER JOIN Genre AS g on g.GenreId = t.GenreId
WHERE
    t.Milliseconds > 300000;

-- 8. list all customers and their sales representatives: customer name, customer country, sales rep name, employee hire date

SELECT
    (c.FirstName || ' ' || c.LastName) AS "Customer Name",
    c.Country AS "Customer Country of Origin",
    (e.FirstName || ' ' || e.LastName) AS "Employee(Sales Rep) Name",
    e.HireDate AS "Employee(Sales Rep) Hire Date"
FROM
    Customer AS c
INNER JOIN Employee AS e ON c.SupportRepId = e.EmployeeId;

-- 9. find all playlists that contain tracks from the genre "Rock": playlist name, track name, genre name

SELECT
    p.Name AS "Playlist Name",
    t.Name AS "Track Name",
    g.Name AS "Genre Name"
FROM
    Track AS t
INNER JOIN Genre AS g ON g.GenreId = t.GenreId
INNER JOIN PlaylistTrack AS pt ON pt.TrackId = t.TrackId
INNER JOIN Playlist AS p ON p.PlaylistId = pt.PlaylistId
WHERE   
    g.Name = "Rock";

-- 10. invoice details for all purchases in 2010: invoice ID/date, customer name, billing country, total amount

SELECT
    i.InvoiceId AS "Invoice ID",
    i.InvoiceDate AS "Invoice Date",
    (c.FirstName || ' ' || c.LastName) AS "Customer Name",
    i.BillingCountry AS "Billing Country",
    i.Total
FROM
    Customer AS c
INNER JOIN Invoice AS i ON i.CustomerId = c.CustomerId
WHERE
    DATE(i.InvoiceDate) LIKE "2010%"