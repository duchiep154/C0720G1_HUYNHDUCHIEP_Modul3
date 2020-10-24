use furuma_database;

-- task 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thõa mãn các yêu cầu bên dưới.

-- Thông tin kiểu thuê

insert into kieuthue (ten_KieuThue, gia_thue)
values
('3 days', 3000),
('a week', 7000),
('a day', 1000),
('5 days', 5000),
('a month', 31000),
('1 day', 1000),
('2 days', 2000),
('4 days', 4000),
('6 days', 6000);

-- Thông tin loại dịch vụ
insert into loaidichvu (ten_LoaiDichVu)
values
('Villa'),
('House'),
('Room');

-- Thông tin về dịch vụ
insert into dichvu (ten_DichVu, dientich, sotang, so_nguoi_toi_da, chi_phi_thue, id_LoaiDichVu, id_KieuThue, trang_thai)
values
('Villa 1',30, 3, '20', '3000', 1,5, 'Booked'),
('House 1',40, 4, '30', '4000',2,2, 'Empty'),
('Room',50, 2, '35', '5000',3,3, 'Empty'),
('House 2',60, 5, '40', '6000',2,4, 'Booked'),
('Villa 2',55, 4, '45', '7000',1,1, 'Empty'),
('Villa 3',60, 3, '20', '5000', 1,5, 'Booked'),
('House 3',70, 4, '30', '8000',2,2, 'Empty'),
('Room',50, 2, '35', '5000',3,3, 'Empty'),
('House 2',60, 5, '40', '6000',2,4, 'Booked');

-- Thông tin loại khách hàng
insert into loaikhachhang (ten_LoaiKhachHang)
values
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

-- Thông tin khách hàng
insert into khachhang (ten_KhachHang,id_LoaiKhachHang,ngaysinh_KhachHang,soCMT_KhachHang,dt_KhachHang,email_KhachHang,diachi_KhachHang)
values
('Huynh Duc Hiep', 1, '1995-05-15', '123456789', '0905002003', 'duchiep@gmail.com', 'Da Nang'),
('Pham Bang Bang', 2,  '1995-03-01', '111222333', '0901789456', 'phambangbang@gmail.com', 'Ha Noi'),
('Ly Nha ky', 1, '1995-11-01', '999222000','0789456512','nhaky@gmail.com', 'Vinh'),
('Duong Mich', 1, '1995-10-21', '555666789','0258147369','duongmich@gmail.com','Quang Tri'),
('Luu Diec Phi', 5, '1996-10-18', '561234789','0123654789','diecphi@gmail.com','Quang Ngai');

-- Thông tin vị trí nhân viên
insert into vitrinhanvien (ten_vitrinhanvien)
values
('Receptionist'), -- Lễ tân
('Waiters'), -- Phục vụ 
('Expert'), -- Chuyên viên
('Monitoring'), -- Giám sát
('Manager'),
('Directior');

-- Thông tin trình độ nhân viên
insert into trinhdonhanvien (trinhdo_NhanVien)
values
('Intermediate'), -- Trung cấp
('Colleges'), -- Cao đẳng
('University'),
('After university');

-- Thông tin bộ phận nhân viên
insert into bophannhanvien (ten_BoPhanNhanVien)
values
('Sale – Marketing'),
('Administrative'), -- Bộ phận hành chính
('Waiters'),
('Manager');

-- Thông tin nhân viên
insert into NhanVien (name_NhanVien, id_ViTriNhanVien, id_TrinhDoNhanVien, id_BoPhanNhanVien, ngaySinh_NhanVien, soCMT_NhanVien, luong_NhanVien, dt_NhanVien, email_NhanVien , diachi_NhanVien)
values
('Nguyen Truong An', 1, 1, 1,'1980-10-10', '123456789', '5000', '0123456789', 'nguyentruong.an@gmail.com', 'Da Nang'),
('Doan Thi To Uyen', 2, 2, 2, '1990-02-01', '123123123', '6000', '0369258147', 'donthito.uyen@gmail.com', 'Hai Phong'),
('Bui Van Thanh', 3, 3, 3, '1993-05-09', '369258147', '7000', '0789456123', 'buivan.thanh@gmail.com', 'Hai Chau'),
('HoTram Uyen', 4, 4, 4, '1995-03-30', '789412563', '4500', '0951357147', 'hotram.uyen@gmail.com', 'Quy Nhon'),
('Khuong Binh', 5, 1, 1, '1991-08-28', '654987123', '4500', '0852741963', 'khuong.binh@gmail.com', 'Lao Cai');

insert into hopdong(id_NhanVien,id_KhachHang ,id_DichVu,ngay_lam_HopDong,ngay_ketthuc_HopDong ,tien_datcoc ,tong_tien)
values
(1,1,1,'2018-03-10', '2018-03-15', 100,5000),
(2,3,2,'2019-01-01', '2019-01-20', 500, 8000),
(3,1,3,'2019-12-11', '2019-12-24', 200, 7000),
(4,4,4,'2018-05-15', '2018-05-30', 100, 9000),
(2,3,4,'2014-09-15', '2014-09-30', 100, 9000),
(5,5,5,'2020-08-16', '2020-08-20', 100, 5000);

-- Thông tin dịch vụ đi kèm
insert into dichvudikem (ten_DichVudikem ,gia,donvi ,trangthai_khadung)
values
('Massage', 300, 10, 'Free'),
('Karaoke', 400, 10, 'Free'),
('Food', 500, 10, 'Free'),
('Drink', 600, 10, 'Free'),
('Car Rental', 70, 10, 'Free');

-- Thông tin hợp đồng chi tiết
insert into HopDongChiTiet (id_HopDong ,id_DichVudikem ,soluong_HopDong)
values
(1,5,3),
(2,2,1),
(3,3,1),
(4,3,5),
(1,5,1);

