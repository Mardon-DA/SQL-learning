1.
SELECT Category, COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category;
2.
SELECT AVG(Price) AS AveragePrice
FROM Products
WHERE Category = 'Electronics';
3.
SELECT *
FROM Customers
WHERE City LIKE 'L%';
4.
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%er';
5.
SELECT *
FROM Customers
WHERE Country LIKE '%A';
6.
SELECT MAX(Price) AS HighestPrice
FROM Products;
7.
SELECT ProductName,
       Quantity,
       CASE
           WHEN Quantity < 30 THEN 'Low Stock'
           ELSE 'Sufficient'
       END AS StockStatus
FROM Products;
8.
SELECT Country, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;
9.
SELECT MIN(Quantity) AS MinimumQuantity,
       MAX(Quantity) AS MaximumQuantity
FROM Orders;
10.
SELECT DISTINCT o.CustomerID
FROM Orders o
LEFT JOIN Invoices i ON o.OrderID = i.OrderID
WHERE o.OrderDate >= '2023-01-01' AND o.OrderDate < '2023-02-01'
  AND i.InvoiceID IS NULL;
11.
SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;
12.
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;
13.
SELECT YEAR(OrderDate) AS OrderYear,
       AVG(OrderAmount) AS AverageOrderAmount
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;
14.
SELECT ProductName,
       CASE
           WHEN Price < 100 THEN 'Low'
           WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
           ELSE 'High'
       END AS PriceGroup
FROM Products;
15.
-- Yangi jadval yaratish
CREATE TABLE Population_Each_Year (
    City VARCHAR(100),
    [2012] INT,
    [2013] INT
);

-- Pivot so‘rovini INSERT INTO orqali yangi jadvalga joylash
INSERT INTO Population_Each_Year (City, [2012], [2013])
SELECT City, [2012], [2013]
FROM
(
    SELECT City, Year, Population
    FROM City_Population
) AS SourceTable
PIVOT
(
    SUM(Population)
    FOR Year IN ([2012], [2013])
) AS PivotTable;
16.
SELECT ProductID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;
17.SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';
18.
Using City_Population table, use Pivot to show values of City column in seperate columns (Bektemir, Chilonzor, Yakkasaroy)
and copy results to a new Population_Each_City table.
19.
SELECT TOP 3 CustomerID,
       SUM(InvoiceAmount) AS Totalspent
FROM Invoices
GROUP BY CustomerID
ORDER BY Totalspent DESC;
20.
SELECT City,
       CAST([Year] AS INT) AS Year,
       Population
FROM
(
    SELECT City, [2012], [2013]
    FROM Population_Each_Year
) p
UNPIVOT
(
    Population FOR [Year] IN ([2012], [2013])
) AS unpvt;
21.
SELECT p.ProductName,
       COUNT(s.SaleID) AS TimesSold
FROM Products p
INNER JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName
ORDER BY TimesSold DESC;
22.
SELECT City,
       CAST([Year] AS INT) AS Year,
       Population
FROM
(
    SELECT City, [2012], [2013]
    FROM Population_Each_City
) p
UNPIVOT
(
    Population FOR [Year] IN ([2012], [2013])
) AS unpvt;
