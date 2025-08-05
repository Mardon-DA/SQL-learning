Basic-Level Tasks (10)

CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees (EmpID, Name, Salary) VALUES (1, 'Ali', 6000.00);
INSERT INTO Employees (EmpID, Name, Salary) VALUES (2, 'Laylo', 5500.50);

UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1;

DELETE FROM Employees
WHERE EmpID = 2;

| Buyruq     | Maqsadi                                               | Jadval tuzilmasiga ta’siri |
| ---------- | ----------------------------------------------------- | -------------------------- |
| `DELETE`   | Jadvaldagi tanlangan ma’lumotlarni o‘chiradi          | Tuzilma saqlanadi          |
| `TRUNCATE` | Jadvaldagi **barcha** ma’lumotlarni tozalaydi         | Tuzilma saqlanadi          |
| `DROP`     | Jadvalni butunlay o‘chiradi (strukturasi bilan birga) | Tuzilma ham o‘chadi        |

ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

ALTER TABLE Employees
ADD Department VARCHAR(50);

ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

TRUNCATE TABLE Employees;

Intermediate-Level Tasks (6)

-- 1-variant: INSERT INTO ... SELECT orqali 5 ta yozuv kiritish (fake data bilan)
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'HR' UNION ALL
SELECT 2, 'Finance' UNION ALL
SELECT 3, 'IT' UNION ALL
SELECT 4, 'Marketing' UNION ALL
SELECT 5, 'Logistics';

UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

TRUNCATE TABLE Employees;

ALTER TABLE Employees
DROP COLUMN Department;

EXEC sp_rename 'Employees', 'StaffMembers';

DROP TABLE Departments;

Advanced-Level Tasks (9)

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2) CHECK (Price > 0)
);

ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity) VALUES
(1, 'Laptop', 'Electronics', 1200.00, DEFAULT),
(2, 'Desk Chair', 'Furniture', 150.50, DEFAULT),
(3, 'Coffee Mug', 'Kitchenware', 12.99, DEFAULT),
(4, 'Notebook', 'Stationery', 5.25, DEFAULT),
(5, 'Smartphone', 'Electronics', 800.00, DEFAULT);

SELECT * INTO Products_Backup FROM Products;

EXEC sp_rename 'Products', 'Inventory';

ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

CREATE TABLE Inventory_New (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50),
    Price FLOAT,
    StockQuantity INT DEFAULT 50,
    ProductCode INT IDENTITY(1000,5)
);

INSERT INTO Inventory_New (ProductID, ProductName, ProductCategory, Price, StockQuantity)
SELECT ProductID, ProductName, ProductCategory, Price, StockQuantity FROM Inventory;

DROP TABLE Inventory;

EXEC sp_rename 'Inventory_New', 'Inventory';
