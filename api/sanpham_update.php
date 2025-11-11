<?php
include "db.php";

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['MaSP'])) {
    echo json_encode(["status" => "error", "message" => "Thiếu mã sản phẩm"]);
    exit;
}

$stmt = $conn->prepare("UPDATE sanpham 
                        SET TenSP=?, GiaBan=?, GiaCu=?, SoLuongDaBan=?, DiemDanhGia=?, TenCuaHang=?, LinkSP=?, NgayThuThap=NOW() 
                        WHERE MaSP=?");
$stmt->bind_param(
    "sdsdsssi",
    $data['TenSP'],
    $data['GiaBan'],
    $data['GiaCu'],
    $data['SoLuongDaBan'],
    $data['DiemDanhGia'],
    $data['TenCuaHang'],
    $data['LinkSP'],
    $data['MaSP']
);

if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "Cập nhật sản phẩm thành công ✏️"]);
} else {
    echo json_encode(["status" => "error", "message" => "Không thể cập nhật sản phẩm"]);
}
?>
