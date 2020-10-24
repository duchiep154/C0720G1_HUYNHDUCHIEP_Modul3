drop database if exists Furuma_database;
create database Furuma_Database; -- tạo database Furama
use  Furuma_Database; -- sử dụng database

-- Bảng kiểu thuê 
drop table if exists KieuThue;
create table KieuThue (
id_KieuThue int auto_increment,
ten_KieuThue varchar(45),
gia_thue int,
primary key (id_KieuThue)
);

-- Bảng loại dịch vụ
drop table if exists LoaiDichVu ;
create table LoaiDichVu (
id_LoaiDichVu int auto_increment,
ten_LoaiDichVu varchar(45),
primary key (id_LoaiDichVu)
);

-- Bảng thông tin dịch vụ
drop table if exists DichVu;
create table DichVu (
id_DichVu int auto_increment,
ten_DichVu varchar(45),
dientich int,
sotang int,
so_nguoi_toi_da varchar(45),
chi_phi_thue varchar(45),
id_LoaiDichVu int,
-- foreign key (id_LoaiDichVu) references LoaiDichVu(id_LoaiDichVu) on delete cascade on update cascade,
id_KieuThue int,
-- foreign key (id_KieuThue) references KieuThue(id_KieuThue) on delete cascade on update cascade,
trang_thai varchar(45),
primary key(id_DichVu)
);


-- Bảng loại khách hàng 
drop table if exists LoaiKhachHang;
create table LoaiKhachHang (
id_LoaiKhachHang int auto_increment ,
ten_LoaiKhachHang varchar(45),
primary key (id_LoaiKhachHang)
); 

-- tạo Bảng khách hàng 
drop table if exists KhachHang;
create table KhachHang (
id_KhachHang int auto_increment,
id_LoaiKhachHang int,
-- foreign key (id_LoaiKhachHang) references LoaiKhachHang(id_LoaiKhachHang) on delete cascade on update cascade,
ten_KhachHang varchar(45),
ngaysinh_KhachHang date,
soCMT_KhachHang varchar(45),
dt_KhachHang varchar(45),
email_KhachHang varchar(45),
diachi_KhachHang varchar(45),
primary key (id_KhachHang)
);

-- Bảng vị trí nhân viên
drop table if exists ViTriNhanVien;
create table ViTriNhanVien (
id_ViTriNhanVien int auto_increment ,
ten_ViTriNhanVien varchar(45),
primary key (id_ViTriNhanVien)
);

-- Bảng trình độ nhân viên
drop table if exists TrinhDoNhanVien;
create table TrinhDoNhanVien (
id_TrinhDoNhanVien int auto_increment,
trinhdo_NhanVien varchar (45),
primary key (id_TrinhDoNhanVien)
);

-- Bảng bộ phận nhân viên làm việc
drop table if exists BoPhanNhanVien;
create table BoPhanNhanVien (
id_BoPhanNhanVien int auto_increment,
ten_BoPhanNhanVien varchar (45),
primary key (id_BoPhanNhanVien)
);

-- Bảng nhân viên
drop table if exists NhanVien;
create table NhanVien ( 
id_NhanVien int auto_increment,
name_NhanVien varchar(45),
id_ViTriNhanVien int, 
-- foreign key (id_ViTriNhanVien) references ViTriNhanVien(id_ViTriNhanVien) on delete cascade on update cascade,
id_TrinhDoNhanVien int,
-- foreign key (id_TrinhDoNhanVien) references TrinhDoNhanVien (id_TrinhDoNhanVien) on delete cascade on update cascade,
id_BoPhanNhanVien int,
-- foreign key (id_BoPhanNhanVien) references BoPhanNhanVien (id_BoPhanNhanVien) on delete cascade on update cascade,
ngaySinh_NhanVien date,
soCMT_NhanVien varchar(45),
luong_NhanVien varchar(45),
dt_NhanVien varchar(45),
email_NhanVien varchar(45),
diachi_NhanVien varchar(45),
primary key (id_NhanVien)
);


