1. 
BULK INSERT bu nima va uning maqsadi nima?
Ta’rifi:
BULK INSERT — bu SQL Server’da tashqi fayldan (odatda .txt, .csv yoki shunga o‘xshash formatdagi fayllardan)
ma’lumotlarni to‘g‘ridan-to‘g‘ri jadvalga yuklash uchun ishlatiladigan buyruqdir.
Maqsadi:
BULK INSERT buyruğining asosiy maqsadi — katta hajmdagi ma’lumotlarni tez va samarali tarzda SQL jadvaliga import qilish. 
Bu usul qo‘lda yozuv kiritish yoki oddiy INSERT operatorlariga qaraganda ancha tez ishlaydi.
2.
SQL Server’ga import qilish mumkin bo‘lgan to‘rtta fayl formati:
 **CSV (Comma-Separated Values)** — ustunlar vergul bilan ajratilgan matn fayli.
 **TXT (Plain Text)** — oddiy matn fayli, odatda maxsus ajratkichlar (masalan, tab) bilan formatlangan.
 **XML (eXtensible Markup Language)** — tuzilgan ma’lumotlar bilan ishlash uchun ishlatiladi.
 **JSON (JavaScript Object Notation)** — yarim tuzilgan ma’lumotlar formati, zamonaviy web ilovalarda keng qo‘llaniladi.
3.
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);
4.
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (1, 'Laptop', 999.99);
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (2, 'Mouse', 25.50);
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (3, 'Keyboard', 45.75);
5.
NULL qiymat — ustunga hech qanday qiymat kiritilmaganligini, ya’ni noma’lum yoki mavjud emasligini bildiradi.
Bu "nol" (0) yoki "bo‘sh matn" emas — bu qiymat yo‘qligi degani.
Masalan, mijoz telefon raqami noma’lum bo‘lsa, PhoneNumber ustuniga NULL yoziladi.
NOT NULL cheklovi — ushbu ustunga albatta qiymat kiritilishi kerak degan ma’noni anglatadi.
Agar NOT NULL deb e’lon qilgan ustunga qiymat bermasangiz, ma’lumotlar bazasi xatolik beradi.
6.
ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);
7.
-- Bu so'rov Products jadvalidan barcha yozuvlarni olib keladi
SELECT * FROM Products;
/*
Bu so'rov Products jadvalidan barcha mahsulotlarni tanlab oladi.
Natijada barcha ustunlar va barcha qatorlar ko'rsatiladi.
*/
SELECT * FROM Products;
8.
ALTER TABLE Products
ADD CategoryID INT;
ALTER TABLE Products
ADD CategoryID INT NOT NULL;
9.
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);
10.
SQL Server’da IDENTITY ustunining maqsadi:
IDENTITY ustuni — bu avtomatik inkrement (ortib boruvchi) qiymat beruvchi ustun.
Asosiy maqsadi:
Har bir yangi yozuv qo‘shilganda, IDENTITY ustuni o‘z-o‘zidan avtomatik tarzda qiymatini 1 (yoki siz belgilagan boshqa qiymat) ga oshirib boradi.
Bu ustun ko‘pincha asosiy kalit (PRIMARY KEY) sifatida ishlatiladi, chunki u har doim noyob va takrorlanmas qiymatlarni beradi.
Foydasi:
Ma’lumotlarni qo‘lda kiritishda ID larni alohida hisoblash va boshqarish shart emas.
Dasturchilar va foydalanuvchilar uchun qulaylik tug‘iladi, chunki avtomatik raqam beriladi.
Ma’lumotlar bazasida yozuvlarni noyob identifikatsiyalash osonlashadi.
11.
BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',  -- ustunlar orasidagi ajratuvchi
    ROWTERMINATOR = '\n',   -- qatorlar orasidagi ajratuvchi (yangi qator)
    FIRSTROW = 1            -- fayldan qaysi qatordan boshlab o‘qish (1-qatordan boshlab)
);
12.
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);
13.
 PRIMARY KEY
Asosiy kalit hisoblanadi va har bir jadvalda faqat bitta bo‘lishi mumkin.
Ustundagi qiymatlar takrorlanmasligi va NULL bo‘lmasligi (ya’ni NOT NULL) majburiy.
Asosan har bir yozuvni noyob identifikatsiyalash uchun ishlatiladi.
SQL Server avtomatik ravishda PRIMARY KEY ustuniga indeks yaratadi.
 UNIQUE KEY
Jadvalda bir nechta UNIQUE kalitlar bo‘lishi mumkin.
Ustundagi qiymatlar takrorlanmasligi kerak, lekin NULL qiymatlar bo‘lishi mumkin (ba’zi DBMSlarda UNIQUE ustunida bir nechta NULL bo‘lishiga ruxsat beriladi).
Asosan ma’lum ustunlarda takrorlanmas qiymatlarni ta’minlash uchun ishlatiladi, lekin asosiy kalit emas.
SQL Server UNIQUE kalit ustuniga ham indeks yaratadi.
14.
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2) CHECK (Price > 0)
);
15.
Modify the Products table to add a column Stock (INT, NOT NULL).
16.
SELECT 
    ProductID,
    ProductName,
    ISNULL(Price, 0) AS Price
