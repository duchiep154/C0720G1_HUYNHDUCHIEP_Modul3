drop database if exists student_complete;
create database student_complete;
use student_complete;

create table class_code_gym (
	class_id int primary key auto_increment,
    class_name varchar (50)
);

insert into class_code_gym
values
	(1, 'Full Time'),
	(2, 'Part Time'),
	(3, 'Night Time');

create table student (
	student_id varchar (50) primary key,
    student_name varchar (50),
    age int,
    email varchar (50),
    phone varchar (50),
    address varchar (50),
    class_id int,
    foreign key (class_id) references class_code_gym(class_id) on delete cascade on update cascade
);

insert into student
values
	('CG-527', 'Chau Luong Phu', 25, 'chauluong@gmail.com', '0905052795', 'Quang Nam', 1),
	('CG-515', 'Mai Ho Quynh', 25, 'maiho@gmail.com', '0915051595', 'Da Nang', 1),
	('CG-217', 'Din Luong Vu', 24, 'dinluong@gmail.com', '0905021796', 'Quang Ngai', 1),
	('CG-902', 'Khanh Nguyen Quoc', 26, 'khanh@gmail.com', '0915090294', 'Quang Nam', 2),
	('CG-222', 'Lanh Nguyen Quang', 23, 'lanhnguyen@gmail.com', '0905022297', 'Da Nang', 2),
	('CG-777', 'Vu Nguyen Duc', 23, 'vunguyen@gmail.com', '0905077797', 'Ha Tinh', 3),
	('CG-810', 'Mai Ho Truc', 24, 'trucmai@gmail.com', '0915100896', 'Da Nang', 3);

DELIMITER //
create procedure update_student (id_update varchar (50), name_update varchar(50), age_update int, email_update varchar (50), phone_update varchar (50),
  address_update varchar (50), class_id_update int)
BEGIN
	update student
    set student_name = name_update, age = age_update, email = email_update, phone = phone_update, address = address_update, class_id = class_id_update
    where student_id = id_update;
END //
DELIMITER ;

DELIMITER //
create procedure delete_student(id_need_delete varchar (50))
BEGIN
	delete from student
    where student_id = id_need_delete;
END //
DELIMITER ;