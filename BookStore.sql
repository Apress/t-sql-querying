CREATE DATABASE BookStore;
GO
USE BookStore;
GO
CREATE SCHEMA Sales Authorization dbo;
GO
CREATE SCHEMA HR Authorization dbo;
GO
CREATE SCHEMA Production Authorization dbo;
GO

CREATE TABLE Sales.Customers
(CustomerID smallint PRIMARY KEY,
 FirstName varchar(15),
 LastName varchar(15),
 Address varchar(50),
 City varchar(20),
 State char(2),
 ZipCode char(5),
 ClubID tinyint);
GO

CREATE TABLE HR.Employees
(EmpID int IDENTITY PRIMARY KEY,
 FirstName varchar(15),
 LastName varchar(15),
 Address varchar(50),
 City varchar(20),
 State char(2),
 ZipCode char(5),
 HireDate date,
 MgrID int);
GO

CREATE TABLE Sales.Orders
(OrderID int IDENTITY PRIMARY KEY,
 EmpID int,
 CustID smallint,
 ProductID int,
 Qty tinyint,
 OrderDate date);
GO

CREATE TABLE Production.Products
(ProductID int PRIMARY KEY,
 ProductName varchar(50),
 Price smallmoney);
 GO

 INSERT INTO Sales.Customers
 VALUES (250, 'Andy', 'Anderson', '123 Main Street', 'Chicago', 'IL', '60007', 1),
 (255, 'Jeff', 'Rollins', '1984 Victory Square', 'Los Angeles', 'CA', '90001', 0),
 (267, 'Bob', 'Smith', '55 Beaker Steet', 'Chicago', 'IL', '60007', 1),
 (278, 'Jenny', 'Jefferson', '20323 HighRise Avenue', 'New York', 'NY', '10013', 0),
 (388, 'Cindy', 'Samuels', '452 Electric Avenue', 'New York', 'NY', '10013', 2),
 (433, 'Larry', 'Daniels', '11604 Meridian Street', 'Indianapolis', 'IN', '46032', 2),
 (452, 'Danny', 'Laurels', '9603 96th Street', 'Indianapolis', 'IN', '46077', 2),
 (476, 'Peyton', 'Wayne', '1825 Jackson Road', 'Indianapolis', 'IN', '46213', 1),
 (512, 'Sandy', 'Summerstone', '767 Seashore Lane', 'Indianapolis', 'IN', '4204', 0),
 (526, 'Penny', 'Layne', '11011 Meridian Street', 'Indianapolis', 'IN', '46077', 2)
GO

INSERT INTO HR.Employees
VALUES ('Jackson', 'Johnson', '422 Pinewood Drive', 'Indianapolis', 'IN', '46032', '08/02/2002', NULL),
('Amari', 'Underwood', '3452 Samson Road', 'Houston', 'TX', '77001', '04/22/2005', 1),
('Becky', 'Lightyear', '379 Golden Lane', 'Los Angeles', 'CA', '90210', '05/21/2003', 2),
('Susan', 'Spencer', '17452 Emerson Lake', 'Houston', 'TX', '77001', '08/23/2015', 2),
('Bucky', 'Denton', '1978 Homerun Road', 'New York', 'NY', '10011', '07/20/2008', 3),
('Mariano', 'Reliever', '199 Fenway Avenue', 'Houston', 'TX', '77001', '04/13/2003', 2),
('Brian', 'Rizzo', '2016 Champion Way', 'Indianapolis', 'IN', '46007', '11/02/2016', 3),
('Reggie', 'Sanders', '674 Parkview Court', 'Indianapolis', 'IN', '46007', '04/12/2006', 4)
GO

INSERT INTO Production.Products
VALUES (23569,'Writing T-SQL Queries', 19.95),
(23570, 'Selecting from Multiple Tables', 21.99),
(23571, 'Using Functions and Grouping', 18.95),
(23572, 'Creating and Designing Tables', 19.95) 
GO

INSERT INTO Sales.Orders
VALUES(1, 250, 23569, 3, '08/18/2018'),
(1, 250, 23570, 3, '08/18/2018'),
(1, 250, 23571, 5, '08/18/2018'),
(2, 255, 23570, 2, '08/19/2018'),
(3, 278, 23569, 4, '08/19/2018'),
(3, 290, 23570, 3, '08/19/2018'),
(4, 388, 23569, 2, '08/20/2018'),
(5, 388, 23570, 4, '08/20/2018'),
(2, 402, 23571, 1, '08/20/2018'),
(3, 433, 23572, 5, '08/21/2018'),
(6, 452, 23570, 2, '08/22/2018'),
(6, 452, 23572, 4, '08/22/2018'),
(7, 433, 23570, 3, '08/23/2018'),
(7, 433, 23572, 2, '08/23/2018')
GO

ALTER TABLE Sales.Orders WITH NOCHECK
ADD CONSTRAINT FK_Cust_Ord FOREIGN KEY (CustID)
REFERENCES Sales.Customers(CustomerID)
ON UPDATE CASCADE ON DELETE SET NULL

ALTER TABLE Sales.Orders
ADD CONSTRAINT FK_Prod_Ord FOREIGN KEY(ProductID)
REFERENCES Production.Products(ProductID)

ALTER TABLE Sales.Orders
ADD CONSTRAINT FK_Emp_Ord FOREIGN KEY(EmpID)
REFERENCES HR.Employees(EmpID)