FROM Products;
17.
FOREIGN KEY — bu jadvaldagi bir ustunni (yoki ustunlar guruhini) boshqa jadvaldagi asosiy kalit (PRIMARY KEY) yoki UNIQUE ustunga bog‘laydigan cheklov.
Maqsadi — referensial yaxlitlikni (referential integrity) ta’minlash, ya’ni ma’lumotlar bazasida bog‘liq yozuvlarning izchilligi va yaxlitligini saqlash.
Bu yordamida jadvaldagi qiymatlar faqat boshqa jadvaldagi mavjud qiymatlar bilan mos kelishi kerak bo‘ladi.
Foydalari:
Ma’lumotlarning to‘g‘riligini ta’minlaydi: Masalan, Orders jadvalidagi CustomerID faqat Customers jadvalidagi mavjud CustomerID ga mos kelishi mumkin.
Ma’lumotlar bog‘lanishini yaratadi: Jadvaldagi bog‘liq ma’lumotlar orasidagi munosabatlarni ifodalaydi.
Ma’lumotlarning noto‘g‘ri o‘chirilishini yoki kiritilishini oldini oladi: Masalan, Categories jadvalidagi kategoriya o‘chirilsa, 
unga bog‘langan Products yozuvlari bilan bog‘liq muammolar yuzaga kelmasligi uchun cheklov ishlaydi.
Sintaksis va misol:
ALTER TABLE ChildTable
ADD CONSTRAINT FK_Child_Parent
FOREIGN KEY (ChildColumn) REFERENCES ParentTable(ParentColumn);
Misol uchun:
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);
Qanday ishlaydi?
Products jadvalidagi CategoryID ustuni faqat Categories jadvalidagi mavjud CategoryID qiymatlarini qabul qiladi.
Agar Products jadvaliga CategoryID bo‘yicha mavjud bo‘lmagan qiymat kiritilsa, SQL Server xatolik beradi.
Shuningdek, Categories jadvalidan ma’lum CategoryID ni o‘chirishga urinishda, agar unga bog‘langan Products bo‘lsa,
o‘chirish amalga oshmaydi yoki kaskadli o‘chirish sozlanmagan bo‘lsa, xatolik yuz beradi.
18.
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT CHECK (Age >= 18)
);
19.
CREATE TABLE MyTable (
    ID INT IDENTITY(100, 10) PRIMARY KEY,
    SomeData VARCHAR(50)
);
20.
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);
21.
 ISNULL
SQL Server-ga xos funksiya.
Bitta qiymatni tekshiradi, agar u NULL bo‘lsa, ikkinchi qiymatni qaytaradi.
ISNULL(expression, replacement_value)
Misol:
SELECT ISNULL(Price, 0) AS Price FROM Products;
Agar Price NULL bo‘lsa, 0 qaytaradi.
Faqat ikki argument qabul qiladi.
 COALESCE
Standart SQL funksiyasi, ko‘p platformalarda ishlaydi.
Bir nechta qiymatlarni ketma-ket tekshiradi va birinchi NULL bo‘lmagan qiymatni qaytaradi.
COALESCE(value1, value2, ..., valueN)
Misol:
SELECT COALESCE(NULL, NULL, Price, 0) AS Price FROM Products;
Bu yerda Price birinchi NULL bo‘lmagan qiymat sifatida olinadi, agar hammasi NULL bo‘lsa, 0 qaytariladi.
Ko‘p argument qabul qiladi.
Asosiy farqlar:
Xususiyat	ISNULL	COALESCE
Platforma	Faqat SQL Server	Standart SQL, ko‘p DBMSlarda
Argumentlar soni	2	Bir nechta (2 va undan ko‘p)
Funktsional imkoniyat	Bitta qiymat va almashtirish	Ko‘p qiymatlarni ketma-ket tekshiradi
Tipni qaytarish	Birinchi argumentga qarab	Argumentlar orasida kengroq tip qo‘llanadi
Qachon qaysi birini ishlatish?
Agar faqat ikki qiymatni tekshirish kerak bo‘lsa va faqat SQL Server bilan ishlayotgan bo‘lsangiz, ISNULL qulay.
Agar bir nechta qiymatdan birinchi NOT NULL qiymatni olish kerak bo‘lsa yoki boshqa DBMS bilan ham ishlashni ko‘zda tutgan bo‘lsangiz, COALESCE yaxshiroq.
22.
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);
23.
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
ON DELETE CASCADE
ON UPDATE CASCADE;
