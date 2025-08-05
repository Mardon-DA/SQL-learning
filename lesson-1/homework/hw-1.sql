lesson-1 homework-1
Easy:
1.data bu malumotlar. malumotlar xar xil bulishi mumkin, masalan: son, harf, so'z, shakllar. umuman olganda xar bir narsa malumotga kiradi.
database bu malumotlar bilan oson ishlashni taminlovchi jadval.
Ma’lumotlar jadval (ustun va satr) ko‘rinishida saqlanadigan va ular orasidagi bog‘lanish (kalitlar orqali) asosida ishlovchi ma’lumotlar bazasi turi
Ma’lumotlar relatsion bazada saqlanadigan asosiy tuzilma. Har bir satr (row) – yozuv (record), har bir ustun (column) – maydon (field) hisoblanadi.

2. SQL Server’ning 5 ta asosiy xususiyati:
Ma’lumotlarni himoyalash va shifrlash imkoniyatlari
Yuqori ishonchlilik va avariyaviy tiklash (HADR) funksiyalari
Tranzaksiyalarni boshqarish imkoniyati
Saqlanadigan protseduralar, triggerlar va qarashlar (views) qo‘llab-quvvatlanadi
Masshtablanuvchanlik va ishlash tezligini oshirish vositalari (masalan: indekslash va so‘rovlarni optimallashtirish)

3.SQL Server’da mavjud bo‘lgan autentifikatsiya (kirish) turlari:
Windows autentifikatsiyasi:

Foydalanuvchining Windows tizimidagi hisobidan foydalaniladi. Bu xavfsizroq usul hisoblanadi.
SQL Server autentifikatsiyasi:
SQL Server’ning o‘zida yaratilgan foydalanuvchi nomi va parol orqali tizimga kiriladi.

Medium:
1.CREATE DATABASE SchoolDB;
USE SchoolDB;
CREATE TABLE Students (StudentID INT PRIMARY KEY, Name VARCHAR(50), Age INT);

2.SQL Server:
Microsoft tomonidan ishlab chiqilgan ma’lumotlar bazasi boshqaruv tizimi. Bu dastur ma’lumotlarni saqlash, ularga ishlov berish, himoyalash va boshqarish uchun ishlatiladi.
SSMS (SQL Server Management Studio):
SQL Server bilan ishlash uchun grafik interfeysga ega dastur. U orqali siz SQL Server bazalarini ko‘ra olasiz, SQL so‘rovlarini yozasiz, jadval va foydalanuvchilar yaratishingiz mumkin.
SQL (Structured Query Language):
Ma’lumotlar bilan ishlash uchun til. Ma’lumotlarni yaratish, o‘chirish, yangilash va qidirish uchun ishlatiladi. SQL Server aynan shu til orqali boshqariladi.

Hard:
1.DQL–Data Query Language-malumotlarni qidirish va kurish uchun ishlatiladi
Asosiy buyruq: SELECT-bu buyruq "students" jadvalidagi barcha qator va ustunlarni kursatadi.  
misol:
SELECT * FROM 'Students';

DML–Data Manipulation Language- jadvaldagi malumotlarni qoshish, tugirlash yoki uchirish uchun ishlatiladi.
INSERT, UPDATE, DELETE
misol:
INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'Ali', 20);
UPDATE Students SET Age=21 WHEREStudentID=1;
DELETE FROM Students WHERE StudentID = 1;

DDL–Data Definition Language-Jadval, baza, ustunlar yaratish yoki o‘zgartirish uchun ishlatiladi.
CREATE, ALTER, DROP
misol:
CREATE TABLE Courses (CourseID INT PRIMARY KEY, CourseName VARCHAR(100));
ALTER TABLE Students ADD Gender VARCHAR(10);
DROP TABLE Courses;

DCL–Data Control Language-Ma’lumotlarga kim kirishi mumkinligini boshqarish uchun ishlatiladi (foydalanuvchilarga huquq berish yoki olib tashlash).
GRANT, REVOKE
misol:
GRANT SELECT ON Students TO User1;
REVOKE SELECT ON Students FROM User1;

TCL–Transaction Control Language-ranzaksiyalarni (ya’ni ma’lumotlar o‘zgarish jarayonini) boshqarish uchun ishlatiladi. Bu ko‘proq DML bilan birga ishlatiladi.
COMMIT, ROLLBACK, SAVEPOINT
misol:
BEGIN TRANSACTION;
UPDATE Students SET Age = 25 WHERE StudentID = 2;
COMMIT; -- o‘zgarishni saqlash
-- yoki:
ROLLBACK; -- o‘zgarishni bekor qilish

2.
INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'Ali', 20);
INSERT INTO Students (StudentID, Name, Age) VALUES (2, 'Zarina', 22);
INSERT INTO Students (StudentID, Name, Age) VALUES (3, 'Bekzod', 19);
Students jadvaliga 3 ta yozuv (record) kiritish uchun quyidagi SQL buyruqlaridan foydalanamiz:
INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'Ali', 20);
-- Bu yerda: StudentID = 1, Ism = Ali, Yosh = 20
INSERT INTO Students (StudentID, Name, Age) VALUES (2, 'Zarina', 22);
-- Bu yerda: StudentID = 2, Ism = Zarina, Yosh = 22
INSERT INTO Students (StudentID, Name, Age) VALUES (3, 'Bekzod', 19);
-- Bu yerda: StudentID = 3, Ism = Bekzod, Yosh = 19