-- Bảng hợp đồng
 drop table if exists HopDong;
create table HopDong (
id_HopDong int auto_increment,
id_NhanVien int,
-- foreign key (id_NhanVien) references NhanVien(id_NhanVien) on delete cascade on update cascade,
id_KhachHang int,
-- foreign key (id_KhachHang) references KhachHang (id_KhachHang) on delete cascade on update cascade,
id_DichVu int,
-- foreign key (id_DichVu) references DichVu (id_DichVu) on delete cascade on update cascade,
ngay_lam_HopDong date,
ngay_ketthuc_HopDong date,
tien_datcoc int, -- Tiền đặt cọc 
tong_tien int,
primary key (id_HopDong)
);

-- Bảng dịch vụ đi kèm
drop table if exists DichVudikem;
create table DichVudikem (
id_DichVudikem int auto_increment,
ten_DichVudikem varchar(45),
gia int,
donvi int,
trangthai_khadung varchar (45),
primary key (id_DichVudikem)
);

-- Bảng hợp đồng chi tiết
drop table if exists HopDongChiTiet;
create table HopDongChiTiet (
id_HopDongChiTiet int auto_increment,
id_HopDong int,
-- foreign key (id_HopDong) references HopDong (id_HopDong) on delete cascade on update cascade,
id_DichVudikem int,
-- foreign key (id_DichVudikem) references DichVudikem (id_DichVudikem) on delete cascade on update cascade,
soluong_HopDong int,
primary key (id_HopDongChiTiet)
); 

-- foreign key table dichvu
alter table DichVu
 add constraint DichVu_LoaiDichVu_fk
 foreign key (id_LoaiDichVu)
 references LoaiDichVu(id_LoaiDichVu) on delete cascade on update cascade;
 alter table dichvu
 add constraint DichVu_KieuThue_fk
 foreign key (id_KieuThue) references KieuThue(id_KieuThue) on delete cascade on update cascade;
 
 -- foreign key table khachs hang
 alter table KhachHang 
 add constraint KhachHang_LoaiKhachHang_fk 
 foreign key (id_LoaiKhachHang) 
 references LoaiKhachHang(id_LoaiKhachHang) on delete cascade on update cascade ;
 
 -- foreign key table Nhan Vien
 alter table NhanVien 
 add constraint FK_NhanVien_ViTriNhanVien
 foreign key (id_ViTriNhanVien) 
 references ViTriNhanVien(id_ViTriNhanVien) on delete cascade on update cascade,
 add constraint FK_NhanVien_TrinhDoNhanVien
 foreign key (id_TrinhDoNhanVien) 
 references TrinhDoNhanVien (id_TrinhDoNhanVien) on delete cascade on update cascade,
 add constraint FK_NhanVien_BoPhanNhanVien
 foreign key (id_BoPhanNhanVien) references BoPhanNhanVien (id_BoPhanNhanVien) on delete cascade on update cascade;
 
 
 -- khoa ngoai bang HopDong
 
 alter table HopDong 
 add constraint FK_HopDong_NhanVien
 foreign key (id_NhanVien) references NhanVien(id_NhanVien) on delete cascade on update cascade,
 add constraint FK_HopDong_KhachHang
 foreign key (id_KhachHang) references KhachHang (id_KhachHang) on delete cascade on update cascade,
 add constraint FK_HopDong_DichVu
 foreign key (id_DichVu) references DichVu (id_DichVu) on delete cascade on update cascade;
 
 -- khoa ngoai HopDong_ChiTiet
 
 alter table HopDongChiTiet
 add constraint FK_HopDong_ChiTietHopDong
 foreign key (id_HopDong) references HopDong (id_HopDong) on delete cascade on update cascade,
 add constraint FK_HopDong_DichVuDiKem
 foreign key (id_DichVudikem) references DichVudikem (id_DichVudikem) on delete cascade on update cascade;
 


 

