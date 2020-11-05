use  Furuma_Database;
SET SQL_SAFE_UPDATES = 0;

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

SELECT month(ngay_lam_HopDong) as 'thang' ,count(month(ngay_lam_HopDong)) as 'soHopDong' 
FROM hopdong
WHERE year(ngay_lam_HopDong)=2019
GROUP BY ngay_lam_HopDong
ORDER BY ngay_lam_HopDong;

SELECT month(ngay_lam_HopDong) as 'thang' ,count(id_HopDong) as 'soHopDong' 
FROM hopdong
WHERE year(ngay_lam_HopDong)=2019
GROUP BY ngay_lam_HopDong
 ORDER BY ngay_lam_HopDong;

/* task 10:.Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu 
Dịch vụ đi kèm.
 Kết quả hiển thị bao gồm
 IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem
 (được tính dựa trên việc count các IDHopDongChiTiet).*/
 
SELECT hd.id_HopDong, hd.ngay_lam_HopDong, hd.ngay_ketthuc_HopDong, hd.tien_datcoc, count(hdct.id_HopDongChiTiet) as 'so_luong_dv_di_kem'
FROM hopdong hd
INNER JOIN hopdongchitiet hdct on hd.id_HopDong=hdct.id_HopDong
GROUP BY hd.id_HopDong;

/* task 11:Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng 
có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.*/

SELECT dvdk.id_DichVudikem,
 dvdk.ten_DichVudikem,
 dvdk.gia, dvdk.donvi, 
 dvdk.trangthai_khadung,
 lkh.ten_LoaiKhachHang, 
 kh.diachi_KhachHang, 
 kh.ten_KhachHang
FROM dichvudikem dvdk
INNER JOIN hopdongchitiet hdct on dvdk.id_DichVudikem = hdct.id_Dichvudikem
INNER JOIN hopdong hd on hdct.id_HopDong = hd.id_HopDong
INNER JOIN khachhang kh on hd.id_KhachHang = kh.id_khachHang
INNER JOIN loaikhachhang lkh on kh.id_LoaiKhachHang = lkh.id_loaikhachHang
WHERE lkh.ten_LoaiKhachHang = 'Diamond' 
AND (kh.diachi_KhachHang = 'Vinh' or kh.diachi_KhachHang = 'Quang Ngai');

/* Task 12:	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu,SoLuongDichVuDikem 
			(được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt 
			vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019 */      

SELECT hd.id_HopDong,
 nv.name_NhanVien,
 kh.ten_KhachHang,
 kh.dt_KhachHang,
 dv.ten_DichVu,
 count(hdct.id_HopDongChiTiet) as 'SoLuongDichVuDikem ',
 hd.tien_datcoc
FROM hopdong hd
INNER JOIN nhanvien nv on nv.id_NhanVien = hd.id_NhanVien
INNER JOIN khachhang kh on kh.id_KhachHang = hd.id_KhachHang
INNER JOIN dichvu dv on dv.id_DichVu = hd.id_DichVu
INNER JOIN hopdongchitiet hdct on hdct.id_HopDong= hd.id_HopDong
WHERE (month(hd.ngay_lam_HopDong)>9 and year(hd.ngay_lam_HopDong)=2019)
and hd.id_HopDong NOT IN (month(hd.ngay_lam_HopDong) < 7 AND year(hd.ngay_lam_HopDong) = 2019);

/* Task 13:	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
		    (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau) */
            
SELECT dvdk.id_DichVudikem, dvdk.ten_DichVudikem, dvdk.gia, dvdk.donvi, COUNT(hdct.id_DichVudikem) AS count
FROM hopdongchitiet hdct
	INNER JOIN dichvudikem dvdk ON hdct.id_DichVudikem = dvdk.id_DichVudikem
