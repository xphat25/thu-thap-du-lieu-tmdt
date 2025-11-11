<?php
include "db.php";

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['TenSP']) || !isset($data['GiaBan'])) {
    echo json_encode(["status" => "error", "message" => "Thiếu dữ liệu sản phẩm"]);
    exit;
}

$stmt = $conn->prepare("INSERT INTO sanpham (TenSP, GiaBan, GiaCu, SoLuongDaBan, DiemDanhGia, TenCuaHang, LinkSP) VALUES (?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param(
    "sdsdsss",
    $data['TenSP'],
    $data['GiaBan'],
    $data['GiaCu'],
    $data['SoLuongDaBan'],
    $data['DiemDanhGia'],
    $data['TenCuaHang'],
    $data['LinkSP']
);

if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "Thêm sản phẩm thành công ✅"]);
} else {
    echo json_encode(["status" => "error", "message" => "Lỗi khi thêm sản phẩm ❌"]);
}
?>
