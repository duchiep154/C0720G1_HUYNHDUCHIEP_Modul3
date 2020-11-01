-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: furuma_database
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bophannhanvien`
--

DROP TABLE IF EXISTS `bophannhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bophannhanvien` (
  `id_BoPhanNhanVien` int NOT NULL AUTO_INCREMENT,
  `ten_BoPhanNhanVien` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_BoPhanNhanVien`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bophannhanvien`
--

LOCK TABLES `bophannhanvien` WRITE;
/*!40000 ALTER TABLE `bophannhanvien` DISABLE KEYS */;
INSERT INTO `bophannhanvien` VALUES (1,'Sale – Marketing'),(2,'Administrative'),(3,'Waiters'),(4,'Manager');
/*!40000 ALTER TABLE `bophannhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dichvu`
--

DROP TABLE IF EXISTS `dichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dichvu` (
  `id_DichVu` int NOT NULL AUTO_INCREMENT,
  `ten_DichVu` varchar(45) DEFAULT NULL,
  `dientich` int DEFAULT NULL,
  `sotang` int DEFAULT NULL,
  `so_nguoi_toi_da` varchar(45) DEFAULT NULL,
  `chi_phi_thue` varchar(45) DEFAULT NULL,
  `id_LoaiDichVu` int DEFAULT NULL,
  `id_KieuThue` int DEFAULT NULL,
  `trang_thai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_DichVu`),
  KEY `DichVu_LoaiDichVu_fk` (`id_LoaiDichVu`),
  KEY `DichVu_KieuThue_fk` (`id_KieuThue`),
  CONSTRAINT `DichVu_KieuThue_fk` FOREIGN KEY (`id_KieuThue`) REFERENCES `kieuthue` (`id_KieuThue`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DichVu_LoaiDichVu_fk` FOREIGN KEY (`id_LoaiDichVu`) REFERENCES `loaidichvu` (`id_LoaiDichVu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dichvu`
--

LOCK TABLES `dichvu` WRITE;
/*!40000 ALTER TABLE `dichvu` DISABLE KEYS */;
INSERT INTO `dichvu` VALUES (1,'Villa 1',30,3,'15','3000',1,5,'Booked'),(2,'House 1',40,4,'10','4000',2,2,'Empty'),(3,'Room',50,2,'10','5000',3,3,'Empty'),(4,'House 2',60,5,'10','6000',2,4,'Booked'),(5,'Villa 2',55,4,'9','7000',1,1,'Empty'),(6,'Villa 3',60,3,'20','5000',1,5,'Booked'),(7,'House 3',70,4,'12','8000',2,2,'Empty'),(8,'Room 2',50,2,'15','5000',3,3,'Empty'),(9,'House 4',60,5,'16','6000',2,4,'Booked');
/*!40000 ALTER TABLE `dichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dichvudikem`
--

DROP TABLE IF EXISTS `dichvudikem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dichvudikem` (
  `id_DichVudikem` int NOT NULL AUTO_INCREMENT,
  `ten_DichVudikem` varchar(45) DEFAULT NULL,
  `gia` int DEFAULT NULL,
  `donvi` int DEFAULT NULL,
  `trangthai_khadung` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_DichVudikem`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dichvudikem`
--

LOCK TABLES `dichvudikem` WRITE;
/*!40000 ALTER TABLE `dichvudikem` DISABLE KEYS */;
INSERT INTO `dichvudikem` VALUES (1,'Massage',300,10,'Free'),(2,'Karaoke',600,10,'Free'),(3,'Food',500,10,'Free'),(4,'Drink',600,10,'Free'),(5,'Car Rental',70,10,'Free');
/*!40000 ALTER TABLE `dichvudikem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopdong`
--

DROP TABLE IF EXISTS `hopdong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopdong` (
  `id_HopDong` int NOT NULL AUTO_INCREMENT,
  `id_NhanVien` int NOT NULL,
  `id_KhachHang` int NOT NULL,
  `id_DichVu` int NOT NULL,
  `ngay_lam_HopDong` date NOT NULL,
  `ngay_ketthuc_HopDong` date NOT NULL,
  `tien_datcoc` int DEFAULT NULL,
  `tong_tien` int DEFAULT NULL,
  PRIMARY KEY (`id_HopDong`),
  KEY `FK_HopDong_DichVu` (`id_DichVu`),
  KEY `FK_HopDong_KhachHang` (`id_KhachHang`),
  KEY `FK_HopDong_NhanVien` (`id_NhanVien`),
  CONSTRAINT `FK_HopDong_DichVu` FOREIGN KEY (`id_DichVu`) REFERENCES `dichvu` (`id_DichVu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_HopDong_KhachHang` FOREIGN KEY (`id_KhachHang`) REFERENCES `khachhang` (`id_KhachHang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_HopDong_NhanVien` FOREIGN KEY (`id_NhanVien`) REFERENCES `nhanvien` (`id_NhanVien`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopdong`
--

LOCK TABLES `hopdong` WRITE;
/*!40000 ALTER TABLE `hopdong` DISABLE KEYS */;
INSERT INTO `hopdong` VALUES (1,1,1,1,'2019-03-10','2018-03-15',100,9000),(2,2,3,2,'2018-01-01','2019-01-20',500,8000),(3,3,1,3,'2019-12-11','2019-12-24',200,7000),(4,4,4,4,'2019-05-15','2018-05-30',100,9000),(5,2,3,4,'2019-09-15','2014-09-30',100,9000),(7,3,5,6,'2018-12-11','2019-01-01',100,2000),(8,2,4,2,'2018-02-11','2019-02-15',100,1000),(9,3,3,2,'2019-01-14','2019-01-25',100,3000),(10,6,7,2,'2019-02-12','2019-02-16',200,9000),(11,3,3,3,'2019-12-12','2019-12-20',200,3000),(12,7,2,4,'2019-12-12','2019-12-25',200,2000),(13,4,4,4,'2019-12-12','2019-12-26',200,1000),(14,3,2,2,'2019-02-15','2019-02-19',100,2000),(15,3,2,2,'2019-02-15','2019-02-19',100,2000),(16,3,2,2,'2019-02-15','2019-02-19',100,2000),(17,4,1,1,'2019-03-15','2019-04-19',100,5000);
/*!40000 ALTER TABLE `hopdong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopdongchitiet`
--

DROP TABLE IF EXISTS `hopdongchitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopdongchitiet` (
  `id_HopDongChiTiet` int NOT NULL AUTO_INCREMENT,
  `id_HopDong` int DEFAULT NULL,
  `id_DichVudikem` int DEFAULT NULL,
  `soluong_HopDong` int DEFAULT NULL,
  PRIMARY KEY (`id_HopDongChiTiet`),
  KEY `FK_HopDong_ChiTietHopDong` (`id_HopDong`),
  KEY `FK_HopDong_DichVuDiKem` (`id_DichVudikem`),
  CONSTRAINT `FK_HopDong_ChiTietHopDong` FOREIGN KEY (`id_HopDong`) REFERENCES `hopdong` (`id_HopDong`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_HopDong_DichVuDiKem` FOREIGN KEY (`id_DichVudikem`) REFERENCES `dichvudikem` (`id_DichVudikem`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopdongchitiet`
--

LOCK TABLES `hopdongchitiet` WRITE;
/*!40000 ALTER TABLE `hopdongchitiet` DISABLE KEYS */;
INSERT INTO `hopdongchitiet` VALUES (1,1,2,3),(2,2,2,1),(3,3,3,1),(4,4,3,5),(5,7,5,1),(6,3,2,3),(7,10,2,2),(8,10,5,1),(9,9,2,2);
/*!40000 ALTER TABLE `hopdongchitiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `id_KhachHang` int NOT NULL AUTO_INCREMENT,
  `id_LoaiKhachHang` int DEFAULT NULL,
  `ten_KhachHang` varchar(45) DEFAULT NULL,
  `ngaysinh_KhachHang` date DEFAULT NULL,
  `soCMT_KhachHang` varchar(45) DEFAULT NULL,
  `dt_KhachHang` varchar(45) DEFAULT NULL,
  `email_KhachHang` varchar(45) DEFAULT NULL,
  `diachi_KhachHang` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_KhachHang`),
  KEY `KhachHang_LoaiKhachHang_fk` (`id_LoaiKhachHang`),
  CONSTRAINT `KhachHang_LoaiKhachHang_fk` FOREIGN KEY (`id_LoaiKhachHang`) REFERENCES `loaikhachhang` (`id_LoaiKhachHang`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (1,2,'Huynh Duc Hiep','1995-05-15','123456789','0905002003','duchiep@gmail.com','Da Nang'),(2,2,'Pham Bang Bang','1995-03-01','111222333','0901789456','phambangbang@gmail.com','Ha Noi'),(3,3,'Ly Nha ky','1995-11-01','999222000','0789456512','nhaky@gmail.com','Vinh'),(4,2,'Duong Mich','1995-10-21','555666789','0258147369','duongmich@gmail.com','Quang Ngai'),(5,5,'Luu Diec Phi','1996-10-18','561234789','0123654789','diecphi@gmail.com','Quang Ngai'),(6,3,'Ly Nha Ky','1992-12-01','123456789','0123486789','nhaky@gmail.com','Da Nang'),(7,1,'Be Ut','1992-04-16','222222222','333333333','beut@gmail.com','Ho Chi Minh');
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `khachhang_view`
--

DROP TABLE IF EXISTS `khachhang_view`;
/*!50001 DROP VIEW IF EXISTS `khachhang_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `khachhang_view` AS SELECT 
 1 AS `id_KhachHang`,
 1 AS `ten_KhachHang`,
 1 AS `email_KhachHang`,
 1 AS `dt_KhachHang`,
 1 AS `ngaysinh_KhachHang`,
 1 AS `diachi_KhachHang`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `kieuthue`
--

DROP TABLE IF EXISTS `kieuthue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kieuthue` (
  `id_KieuThue` int NOT NULL AUTO_INCREMENT,
  `ten_KieuThue` varchar(45) DEFAULT NULL,
  `gia_thue` int DEFAULT NULL,
  PRIMARY KEY (`id_KieuThue`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kieuthue`
--

LOCK TABLES `kieuthue` WRITE;
/*!40000 ALTER TABLE `kieuthue` DISABLE KEYS */;
INSERT INTO `kieuthue` VALUES (1,'3 days',3000),(2,'a week',7000),(3,'a day',1000),(4,'5 days',5000),(5,'a month',31000),(6,'1 day',1000),(7,'2 days',2000),(8,'4 days',4000),(9,'6 days',6000);
/*!40000 ALTER TABLE `kieuthue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaidichvu`
--

DROP TABLE IF EXISTS `loaidichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaidichvu` (
  `id_LoaiDichVu` int NOT NULL AUTO_INCREMENT,
  `ten_LoaiDichVu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_LoaiDichVu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaidichvu`
--

LOCK TABLES `loaidichvu` WRITE;
/*!40000 ALTER TABLE `loaidichvu` DISABLE KEYS */;
INSERT INTO `loaidichvu` VALUES (1,'Villa'),(2,'House'),(3,'Room');
/*!40000 ALTER TABLE `loaidichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaikhachhang`
--

DROP TABLE IF EXISTS `loaikhachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaikhachhang` (
  `id_LoaiKhachHang` int NOT NULL AUTO_INCREMENT,
  `ten_LoaiKhachHang` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_LoaiKhachHang`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaikhachhang`
--

LOCK TABLES `loaikhachhang` WRITE;
/*!40000 ALTER TABLE `loaikhachhang` DISABLE KEYS */;
INSERT INTO `loaikhachhang` VALUES (1,'Diamond'),(2,'Platinium'),(3,'Gold'),(4,'Silver'),(5,'Member');
/*!40000 ALTER TABLE `loaikhachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `id_NhanVien` int NOT NULL AUTO_INCREMENT,
  `name_NhanVien` varchar(45) DEFAULT NULL,
  `id_ViTriNhanVien` int DEFAULT NULL,
  `id_TrinhDoNhanVien` int DEFAULT NULL,
  `id_BoPhanNhanVien` int DEFAULT NULL,
  `ngaySinh_NhanVien` date DEFAULT NULL,
  `soCMT_NhanVien` varchar(45) DEFAULT NULL,
  `luong_NhanVien` varchar(45) DEFAULT NULL,
  `dt_NhanVien` varchar(45) DEFAULT NULL,
  `email_NhanVien` varchar(45) DEFAULT NULL,
  `diachi_NhanVien` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_NhanVien`),
  KEY `FK_NhanVien_ViTriNhanVien` (`id_ViTriNhanVien`),
  KEY `FK_NhanVien_TrinhDoNhanVien` (`id_TrinhDoNhanVien`),
  KEY `FK_NhanVien_BoPhanNhanVien` (`id_BoPhanNhanVien`),
  CONSTRAINT `FK_NhanVien_BoPhanNhanVien` FOREIGN KEY (`id_BoPhanNhanVien`) REFERENCES `bophannhanvien` (`id_BoPhanNhanVien`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NhanVien_TrinhDoNhanVien` FOREIGN KEY (`id_TrinhDoNhanVien`) REFERENCES `trinhdonhanvien` (`id_TrinhDoNhanVien`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NhanVien_ViTriNhanVien` FOREIGN KEY (`id_ViTriNhanVien`) REFERENCES `vitrinhanvien` (`id_ViTriNhanVien`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,'Nguyen Truong An',1,1,1,'1980-10-10','123456789','5000','0123456789','nguyentruong.an@gmail.com','Da Nang'),(2,'Doan Thi To Uyen',2,2,2,'1990-02-01','123123123','6000','0369258147','donthito.uyen@gmail.com','Hai Phong'),(3,'Bui Van Thanh',3,3,3,'1993-05-09','369258147','7000','0789456123','buivan.thanh@gmail.com','Lien Chieu'),(4,'HoTram Uyen',4,4,4,'1995-03-30','789412563','4500','0951357147','hotram.uyen@gmail.com','Quy Nhon'),(5,'koko',3,2,4,'1993-02-16','222222222','333333','222222222','fdfsf','Hai Chau'),(6,'le binh',2,2,2,'1992-12-12','123456789','2330','0905263236','lebinh@gmail.com','Da Nang'),(7,'fefdfefe',2,2,2,'1992-04-16','122333663','2222222','22222','kkk@gmail.com','Lien Chieu');
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `nhanvien_view`
--

DROP TABLE IF EXISTS `nhanvien_view`;
/*!50001 DROP VIEW IF EXISTS `nhanvien_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nhanvien_view` AS SELECT 
 1 AS `id_NhanVien`,
 1 AS `name_NhanVien`,
 1 AS `email_NhanVien`,
 1 AS `dt_NhanVien`,
 1 AS `ngaysinh_NhanVien`,
 1 AS `diachi_NhanVien`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `trinhdonhanvien`
--

DROP TABLE IF EXISTS `trinhdonhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trinhdonhanvien` (
  `id_TrinhDoNhanVien` int NOT NULL AUTO_INCREMENT,
  `trinhdo_NhanVien` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_TrinhDoNhanVien`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trinhdonhanvien`
--

LOCK TABLES `trinhdonhanvien` WRITE;
/*!40000 ALTER TABLE `trinhdonhanvien` DISABLE KEYS */;
INSERT INTO `trinhdonhanvien` VALUES (1,'Intermediate'),(2,'Colleges'),(3,'University'),(4,'After university');
/*!40000 ALTER TABLE `trinhdonhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_nhanvien`
--

DROP TABLE IF EXISTS `v_nhanvien`;
/*!50001 DROP VIEW IF EXISTS `v_nhanvien`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_nhanvien` AS SELECT 
 1 AS `id_NhanVien`,
 1 AS `name_NhanVien`,
 1 AS `ten_ViTriNhanVien`,
 1 AS `trinhdo_NhanVien`,
 1 AS `ten_BoPhanNhanVien`,
 1 AS `email_NhanVien`,
 1 AS `dt_NhanVien`,
 1 AS `ngaysinh_NhanVien`,
 1 AS `diachi_NhanVien`,
 1 AS `soCMT_NhanVien`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vitrinhanvien`
--

DROP TABLE IF EXISTS `vitrinhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vitrinhanvien` (
  `id_ViTriNhanVien` int NOT NULL AUTO_INCREMENT,
  `ten_ViTriNhanVien` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_ViTriNhanVien`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vitrinhanvien`
--

LOCK TABLES `vitrinhanvien` WRITE;
/*!40000 ALTER TABLE `vitrinhanvien` DISABLE KEYS */;
INSERT INTO `vitrinhanvien` VALUES (1,'Receptionist'),(2,'Waiters'),(3,'Expert'),(4,'Monitoring'),(5,'Manager'),(6,'Directior');
/*!40000 ALTER TABLE `vitrinhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'furuma_database'
--

--
-- Dumping routines for database 'furuma_database'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_1`(id int)
BEGIN
  DELETE FROM khachhang
  WHERE id_KhachHang = id;
  select * from khachhang;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_2`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `khachhang_view`
--

/*!50001 DROP VIEW IF EXISTS `khachhang_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `khachhang_view` AS select `kh`.`id_KhachHang` AS `id_KhachHang`,`kh`.`ten_KhachHang` AS `ten_KhachHang`,`kh`.`email_KhachHang` AS `email_KhachHang`,`kh`.`dt_KhachHang` AS `dt_KhachHang`,`kh`.`ngaysinh_KhachHang` AS `ngaysinh_KhachHang`,`kh`.`diachi_KhachHang` AS `diachi_KhachHang` from `khachhang` `kh` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nhanvien_view`
--

/*!50001 DROP VIEW IF EXISTS `nhanvien_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nhanvien_view` AS select `nv`.`id_NhanVien` AS `id_NhanVien`,`nv`.`name_NhanVien` AS `name_NhanVien`,`nv`.`email_NhanVien` AS `email_NhanVien`,`nv`.`dt_NhanVien` AS `dt_NhanVien`,`nv`.`ngaySinh_NhanVien` AS `ngaysinh_NhanVien`,`nv`.`diachi_NhanVien` AS `diachi_NhanVien` from `nhanvien` `nv` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_nhanvien`
--

/*!50001 DROP VIEW IF EXISTS `v_nhanvien`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_nhanvien` AS select `nv`.`id_NhanVien` AS `id_NhanVien`,`nv`.`name_NhanVien` AS `name_NhanVien`,`vtnv`.`ten_ViTriNhanVien` AS `ten_ViTriNhanVien`,`tdnv`.`trinhdo_NhanVien` AS `trinhdo_NhanVien`,`bpnv`.`ten_BoPhanNhanVien` AS `ten_BoPhanNhanVien`,`nv`.`email_NhanVien` AS `email_NhanVien`,`nv`.`dt_NhanVien` AS `dt_NhanVien`,`nv`.`ngaySinh_NhanVien` AS `ngaysinh_NhanVien`,`nv`.`diachi_NhanVien` AS `diachi_NhanVien`,`nv`.`soCMT_NhanVien` AS `soCMT_NhanVien` from ((((`nhanvien` `nv` join `vitrinhanvien` `vtnv` on((`vtnv`.`id_ViTriNhanVien` = `nv`.`id_ViTriNhanVien`))) join `trinhdonhanvien` `tdnv` on((`tdnv`.`id_TrinhDoNhanVien` = `nv`.`id_TrinhDoNhanVien`))) join `bophannhanvien` `bpnv` on((`bpnv`.`id_BoPhanNhanVien` = `nv`.`id_BoPhanNhanVien`))) join `hopdong` `hd` on((`hd`.`id_NhanVien` = `nv`.`id_NhanVien`))) where ((`nv`.`diachi_NhanVien` = 'Hai Chau') and (cast(`hd`.`ngay_lam_HopDong` as date) = '2019-12-12')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-01  7:14:20
