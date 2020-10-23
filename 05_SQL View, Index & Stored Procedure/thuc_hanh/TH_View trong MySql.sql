use classicmodels;

/* Tạo View có tên customer_views truy vấn dữ liệu từ bảng customers để lấy các dữ liệu: customerNumber, customerName, phone bằng câu lệnh SELECT */

CREATE VIEW customer_views AS
SELECT customerNumber, customerName, phone
FROM  customers;

select * from customer_views;

/* Cập nhật view */
-- Trong câu lệnh SELECT định nghĩa view không được sử dụng từ khoá DISTINCT, TOP, GROUP BY, HAVING, ORDER_BY và UNION.
CREATE OR REPLACE VIEW customer_views AS
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
FROM customers
WHERE city = 'Nantes';

select * from customer_views;

/* Xóa view */
-- DROP VIEW view_name;

DROP VIEW customer_views;
select * from customer_views;