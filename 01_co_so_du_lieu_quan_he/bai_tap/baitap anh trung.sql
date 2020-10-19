Create database `bai tap`;
Create table Product (
id int,
name nvarchar(50),
UmageUrl nvarchar(1000),
Price int,
Discount int,
Stock int,
CatoloryID int,
SupplierID int,
Description nvarchar(200)
);

create table Orders (
id int,
CreateDate datetime,
ShippedDate datetime,
Status varchar(50),
Description nvarchar(2),
ShippingAddress nvarchar(500),
ShippingCity nvarchar(50),
PaymentType varchar(20),
CustomerId varchar(50),
EmployeeId varchar(50)

);