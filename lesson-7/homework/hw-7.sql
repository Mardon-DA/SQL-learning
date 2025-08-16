1.
SELECT MIN(Price) AS MinimumPrice
FROM Products;
2.
SELECT MAX(Salary) AS MaximumSalary
FROM Employees;
3.
SELECT COUNT(*) AS TotalRows
FROM Customers;
4.
SELECT COUNT(DISTINCT Category) AS UniqueCategories
FROM Products;
5.
SELECT SUM(SaleAmount) AS TotalSales
FROM Sales
WHERE ProductID = 7;
6.
SELECT AVG(Age) AS AverageAge
FROM Employees;
7.
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;
8.
SELECT Category,
       MIN(Price) AS MinPrice,
       MAX(Price) AS MaxPrice
FROM Products
GROUP BY Category;
9.
SELECT CustomerID,
       SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID;
10.
SELECT DeptID
FROM Employees
GROUP BY DeptID
HAVING COUNT(*) > 5;
11.
SELECT p.Category,
       SUM(s.SaleAmount) AS TotalSales,
       AVG(s.SaleAmount) AS AverageSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category;
12.
SELECT COUNT(*) AS HR_EmployeeCount
FROM Employees
WHERE Department = 'HR';
13.
SELECT DeptID,
       MIN(Salary) AS LowestSalary,
       MAX(Salary) AS HighestSalary
FROM Employees
GROUP BY DeptID;
14.
SELECT DeptID,
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DeptID;
15.
SELECT DeptID,
       AVG(Salary) AS AverageSalary,
       COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DeptID;
16.
SELECT Category,
       AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 400;
17.
SELECT YEAR(SaleDate) AS SaleYear,
       SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY YEAR(SaleDate)
ORDER BY SaleYear;
18.
SELECT CustomerID
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) >= 3;
19.
SELECT DeptID
FROM Employees
GROUP BY DeptID
HAVING AVG(Salary) > 60000;
20.
SELECT Category,
       AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 150;
21.
SELECT CustomerID,
       SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID
HAVING SUM(SaleAmount) > 1500;
22.
SELECT DeptID,
       SUM(Salary) AS TotalSalary,
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DeptID
HAVING AVG(Salary) > 65000;
23.
WITH CustomerSales AS (
    SELECT
        o.CustomerID,
        SUM(o.Freight) AS TotalFreight,
        MIN(o.Freight) AS LeastFreight
    FROM Sales.Orders o
    WHERE o.Freight > 50
    GROUP BY o.CustomerID
)
SELECT
    cs.CustomerID,
    cs.TotalFreight,
    cs.LeastFreight
FROM CustomerSales cs
ORDER BY cs.TotalFreight DESC;
24.
SELECT
    YEAR(OrderDate) AS SaleYear,
    MONTH(OrderDate) AS SaleMonth,
    SUM(SaleAmount) AS TotalSales,
    COUNT(DISTINCT ProductID) AS UniqueProductsSold
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING COUNT(DISTINCT ProductID) >= 2
ORDER BY SaleYear, SaleMonth;
25.
SELECT
    YEAR(OrderDate) AS OrderYear,
    MIN(Quantity) AS MinQuantity,
    MAX(Quantity) AS MaxQuantity
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;
