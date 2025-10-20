-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3307
-- Thời gian đã tạo: Th10 20, 2025 lúc 04:46 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `thuthapdulieutmdt`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baocaothongke`
--

CREATE TABLE `baocaothongke` (
  `MaBaoCao` int(11) NOT NULL,
  `MaWebsite` int(11) DEFAULT NULL,
  `TongSoSanPham` int(11) DEFAULT NULL,
  `SanPhamBanChayNhat` varchar(255) DEFAULT NULL,
  `GiaTrungBinh` decimal(12,2) DEFAULT NULL,
  `NgayTao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cuahang`
--

CREATE TABLE `cuahang` (
  `MaCuaHang` int(11) NOT NULL,
  `MaWebsite` int(11) DEFAULT NULL,
  `TenCuaHang` varchar(255) DEFAULT NULL,
  `DiemDanhGia` decimal(3,2) DEFAULT NULL,
  `ViTri` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cuahang`
--

INSERT INTO `cuahang` (`MaCuaHang`, `MaWebsite`, `TenCuaHang`, `DiemDanhGia`, `ViTri`) VALUES
(1, 1, 'Shop Samsung Official', 4.90, 'TP. Hồ Chí Minh'),
(2, 2, 'Lazada Mall - Apple Store', 4.80, 'Hà Nội'),
(3, 3, 'Tiki Trading', 4.70, 'TP. Hồ Chí Minh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia`
--

CREATE TABLE `danhgia` (
  `MaDanhGia` int(11) NOT NULL,
  `MaSP` int(11) DEFAULT NULL,
  `TenNguoiDanhGia` varchar(255) DEFAULT NULL,
  `Diem` int(11) DEFAULT NULL,
  `NoiDung` text DEFAULT NULL,
  `NgayDanhGia` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `MaDanhMuc` int(11) NOT NULL,
  `MaWebsite` int(11) DEFAULT NULL,
  `TenDanhMuc` varchar(255) DEFAULT NULL,
  `MaCha` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`MaDanhMuc`, `MaWebsite`, `TenDanhMuc`, `MaCha`) VALUES
(1, 1, 'Điện thoại', NULL),
(2, 2, 'Laptop', NULL),
(3, 3, 'Đồng hồ thông minh', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lichsudangnhap`
--

CREATE TABLE `lichsudangnhap` (
  `MaLichSu` int(11) NOT NULL,
  `MaND` int(11) DEFAULT NULL,
  `ThoiGianDangNhap` datetime DEFAULT NULL,
  `DiaChiIP` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lichsugia`
--

CREATE TABLE `lichsugia` (
  `MaLichSu` int(11) NOT NULL,
  `MaSP` int(11) DEFAULT NULL,
  `NgayThuThap` datetime DEFAULT NULL,
  `Gia` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `MaND` int(11) NOT NULL,
  `TenDangNhap` varchar(100) DEFAULT NULL,
  `MatKhau` varchar(255) DEFAULT NULL,
  `VaiTro` enum('admin','nguoidung') DEFAULT 'nguoidung',
  `NgayTao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSP` int(11) NOT NULL,
  `MaWebsite` int(11) DEFAULT NULL,
  `MaDanhMuc` int(11) DEFAULT NULL,
  `MaCuaHang` int(11) DEFAULT NULL,
  `TenSP` varchar(255) DEFAULT NULL,
  `LinkSP` varchar(500) DEFAULT NULL,
  `GiaHienTai` decimal(12,2) DEFAULT NULL,
  `SoLuongDaBan` int(11) DEFAULT NULL,
  `DiemDanhGia` decimal(3,2) DEFAULT NULL,
  `SoLuongDanhGia` int(11) DEFAULT NULL,
  `MoTa` text DEFAULT NULL,
  `LanCapNhatCuoi` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `MaWebsite`, `MaDanhMuc`, `MaCuaHang`, `TenSP`, `LinkSP`, `GiaHienTai`, `SoLuongDaBan`, `DiemDanhGia`, `SoLuongDanhGia`, `MoTa`, `LanCapNhatCuoi`) VALUES
(1, 1, 1, 1, 'Điện thoại Samsung Galaxy S24 Ultra', 'https://shopee.vn/product/123456', 25990000.00, 90, 4.00, 500, 'Bản cao cấp nhất, camera 200MP, pin 5000mAh', '2025-10-20 20:29:48'),
(2, 2, 2, 2, 'MacBook Air M3 2024 13-inch', 'https://www.lazada.vn/product/987654', 28990000.00, 700, 4.80, 300, 'Chip Apple M3, pin 18 giờ, bản quốc tế', '2025-10-20 20:26:34'),
(3, 3, 3, 3, 'Apple Watch Ultra 2', 'https://tiki.vn/product/456789', 19990000.00, 400, 4.70, 220, 'Màn hình sáng hơn, pin 36h, GPS kép', '2025-10-20 20:26:34'),
(9, 3, 3, 3, 'Apple iPhone 13', 'https://tiki.vn/apple-iphone-13-hang-chinh-hang-p184059211.html?spid=123547403', 11990000.00, 6832, 5.00, NULL, '', '2025-10-20 20:47:20'),
(10, 3, 3, 3, 'Apple iPhone Air', 'https://tiki.vn/apple-iphone-air-p278630285.html?spid=278630809', 29990000.00, 26, 5.00, NULL, '', '2025-10-20 20:47:20'),
(11, 3, 3, 3, 'Apple iPhone 17 Pro', 'https://tiki.vn/apple-iphone-17-pro-p278628812.html?spid=278630769', 34490000.00, 32, 5.00, NULL, '', '2025-10-20 20:47:21'),
(12, 3, 3, 3, 'Apple iPhone 17 Pro Max', 'https://tiki.vn/apple-iphone-17-pro-max-p278628866.html?spid=278630779', 44490000.00, 148, 5.00, NULL, '', '2025-10-20 20:47:21'),
(13, 3, 3, 3, 'Apple iPhone 16 Pro Max', 'https://tiki.vn/apple-iphone-16-pro-max-p276109904.html?spid=276109959', 30250000.00, 1211, 5.00, NULL, '', '2025-10-20 20:47:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `website`
--

CREATE TABLE `website` (
  `MaWebsite` int(11) NOT NULL,
  `TenWebsite` varchar(100) NOT NULL,
  `BaseURL` varchar(255) DEFAULT NULL,
  `MoTa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `website`
--

INSERT INTO `website` (`MaWebsite`, `TenWebsite`, `BaseURL`, `MoTa`) VALUES
(1, 'Shopee', 'https://shopee.vn', 'Sàn TMĐT phổ biến tại Việt Nam'),
(2, 'Lazada', 'https://www.lazada.vn', 'Thuộc tập đoàn Alibaba'),
(3, 'Tiki', 'https://tiki.vn', 'Sàn thương mại điện tử của Việt Nam');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `baocaothongke`
--
ALTER TABLE `baocaothongke`
  ADD PRIMARY KEY (`MaBaoCao`),
  ADD KEY `MaWebsite` (`MaWebsite`);

--
-- Chỉ mục cho bảng `cuahang`
--
ALTER TABLE `cuahang`
  ADD PRIMARY KEY (`MaCuaHang`),
  ADD KEY `MaWebsite` (`MaWebsite`);

--
-- Chỉ mục cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD PRIMARY KEY (`MaDanhGia`),
  ADD KEY `MaSP` (`MaSP`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`MaDanhMuc`),
  ADD KEY `MaWebsite` (`MaWebsite`);

--
-- Chỉ mục cho bảng `lichsudangnhap`
--
ALTER TABLE `lichsudangnhap`
  ADD PRIMARY KEY (`MaLichSu`),
  ADD KEY `MaND` (`MaND`);

--
-- Chỉ mục cho bảng `lichsugia`
--
ALTER TABLE `lichsugia`
  ADD PRIMARY KEY (`MaLichSu`),
  ADD KEY `MaSP` (`MaSP`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`MaND`),
  ADD UNIQUE KEY `TenDangNhap` (`TenDangNhap`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSP`),
  ADD KEY `MaWebsite` (`MaWebsite`),
  ADD KEY `MaDanhMuc` (`MaDanhMuc`),
  ADD KEY `MaCuaHang` (`MaCuaHang`);

--
-- Chỉ mục cho bảng `website`
--
ALTER TABLE `website`
  ADD PRIMARY KEY (`MaWebsite`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `baocaothongke`
--
ALTER TABLE `baocaothongke`
  MODIFY `MaBaoCao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cuahang`
--
ALTER TABLE `cuahang`
  MODIFY `MaCuaHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  MODIFY `MaDanhGia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `MaDanhMuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `lichsudangnhap`
--
ALTER TABLE `lichsudangnhap`
  MODIFY `MaLichSu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lichsugia`
--
ALTER TABLE `lichsugia`
  MODIFY `MaLichSu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `MaND` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `website`
--
ALTER TABLE `website`
  MODIFY `MaWebsite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `baocaothongke`
--
ALTER TABLE `baocaothongke`
  ADD CONSTRAINT `baocaothongke_ibfk_1` FOREIGN KEY (`MaWebsite`) REFERENCES `website` (`MaWebsite`);

--
-- Các ràng buộc cho bảng `cuahang`
--
ALTER TABLE `cuahang`
  ADD CONSTRAINT `cuahang_ibfk_1` FOREIGN KEY (`MaWebsite`) REFERENCES `website` (`MaWebsite`);

--
-- Các ràng buộc cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD CONSTRAINT `danhgia_ibfk_1` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`);

--
-- Các ràng buộc cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD CONSTRAINT `danhmuc_ibfk_1` FOREIGN KEY (`MaWebsite`) REFERENCES `website` (`MaWebsite`);

--
-- Các ràng buộc cho bảng `lichsudangnhap`
--
ALTER TABLE `lichsudangnhap`
  ADD CONSTRAINT `lichsudangnhap_ibfk_1` FOREIGN KEY (`MaND`) REFERENCES `nguoidung` (`MaND`);

--
-- Các ràng buộc cho bảng `lichsugia`
--
ALTER TABLE `lichsugia`
  ADD CONSTRAINT `lichsugia_ibfk_1` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`MaWebsite`) REFERENCES `website` (`MaWebsite`),
  ADD CONSTRAINT `sanpham_ibfk_2` FOREIGN KEY (`MaDanhMuc`) REFERENCES `danhmuc` (`MaDanhMuc`),
  ADD CONSTRAINT `sanpham_ibfk_3` FOREIGN KEY (`MaCuaHang`) REFERENCES `cuahang` (`MaCuaHang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
