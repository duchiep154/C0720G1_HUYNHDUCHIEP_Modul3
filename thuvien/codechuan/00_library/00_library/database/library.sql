CREATE DATABASE library;

USE library;

CREATE TABLE book(
book_id INT AUTO_INCREMENT NOT NULL,
book_name VARCHAR(50) NOT NULL,
book_cost DOUBLE NOT NULL,
description VARCHAR(500),
category_id INT NOT NULL,
author_id INT NOT NULL,
publisher_id INT,
PRIMARY KEY (book_id)
);

CREATE TABLE category(
category_id INT AUTO_INCREMENT NOT NULL,
category_name VARCHAR(50) NOT NULL,
PRIMARY KEY (category_id)
);

CREATE TABLE author(
author_id INT AUTO_INCREMENT NOT NULL,
author_name VARCHAR(50) NOT NULL,
PRIMARY KEY (author_id)
);

CREATE TABLE publisher(
publisher_id INT AUTO_INCREMENT NOT NULL,
publisher_name VARCHAR(50) NOT NULL,
PRIMARY KEY (publisher_id)
);


ALTER TABLE book
ADD CONSTRAINT fk_book_category FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE,
ADD CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES author(author_id) ON DELETE CASCADE,
ADD CONSTRAINT fk_book_publisher FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id) ON DELETE CASCADE;


INSERT INTO category(category_name) VALUES ('Sách thiếu nhi');
INSERT INTO category(category_name) VALUES ('Sách kỹ năng');
INSERT INTO category(category_name) VALUES ('Sách văn học');
INSERT INTO category(category_name) VALUES ('Sách kinh tế');
INSERT INTO category(category_name) VALUES ('Sách kiến thức - tổng hợp');


INSERT INTO author(author_name) VALUES ('Diệp Lạc Vô Tâm');
INSERT INTO author(author_name) VALUES ('Đường Gia Tam Thiếu');
INSERT INTO author(author_name) VALUES ('Cố Mạn');
INSERT INTO author(author_name) VALUES ('Đường Huyên');
INSERT INTO author(author_name) VALUES ('Tiểu Hân');
INSERT INTO author(author_name) VALUES ('Richard Nicholls');
INSERT INTO author(author_name) VALUES ('Thormas L. Friedman');


INSERT INTO publisher(publisher_name) VALUES ('Kim Đồng');
INSERT INTO publisher(publisher_name) VALUES ('Nhã Nam');
INSERT INTO publisher(publisher_name) VALUES ('Thái Hà');
INSERT INTO publisher(publisher_name) VALUES ('Phương Nam');


INSERT INTO book(book_name, book_cost, description, category_id, author_id, publisher_id) VALUES ('Mãi mãi là bao xa',109000,'','3','1','3');
INSERT INTO book(book_name, book_cost, description, category_id, author_id, publisher_id) VALUES ('Nụ hôn của sói',83000,'','3','1','2');
INSERT INTO book(book_name, book_cost, description, category_id, author_id, publisher_id) VALUES ('Cân bằng cảm xúc',90000,'','2','6','1');
INSERT INTO book(book_name, book_cost, description, category_id, author_id, publisher_id) VALUES ('Thế giới phẳng',106000,'','2','7','4');












