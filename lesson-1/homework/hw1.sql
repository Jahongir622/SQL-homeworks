1. Definitions

Data:
Raw facts and figures that can be recorded and processed. Examples: numbers, text, images, or measurements.

Database:
An organized collection of related data stored in a structured way so it can be easily retrieved, managed, and updated.

Relational Database (RDB):
A type of database that stores data in tables (rows and columns). The tables are related to each other through keys (primary key, foreign key). Example: SQL Server, MySQL, Oracle.

Table:
A structured format inside a database where data is stored in rows (records) and columns (fields). For example, a Students table may have columns like StudentID, Name, and Grade.

2. Five Key Features of SQL Server

Data Storage & Management – Stores structured data in relational tables.

Security – Provides authentication, authorization, and encryption to protect data.

High Availability & Disaster Recovery (HADR) – Features like Always On, backups, and replication.

Scalability & Performance – Optimized query engine, indexing, partitioning, and in-memory processing.

Integration & BI Tools – Works with SSIS (integration), SSRS (reporting), SSAS (analysis) for business intelligence.

3. Authentication Modes in SQL Server

There are two main authentication modes:

Windows Authentication

Uses the Windows user account to log in.

Integrated security → no separate SQL Server username/password needed.

More secure and recommended.

SQL Server Authentication

Uses a username & password created inside SQL Server.

Works even if the user isn’t on the Windows domain.

Often used for applications or external connections.

4. Create Database & Table in SSMS

In SQL Server Management Studio (SSMS)
-- Create new database
CREATE DATABASE SchoolDB;
GO

-- Switch to SchoolDB
USE SchoolDB;
GO

-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);

This creates:

A database named SchoolDB.

A table Students with three columns:

StudentID → integer, primary key (unique for each student).

Name → string (up to 50 characters).

Age → integer.
    
5. Differences Between SQL Server, SSMS, and SQL
SQL (Structured Query Language) A programming language used to interact with databases 
    (e.g., SELECT, INSERT, UPDATE). It’s a standard, not tied to one company.
SQL Server Microsoft’s Relational Database Management System (RDBMS) that stores and manages data. It understands SQL queries and executes them.
SSMS (SQL Server Management Studio) A tool/application provided by Microsoft to connect to SQL Server, 
    write queries, manage databases, and visualize data with a GUI.
    
--An addtional hometask by Mentor 
-- Create Database
CREATE DATABASE UzbekistanDB;
GO
USE UzbekistanDB;
GO

-- 1. Regions Table
CREATE TABLE Regions (
    RegionID INT PRIMARY KEY,
    RegionName NVARCHAR(100),
    Population INT,
    Area_km2 INT
);

INSERT INTO Regions VALUES
(1, 'Tashkent', 2600000, 334),
(2, 'Samarkand', 1100000, 120),
(3, 'Bukhara', 890000, 41),
(4, 'Fergana', 1300000, 70),
(5, 'Andijan', 1200000, 74),
(6, 'Namangan', 980000, 77),
(7, 'Khorezm', 700000, 63);

-- 2. Hospitals
CREATE TABLE Hospitals (
    HospitalID INT PRIMARY KEY,
    HospitalName NVARCHAR(150),
    RegionID INT,
    Capacity INT,
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);

INSERT INTO Hospitals VALUES
(1, 'Tashkent Central Hospital', 1, 500),
(2, 'Samarkand Regional Clinic', 2, 300),
(3, 'Bukhara Health Center', 3, 250),
(4, 'Fergana City Hospital', 4, 350),
(5, 'Andijan General Hospital', 5, 400),
(6, 'Namangan Medical Center', 6, 280),
(7, 'Khorezm Provincial Hospital', 7, 220);

-- 3. Supermarkets
CREATE TABLE Supermarkets (
    SupermarketID INT PRIMARY KEY,
    SupermarketName NVARCHAR(150),
    RegionID INT,
    OpenHours NVARCHAR(50),
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);

INSERT INTO Supermarkets VALUES
(1, 'Korzinka Tashkent', 1, '08:00-22:00'),
(2, 'Makro Samarkand', 2, '09:00-23:00'),
(3, 'Green Bukhara', 3, '08:00-22:00'),
(4, 'Asia Market Fergana', 4, '07:00-23:00'),
(5, 'Mega Andijan', 5, '09:00-22:00'),
(6, 'Namangan Fresh', 6, '08:00-21:00'),
(7, 'Khorezm Market', 7, '09:00-21:00');

