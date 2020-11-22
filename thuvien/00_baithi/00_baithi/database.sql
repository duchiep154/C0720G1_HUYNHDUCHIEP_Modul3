Create database baithi;

use baithi;

create table sach(
sach_id int auto_increment primary key,
sach_ten varchar(50) not null,
sach_tacgthe_muon_sachia varchar(50),
sach_mo_ta varchar(500),
sach_so_luong int default 0
);


create table hoc_sinh(
hoc_sinh_id int auto_increment primary key,
hoc_sinh_ten varchar(50) not null,
hoc_sinh_lop varchar(50) not null
);

create table the_muon_sach (
the_muon_sach_id varchar(50) primary key,
sach_id int not null,
hoc_sinh_id int not null,
trang_thai boolean default true,
ngay_muon date not null,
ngay_tra date
);

alter table the_muon_sach
add constraint fk_sach_the_muon_sach foreign key (sach_id) references sach(sach_id),
add constraint fk_hoc_sinh_the_muon_sach foreign key (hoc_sinh_id) references hoc_sinh(hoc_sinh_id);