GROUP BY hdct.id_DichVudikem
HAVING count =
(SELECT COUNT(hdct.id_DichVudikem) AS count
FROM hopdongchitiet hdct
INNER JOIN dichvudikem dvdk ON hdct.id_DichVudikem = dvdk.id_DichVudikem
GROUP BY hdct.id_DichVudikem
ORDER BY count DESC
LIMIT 1);

/* Task 14: Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
		    Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung */

SELECT hd.id_HopDong, ldv.ten_LoaiDichVu, dvdk.ten_DichVudikem, count(hdct.id_DichVudikem) as count
from dichvu dv 
LEFT JOIN hopdong hd on hd.id_DichVu= dv.id_DichVu
INNER JOIN loaidichvu ldv on ldv.id_LoaiDichVu = dv.id_LoaiDichVu
INNER JOIN hopdongchitiet hdct on hdct.id_HopDong = hd.id_HopDong
INNER JOIN dichvudikem dvdk on dvdk.id_DichVudikem=hdct.id_DichVudikem
GROUP BY dvdk.ten_DichVudikem
HAVING count = 1;

/* Task 15:	Hiển thị thông tin của tất cả nhân viên bao gồm IDNhanVien,
 HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi 
mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019 */

SELECT nv.id_NhanVien, nv.name_NhanVien, tdnv.trinhdo_NhanVien, bpnv.ten_BoPhanNhanVien, nv.dt_NhanVien, nv.diachi_NhanVien, count(nv.id_NhanVien) as 'tongHD'
from nhanvien nv
INNER JOIN trinhdonhanvien tdnv on tdnv.id_TrinhDoNhanVien=nv.id_TrinhDoNhanVien
INNER JOIN bophannhanvien bpnv on bpnv.id_BoPhanNhanVien=nv.id_BoPhanNhanVien
INNER JOIN hopdong hd on hd.id_NhanVien= nv.id_NhanVien
WHERE year(hd.ngay_lam_HopDong) BETWEEN 2018 AND 2019
GROUP BY nv.id_NhanVien
HAVING 'tongHD' < 3;

/* Task 16:	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019 */
DELETE
 FROM nhanvien nv
 WHERE id_NhanVien 
 NOT IN (
 SELECT hopdong.id_NhanVien 
 FROM hopdong 
 WHERE year(hopdong.ngay_lam_HopDong) BETWEEN 2017 and 2019
 );

/* Task 17:	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, 
		    chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong 
            năm 2019 là lớn hơn 10.000.000 VNĐ */
  
UPDATE khachhang
set khachhang.id_LoaiKhachHang = 1
WHERE khachhang.id_loaiKhachHang = 2 and  khachhang.id_KhachHang IN (
 SELECT hopdong.id_KhachHang FROM hopdong WHERE hopdong.tong_tien>= 9000 and year(hopdong.ngay_lam_HopDong) =2019
 );
 
 /* Task 18:	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràng buộc giữa các bảng) */
 DELETE 
  FROM khachhang kh
  WHERE kh.id_KhachHang in (
  SELECT hopdong.id_KhachHang 
  FROM hopdong 
  WHERE year(hopdong.ngay_lam_HopDong) < 2016
  );
 
 /* Task 19:	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi */
UPDATE dichvudikem dvdk
set dvdk.gia = dvdk.gia *2
WHERE  dvdk.id_DichVudikem in ( 
SELECT hdct.id_DichVudikem 
FROM hopdongchitiet hdct 
  INNER JOIN hopdong hd ON hd.id_HopDong = hdct.id_HopDong
 WHERE year(hd.ngay_lam_HopDong)=2019
GROUP BY hdct.id_DichVudikem
HAVING count(hdct.id_DichVudikem) >=3
);

/* Task 20: Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, 
			thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi */


CREATE VIEW khachhang_view as 
SELECT kh.id_KhachHang, kh.ten_KhachHang,kh.email_KhachHang, kh.dt_KhachHang, kh.ngaysinh_KhachHang, kh.diachi_KhachHang
FROM khachhang kh;
SELECT * FROM khachhang_view;

