-- The script is designed to answer the business questions for the Elevvo training.
-- Business Questions:
	-- Top-Selling Products?
	-- Revenue Per Region?
	-- Monthly Performance?
    
USE chinook;

-- Q1) Top-Selling Products? -------------------------------------------------

SELECT
    T.Name AS ProductName,
    SUM(IL.Quantity) AS TotalQuantitySold,
    SUM(IL.Quantity * IL.UnitPrice) AS TotalRevenue
FROM
    InvoiceLine AS IL
JOIN
    Track AS T ON IL.TrackId = T.TrackId
GROUP BY
    T.Name
ORDER BY
    TotalQuantitySold DESC
LIMIT 10;

-- Q2) Revenue Per Region? ---------------------------------------------------

SELECT
    I.BillingCountry AS Region,
    SUM(I.Total) AS TotalRevenue
FROM
    Invoice AS I
GROUP BY
    I.BillingCountry
ORDER BY
    TotalRevenue DESC;
    
-- Q3) Monthly Performance? ---------------------------------------------------

SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS SalesMonth,
    SUM(Total) AS MonthlyRevenue
FROM
    Invoice
GROUP BY
    SalesMonth
ORDER BY
    SalesMonth;

-- Window Function : Top 3 Tracks by UnitPrice within each Genre using ROW_NUMBER 
WITH RankedTracks AS (
    SELECT
        T.Name AS TrackName,
        G.Name AS GenreName,
        T.UnitPrice,
        ROW_NUMBER() OVER (PARTITION BY G.Name ORDER BY T.UnitPrice DESC) AS RankByUnitPrice
    FROM
        Track AS T
    JOIN
        Genre AS G ON T.GenreId = G.GenreId
)
SELECT
    TrackName,
    GenreName,
    UnitPrice
FROM
    RankedTracks
WHERE
    RankByUnitPrice <= 3;