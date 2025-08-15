-- The script is designed to answer the business questions for the Elevvo training.
---Business Questions:
	-- Top-Selling Products?
	-- Revenue Per Region?
	-- Monthly Performance?

USE Chinook

-- Q1) Top-Selling Products? -------------------------------------------------

SELECT TOP 10
    T.Name AS Product_Name,
    SUM(IL.Quantity) AS Total_Quantity_Sold,
    SUM(IL.Quantity * IL.UnitPrice) AS Total_Revenue
FROM
    InvoiceLine AS IL
JOIN
    Track AS T ON IL.TrackId = T.TrackId
GROUP BY
    T.Name
ORDER BY
    Total_Quantity_Sold DESC;

-- Q2) Revenue Per Region? ---------------------------------------------------

SELECT
    I.BillingCountry AS Region,
    SUM(I.Total) AS Total_Revenue
FROM
    Invoice AS I
GROUP BY
    I.BillingCountry
ORDER BY
    Total_Revenue DESC;

-- Q3) Monthly Performance? ---------------------------------------------------

SELECT
    FORMAT(InvoiceDate, 'yyyy-MM') AS Sales_Month,
    SUM(Total) AS Monthly_Revenue
FROM
    Invoice
GROUP BY
    FORMAT(InvoiceDate, 'yyyy-MM')
ORDER BY
    Sales_Month;

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