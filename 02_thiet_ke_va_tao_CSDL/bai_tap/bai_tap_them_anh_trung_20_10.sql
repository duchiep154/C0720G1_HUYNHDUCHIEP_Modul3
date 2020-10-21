create database `bai tap them 20/10`;
create table Categories (
id_categories int  auto_increment primary key,
name nvarchar(50)  unique,
description nvarchar(5000) default null 

);
create table Suppliers (
id_suppliers int auto_increment primary key,
Name nvarchar(100) not null,
email varchar(50) not null unique,
PhoneNumber varchar(50) default null ,
Address nvarchar(500) not null
);

create table Customers (
id_customers varchar(50) primary key,
firstname nvarchar(50) not null,
lastname nvarchar(50) not null,
phoneNumber varchar(50) default null,
address nvarchar(500) not null,
email varchar(50) not null unique,
birthday date default null
);
create table Employee(
id_employee varchar(50) not null primary key,
firstname nvarchar(50) not null,
lastname nvarchar(50) not null,
phoneNumber varchar(50) default null,
address nvarchar(500) not null,
email varchar(50) not null unique,
birthday date default null
);
create table Products(
id_product int primary key,
name_product nvarchar(50) not null,
imageUrl nvarchar(1000) not null,
price int not null default(0) check(price >= 0),
discount int not null default(0) check(discount between 0 and 100),
stock int not null default(0),
id_categories int not null,
id_suppliers int not null,
description blob 

);
create table Orders(
id_oder int auto_increment primary key,
createdDate datetime not null default(current_timestamp()) ,
shippedDate datetime ,
Status varchar(50) not null default('waiting'),
description blob ,
shippingAddress nvarchar(500) not null,
ShippingCity nvarchar(50) not null,
paymentType varchar(20) default('cash'),
id_customers varchar(50) not null ,
id_employee varchar(50) not null

);
create table OrdersDetails(
id_orderdetails int auto_increment primary key,
id_oder int not null,
id_product int not null,
quantity int
);

alter table products
 add constraint products_Categories_fk
 foreign key(id_categories)
 references Categories(id_categories);
 alter table products
 add constraint products_Suppliers_fk
 foreign key(id_suppliers)
 references Suppliers(id_suppliers);
 
 alter table orders
 add constraint orders_Customers_fk 
 foreign key(id_customers) 
 references Customers(id_customers);
 alter table orders
 add constraint orders_Employee_fk
 foreign key(id_employee)
 references employee(id_employee);
 
 alter table OrdersDetails
 add constraint OrdersDetails_orders_fk
 foreign key(id_oder)
 references orders(id_oder);
 alter table OrdersDetails
 add constraint OrdersDetails_products_fk
 foreign key(id_product)
 references products(id_product);
 
 alter table orders
 add constraint createdDate check( shippedDate >= createdDate);
  alter table orders
 add constraint shippedDate check( shippedDate >= createdDate);
 





