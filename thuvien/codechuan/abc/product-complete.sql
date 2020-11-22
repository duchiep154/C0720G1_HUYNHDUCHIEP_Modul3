drop database if exists product_complete;
create database product_complete;
use product_complete;

create table category (
	category_id int primary key,
    category_name varchar (50)
);

insert into category
values
	(1, 'Phone'),
	(2, 'Television'),
	(3, 'Laptop');

create table product (
	product_id varchar (50) primary key,
    product_name varchar (50),
    price int,
    quantity int,
    color varchar (50),
    `description` varchar (50),
    category_id int,
    foreign key (category_id) references category(category_id) on delete cascade on update cascade
);

insert into product
values
	('SP-703', 'Nokia 7.3', 500, 10, 'Red', 'Nice', 1),
	('SP-111', 'Smart TV Samsung', 1000, 5, 'Black', 'Nice', 2),
	('SP-555', 'Acer Nitro 5', 1000, 7, 'Yellow', 'Nice', 3),
	('SP-121', 'Iphone 12', 2000, 3, 'Pink', 'Nice', 1),
	('SP-222', 'Dell Pro', 750, 11, 'Blue', 'Nice', 3),
	('SP-333', 'Asus ROG', 550, 12, 'Violet', 'Nice', 3),
	('SP-777', 'HP Vip', 350, 15, 'Green', 'Nice', 3);

DELIMITER //
create procedure update_product (id_update varchar (50), name_update varchar(50), price_update int, quantity_update int, 
color_update varchar (50), description_update varchar (50), category_id_update int)
BEGIN
	update product
    set product_name = name_update, price = price_update, quantity = quantity_update, color = color_update,
    `description` = description_update, category_id = category_id_update
    where product_id = id_update;
END //
DELIMITER ;

DELIMITER //
create procedure delete_product(id_need_delete varchar (50))
BEGIN
	delete from product
    where product_id = id_need_delete;
END //
DELIMITER ;