CREATE VIEW nhanvien_view as
SELECT nv.id_NhanVien,nv.name_NhanVien,nv.email_NhanVien,nv.dt_NhanVien,nv.ngaysinh_NhanVien,nv.diachi_NhanVien
FROM nhanvien nv;
SELECT * FROM nhanvien_view;

/*Task 21: Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
		   và đã từng lập hợp đồng cho 1 hoặc nhiều Khách hàng bất kỳ  với ngày lập hợp đồng là “12/12/2019” */
 DROP VIEW if EXISTS V_NHANVIEN;
 CREATE VIEW V_NHANVIEN as
 SELECT nv.id_NhanVien,nv.name_NhanVien,vtnv.ten_ViTriNhanVien,tdnv.trinhdo_NhanVien,bpnv.ten_BoPhanNhanVien, nv.email_NhanVien,nv.dt_NhanVien,nv.ngaysinh_NhanVien,nv.diachi_NhanVien,nv.soCMT_NhanVien
 FROM nhanvien nv 
 INNER JOIN vitrinhanvien vtnv on vtnv.id_ViTriNhanVien = nv.id_ViTriNhanVien
 INNER JOIN trinhdonhanvien tdnv on tdnv.id_TrinhDoNhanVien=nv.id_TrinhDoNhanVien
 INNER JOIN bophannhanvien bpnv on bpnv.id_BoPhanNhanVien=nv.id_BoPhanNhanVien
 INNER JOIN hopdong hd on hd.id_NhanVien = nv.id_nhanvien
 WHERE nv.diachi_NhanVien = 'Hai Chau' and date(hd.ngay_lam_HopDong)='2019-12-12';
 
 /* Task 22: Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
			đối với tất cả các Nhân viên được nhìn thấy bởi khung nhìn này */
UPDATE V_NHANVIEN
 SET diachi_NhanVien='Lien Chieu'
 WHERE diachi_NhanVien='Hai Chau';	

/*Task 23: Tạo Store procedure Sp_1 Dùng để xóa thông tin của một Khách hàng
 nào đó với Id Khách hàng được truyền vào như là 1 tham số của Sp_1 */
 
 DELIMITER //
CREATE PROCEDURE SP_1(id int)
BEGIN
  DELETE FROM khachhang
  WHERE id_KhachHang = id;
  select * from khachhang;
END; //
DELIMITER ;   

call SP_1(8);

/* Task 24: Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong với yêu cầu Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
		    với nguyên tắc không được trùng khó chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan */
           -- SELECT * FROM furuma_database.hopdong;
DROP  PROCEDURE if exists SP_2;       
DELIMITER //
CREATE PROCEDURE SP_2(
 id_NhanVien INT ,
id_KhachHang INT,
id_DichVu INT,
ngay_lam_HopDong DATE,
ngay_ketthuc_HopDong DATE,
tien_datcoc INT,
tong_tien INT
)
BEGIN
insert into hopdong (id_NhanVien, id_KhachHang, id_DichVu, ngay_lam_HopDong, ngay_ketthuc_HopDong, tien_datcoc,tong_tien) 
values (id_NhanVien, id_KhachHang, id_DichVu, ngay_lam_HopDong, ngay_ketthuc_HopDong, tien_datcoc,tong_tien)
 ;
 SELECT * 
FROM hopdong;
END; //
DELIMITER ; 

call SP_2(4, 1, 1, '2019-03-15', '2019-04-19', 100, 5000);

/* task 25.	Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong 
thì hiển thị tổng số lượng bản ghi còn lại có trong bảng HopDong
 ra giao diện console của database */
 -- chua lam xong
 

CREATE TRIGGER tr_1 
AFTER DELETE 
ON hopdong 
FOR EACH ROW 

 SELECT count(hopdong.id_HopDong) from hopdong ;



 
 




           





