use  Furuma_Database;

/*Task 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự */
select *
from nhanvien
where (name_NhanVien like 'H%' or name_NhanVien like 'T%' or name_NhanVien like 'K%') and length(name_NhanVien) <= 15;

/*Task3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.*/
select * 
from nhanvien
where ((year(now()) - year(ngaysinh_NhanVien)) between 18 and 50)
	and diachi_NhanVien = 'Da Nang' or diachi_NhanVien = 'Quang Tri';
-- where (year(day_of_birth_customer) between 1970 and 2002) and address_customer in ('Da Nang', 'Quang Tri'); 

/* task 4 Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
 Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”. */
 
 select count(hopdong.id_KhachHang) as count_hopdong , khachhang.ten_KhachHang,loaikhachhang.ten_LoaiKhachHang -- lua chon cot hien thi 
from khachhang  -- tu table khach hang
	left join hopdong on hopdong.id_KhachHang = khachhang.id_KhachHang  -- noi left join table hop dong 
	join loaikhachhang on loaikhachhang.id_LoaiKhachHang = khachhang.id_LoaiKhachHang  -- noi them voi loai khach hang de check 
where loaikhachhang.ten_LoaiKhachHang = 'Diamond'  -- dieu kien 
group by khachhang.id_KhachHang -- nhom cac bang lai
order by count(khachhang.id_KhachHang); -- sap xep

/* task 5:Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien
 (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, (với SoLuong và Giá là từ bảng DichVuDiKem) 
 cho tất cả các Khách hàng đã từng đặt phỏng.
 (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra) */
 
-- hien thi IDkhach, hoten , ten loai khach, id hop dong , ten dich vu , ngay lam hop dong , ngay ket thuc, tong tien
 select khachhang.id_KhachHang,
 khachhang.ten_KhachHang,
 loaikhachhang.ten_LoaiKhachHang,
 hopdong.id_hopdong,
 dichvu.ten_DichVu,
 hopdong.ngay_lam_HopDong,
 hopdong.ngay_ketthuc_HopDong,
 dichvu.chi_phi_thue,
 dichvudikem.donvi,
 dichvudikem.gia,
sum(dichvu.chi_phi_thue + (dichvudikem.donvi * dichvudikem.gia)) as total_money
from khachhang
	left join loaikhachhang on khachhang.id_LoaiKhachHang = loaikhachhang.id_LoaiKhachHang
    left join hopdong  on hopdong.id_KhachHang = khachhang.id_KhachHang
    left join hopdongchitiet on hopdong.id_HopDong = hopdongchitiet.id_HopDong
    left join dichvudikem on hopdongchitiet.id_DichVudikem = dichvudikem.id_DichVudikem
    left join dichvu on hopdong.id_DichVu = dichvu.id_DichVu
group by khachhang.id_KhachHang;

/* task 6.Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ
 chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3). */
 
SELECT 
    dichvu.id_DichVu,
    dichvu.ten_DichVu,
    dichvu.dientich,
    dichvu.chi_phi_thue,
    loaidichvu.ten_LoaiDichVu
FROM dichvu
    LEFT JOIN loaidichvu ON dichvu.id_LoaiDichVu = loaidichvu.id_LoaiDichVu
    WHERE dichvu.id_DichVu 
    NOT IN (
       SELECT dichvu.id_DichVu 
       FROM dichvu 
         LEFT JOIN hopdong ON hopdong.id_DichVu = dichvu.id_DichVu 
         WHERE MONTH(hopdong.ngay_lam_HopDong) < 4 AND YEAR(hopdong.ngay_lam_HopDong) = 2019
);
 
 /* task 7 :Hiển thị thông tin
           IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ
           đã từng được Khách hàng đặt phòng trong năm 2018
            nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.*/

SELECT dv.id_DichVu,dv.ten_DichVu,dv.dientich,dv.so_nguoi_toi_da,dv.chi_phi_thue,ldv.ten_LoaiDichVu,hd.ngay_lam_HopDong
FROM dichvu dv 
INNER JOIN loaidichvu ldv ON dv.id_LoaiDichVu=ldv.id_LoaiDichVu   
INNER JOIN hopdong hd ON hd.id_DichVu=dv.id_DichVu
WHERE year(hd.ngay_lam_HopDong) =2018 and dv.id_DichVu 
NOT IN (
SELECT  dv.id_DichVu 
FROM  dichvu dv 
WHERE year(hd.ngay_lam_HopDong)=2019
);     

/*8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống,
 với yêu cầu HoThenKhachHang không trùng nhau.
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên */

-- cach 1 
SELECT DISTINCT  khachhang.ten_KhachHang 
from khachhang;

-- cach 2

SELECT khachhang.ten_KhachHang
from khachhang
GROUP BY ten_KhachHang;

-- cach 3 
SELECT ten_KhachHang
from khachhang
UNION
SELECT ten_KhachHang
from khachhang;

/* task 9 Thực hiện thống kê doanh thu theo tháng, 
nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng */

SELECT month(ngay_lam_HopDong) as 'thang' ,count(id_HopDong) as 'soHopDong' 
FROM hopdong
GROUP BY ngay_lam_HopDong
HAVING year(ngay_lam_HopDong)=2019;



           





