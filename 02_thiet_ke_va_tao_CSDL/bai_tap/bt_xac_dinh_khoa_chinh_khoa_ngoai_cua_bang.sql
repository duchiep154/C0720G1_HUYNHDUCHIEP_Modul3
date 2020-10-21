Create database `BT_xac_dinh_khoa_chinh_khoa_ngoai`;
Create table Customers(
customer_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fullname VARCHAR(255) NOT NULL,
address Varchar(255) not null,
email varchar(255) not null,
phone varchar(11) not null



);
Create table Accounts(
account_number int not null auto_increment primary key,
account_type varchar(60) not null ,
date date not null,
balance int(255) not null,

FOREIGN KEY (account_number)REFERENCES Customers (customer_number)
);
create table Transactions(
tran_number int not null primary key,
account_number int not null,
date datetime not null,
amounts int not null,
descriptions varchar(255) ,
foreign key (account_number) references Accounts (account_number)


);