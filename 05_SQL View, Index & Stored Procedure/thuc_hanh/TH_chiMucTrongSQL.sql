use classicmodels;

SELECT * FROM customers WHERE customerNumber = 175; 

-- bạn thêm chỉ mục cho bảng customers như sau:
-- ALTER TABLE customers ADD INDEX idx_customerNumber(customerNumber);
ALTER TABLE customers ADD INDEX idx_customerNumber(customerNumber);
EXPLAIN SELECT * FROM customers WHERE customerNumber = 175;

-- Add index theo cặp như bạn add index cho cặp contactFirstName và contactLastName.
-- ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
ALTER TABLE customers ADD INDEX idx_customerName(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';

-- xoá chỉ mục trong bảng, bạn làm như sau:
-- ALTER TABLE customers DROP INDEX idx_full_name;

ALTER TABLE customers DROP INDEX idx_customerNumber;