/* Bước 1: Tạo cơ sở dữ liệu demo */
drop database if exists demo;
create database demo;
use demo;


/* Bước 2: Tạo bảng Products */
create table products (
id_products int auto_increment,
productCode varchar (10),
productName varchar (50),
productPrice varchar (20),
productAmount int,
productDescription varchar (255),
productStatus varchar (50),
primary key (id_products)
);

insert into products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
values
('003', 'Xiaomi Note 7', '3800000', 10, 'Xiaomi', 'Stocking'),
('002', 'Asus Rog Phone', '12000000', 5, 'Asus', 'Out of stock'),
('004', 'Realme X', '5500000', 12, 'Oppo', 'Stocking'),
('005', 'Samsung A60', '4000000', 1, 'Samsung', 'Out of stock'),
('001', 'Samsung Note 10', '13500000', 3, 'Samsung', 'Out of stock');


/* Bước 3:
Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
So sánh câu truy vấn trước và sau khi tạo index */

ALTER TABLE products ADD INDEX idx_productCode(productCode);
EXPLAIN SELECT * FROM products WHERE productCode = 5; -- Tìm tất cả sản phẩm bên trong bảng products 

-- Truy vấn trước khi tạo index 
SELECT * FROM products WHERE productCode = '005';

-- Truy vấn sau khi gọi index
CREATE UNIQUE INDEX productCode ON products(productCode);
select * from products;
EXPLAIN SELECT * FROM products WHERE productCode = '005'; -- Tìm sản phẩm có mã 005 

/* Bước 4:
Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products */
CREATE VIEW products_view AS
SELECT productCode, productName, productPrice, productStatus
FROM products; 

SELECT * FROM products_view;

/* Tiến hành sửa đổi view */
CREATE OR REPLACE VIEW products_view AS 
SELECT productCode, productName, productPrice, productStatus
FROM products
WHERE productName = 'Realme X';

SELECT * FROM products_view;

/* Tiến hành xoá view */
DROP VIEW products_view;

/* Bước 5: Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product */
DELIMITER //
CREATE PROCEDURE findAllProduct()
BEGIN
SELECT * FROM products ;
END; //
DELIMITER ; 

call findAllProduct();

/*Tạo store procedure thêm một sản phẩm mới */

DELIMITER //
CREATE PROCEDURE insertProduct(
productCode varchar (10),
productName varchar (50),
productPrice varchar (20),
productAmount int,
productDescription varchar (255),
productStatus varchar (50))
BEGIN
insert into products (productCode, productName, productPrice, productAmount, productDescription, productStatus) 
values (productCode, productName, productPrice, productAmount, productDescription, productStatus)
 ;
 SELECT * 
FROM products;
END; //
DELIMITER ; 

-- insert into products (productCode, productName, productPrice, productAmount, productDescription, productStatus) 
-- values ('006', 'Iphone X', '10000000', 5, 'Iphone', 'Stocking')

call insertProduct('009', 'Iphone Xss', '10000000', 5, 'Iphone', 'Stocking');

SELECT * 
FROM products

/* Tạo store procedure sửa thông tin sản phẩm theo id */
DELIMITER //
DROP PROCEDURE IF EXISTS `editProductByID`//
CREATE PROCEDURE editProductByID(id int,
product_Code varchar (10),
product_Name varchar (50),
product_Price varchar (20),
product_Amount int,
product_Description varchar (255),
product_Status varchar (50))
BEGIN
  update  products set productCode=product_code,
  productName=product_Name,
  productPrice=product_Price,
  productAmount=product_Amount,
  productDescription=product_Description,
  productStatus=product_Status
  where  id_products = id;
END; //
DELIMITER ;

call editProductByID(5,'009', 'Iphone Xss', '10000000', 5, 'Iphone', 'Stocking');
SELECT * 
FROM products

/* Tạo store procedure xoá sản phẩm theo id */
DELIMITER //
CREATE PROCEDURE delete_id(id int)
BEGIN
  DELETE FROM products
  WHERE id_products = id;
  select * from products;
END; //
DELIMITER ;   

call delete_id(6);