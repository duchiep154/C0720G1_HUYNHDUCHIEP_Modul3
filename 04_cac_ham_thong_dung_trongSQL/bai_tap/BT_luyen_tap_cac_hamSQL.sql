drop database if exists BT_luyen_tap_cac_hamSQL;
create database BT_luyen_tap_cac_hamSQL;
use BT_luyen_tap_cac_hamSQL;

drop table if exists students;
create table students (
id int primary key auto_increment,
name_student varchar (50),
age int,
course varchar(50),
total_money int
);

insert into students (name_student, age, course, total_money)
values
('Hoang', 21, 'CNTT', 400000),
('Viet',19,'DTVT', 320000),
('Thanh', 18, 'KTDN', 400000),
('Nhan', 19, 'CK', 450000),
('Huong',20, 'TNCH', 500000),
('Huong',20, 'TNCH', 200000);

-- Viết câu lệnh hiện thị tất cả các dòng có tên là Huong
SELECT *
FROM students
WHERE name_student = 'Huong';

-- Viết câu lệnh lấy ra tổng số tiền của Huong
SELECT name_student, SUM(total_money)
FROM students
WHERE name_student = 'Huong';

-- Viết câu lệnh lấy ra tên danh sách của tất cả học viên, không trùng lặp
SELECT distinct name_student
FROM students;