-- 4. Businesses
CREATE TABLE Businesses (
    BusinessID INT PRIMARY KEY,
    BusinessName NVARCHAR(150),
    RegionID INT,
    BusinessType NVARCHAR(100),
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);

INSERT INTO Businesses VALUES
(1, 'UzAuto Motors', 1, 'Automobile'),
(2, 'Samarkand Silk Factory', 2, 'Textile'),
(3, 'Bukhara Carpet Export', 3, 'Handicrafts'),
(4, 'Fergana Oil Company', 4, 'Energy'),
(5, 'Andijan Electronics', 5, 'Retail'),
(6, 'Namangan AgroTech', 6, 'Agriculture'),
(7, 'Khorezm Cotton Ltd', 7, 'Agriculture');

-- 5. Universities
CREATE TABLE Universities (
    UniversityID INT PRIMARY KEY,
    UniversityName NVARCHAR(150),
    RegionID INT,
    EstablishedYear INT,
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);

INSERT INTO Universities VALUES
(1, 'Tashkent State University', 1, 1918),
(2, 'Samarkand State University', 2, 1927),
(3, 'Bukhara State University', 3, 1930),
(4, 'Fergana State University', 4, 1932),
(5, 'Andijan State University', 5, 1937),
(6, 'Namangan State University', 6, 1942),
(7, 'Urgench State University', 7, 1945);

-- 6. Schools
CREATE TABLE Schools (
    SchoolID INT PRIMARY KEY,
    SchoolName NVARCHAR(150),
    RegionID INT,
    StudentsCount INT,
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);

INSERT INTO Schools VALUES
(1, 'School No.1 Tashkent', 1, 1200),
(2, 'School No.5 Samarkand', 2, 800),
(3, 'School No.3 Bukhara', 3, 700),
(4, 'School No.7 Fergana', 4, 950),
(5, 'School No.4 Andijan', 5, 1000),
(6, 'School No.6 Namangan', 6, 880),
(7, 'School No.2 Khorezm', 7, 600);

-- 7. Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FullName NVARCHAR(150),
    SchoolID INT,
    Grade INT,
    FOREIGN KEY (SchoolID) REFERENCES Schools(SchoolID)
);

INSERT INTO Students VALUES
(1, 'Ali Karimov', 1, 9),
(2, 'Dilnoza Akhmedova', 2, 10),
(3, 'Jasur Rakhmatov', 3, 11),
(4, 'Malika Usmonova', 4, 9),
(5, 'Rustam Kamilov', 5, 10),
(6, 'Nodira Tursunova', 6, 11),
(7, 'Sherzod Bekmurodov', 7, 8);

-- 8. Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FullName NVARCHAR(150),
    BusinessID INT,
    Position NVARCHAR(100),
    Salary DECIMAL(10,2),
    FOREIGN KEY (BusinessID) REFERENCES Businesses(BusinessID)
);

INSERT INTO Employees VALUES
(1, 'Aziz Rasulov', 1, 'Engineer', 1500.00),
(2, 'Laylo Ismailova', 2, 'Designer', 1200.00),
(3, 'Bekzod Sharipov', 3, 'Manager', 1300.00),
(4, 'Nargiza Yuldasheva', 4, 'Technician', 1000.00),
(5, 'Sardor Ergashev', 5, 'Salesman', 1100.00),
(6, 'Zulfiya Karimova', 6, 'Agronomist', 1250.00),
(7, 'Shaxzod Akbarov', 7, 'Supervisor', 1150.00);

-- 9. Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(150),
    SupermarketID INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (SupermarketID) REFERENCES Supermarkets(SupermarketID)
);

INSERT INTO Products VALUES
(1, 'Bread', 1, 3000),
(2, 'Milk', 2, 6000),
(3, 'Rice', 3, 9000),
(4, 'Sugar', 4, 8500),
(5, 'Tea', 5, 15000),
(6, 'Oil', 6, 18000),
(7, 'Meat', 7, 65000);

-- 10. Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName NVARCHAR(150),
    RegionID INT,
    PhoneNumber NVARCHAR(20),
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);

INSERT INTO Customers VALUES
(1, 'Otabek Mirzaev', 1, '+998901234567'),
(2, 'Nigora Rustamova', 2, '+998911112233'),
(3, 'Javohir Sobirov', 3, '+998933334455'),
(4, 'Dildora Saidova', 4, '+998944445566'),
(5, 'Ulugbek Anvarov', 5, '+998955556677'),
(6, 'Zarina Kamalova', 6, '+998966667788'),
(7, 'Shahnoza Jalilova', 7, '+998977778899');
