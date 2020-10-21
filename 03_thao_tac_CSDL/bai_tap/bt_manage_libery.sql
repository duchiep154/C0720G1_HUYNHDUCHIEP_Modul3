drop database if exists manage_borrow_return_book;
create database manage_borrow_return_book;
use manage_borrow_return_book;

-- Tạo bảng student
create table students(
student_number varchar(10) primary key,
student_name varchar(50),
student_address varchar(50),
student_email varchar(50),
student_image varchar(100)
);

-- Tạo bảng loại sách
create table type_of_book(
id varchar(10) primary key,
`name` varchar(50)
);

-- Tạo bảng library card
create table libarys_card(
libary_number varchar(10) primary key,
libary_student_name varchar(50),
libary_student_day_of_birth date,
libary_student_address varchar(50),
libary_student_email varchar(50),
libary_student_phone varchar(50),
libary_student_image varchar(100),
libary_student_number varchar(10),
constraint fk foreign key(libary_student_number) references students(student_number)
);

-- Tạo bảng borrowoder
create table borrowoders(
borrowoder_number varchar(10) primary key,
borrowoder_student_name varchar(50),
borowoder_book_name varchar(50),
date_borrow date,
date_return date,
borrowoder_libary_number varchar(10),
constraint fk_borrowoder foreign key(borrowoder_libary_number) references libarys_card(libary_number)
);

-- Tạo bảng book
create table books(
book_number varchar(10) primary key,
book_name varchar(200),
book_author varchar(50),
book_publisher varchar(50),
book_publishing_year date,
number_of_publications int,
buyprice int,
book_image varchar(100),
book_borrowoder_number varchar(10),
book_type_number varchar(10),
constraint fk_book_borrowoder foreign key(book_borrowoder_number) references borrowoders(borrowoder_number),
constraint fk_type foreign key(book_type_number) references type_of_book(id) 
);