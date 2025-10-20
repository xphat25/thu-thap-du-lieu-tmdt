<?php
// ======================
// API cập nhật sản phẩm
// ======================

include "db.php";

// Đọc dữ liệu JSON gửi từ frontend hoặc Postman
$data = json_decode(file_get_contents("php://input"), true);

// Kiểm tra dữ liệu đầu vào
if (!isset($data["MaSP"])) {
    echo json_encode(["status" => "error", "message" => "Thiếu mã sản phẩm (MaSP)!"]);
    exit;
}

$maSP = $data["MaSP"];
$tenSP = $data["TenSP"] ?? null;
$giaHienTai = $data["GiaHienTai"] ?? null;
$soLuongDaBan = $data["SoLuongDaBan"] ?? null;
$diemDanhGia = $data["DiemDanhGia"] ?? null;
$linkSP = $data["LinkSP"] ?? null;
$moTa = $data["MoTa"] ?? null;

// Tạo câu lệnh SQL động
$sql = "UPDATE sanpham SET 
            TenSP = ?, 
            GiaHienTai = ?, 
            SoLuongDaBan = ?, 
            DiemDanhGia = ?, 
            LinkSP = ?, 
            MoTa = ?, 
            LanCapNhatCuoi = NOW()
        WHERE MaSP = ?";

$stmt = $conn->prepare($sql);
$stmt->bind_param("sdiissi", $tenSP, $giaHienTai, $soLuongDaBan, $diemDanhGia, $linkSP, $moTa, $maSP);

if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "Cập nhật sản phẩm thành công ✅"]);
} else {
    echo json_encode(["status" => "error", "message" => "Cập nhật thất bại: " . $conn->error]);
}

$stmt->close();
$conn->close();
?>
