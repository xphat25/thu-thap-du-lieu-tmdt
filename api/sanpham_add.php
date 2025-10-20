<?php
include "db.php";

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data["TenSP"]) || !isset($data["GiaHienTai"]) || !isset($data["LinkSP"])) {
    echo json_encode(["status" => "error", "message" => "Thiếu dữ liệu cần thiết!"]);
    exit;
}

$maWebsite = $data["MaWebsite"];
$maDanhMuc = $data["MaDanhMuc"] ?? 1;
$maCuaHang = $data["MaCuaHang"] ?? 1;
$tenSP = $data["TenSP"];
$linkSP = $data["LinkSP"];
$gia = $data["GiaHienTai"];
$soLuongDaBan = $data["SoLuongDaBan"] ?? 0;
$diem = $data["DiemDanhGia"] ?? 0;
$moTa = $data["MoTa"] ?? "";

$sql = "INSERT INTO sanpham (MaWebsite, MaDanhMuc, MaCuaHang, TenSP, LinkSP, GiaHienTai, SoLuongDaBan, DiemDanhGia, MoTa, LanCapNhatCuoi)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";
$stmt = $conn->prepare($sql);
$stmt->bind_param("iiissddds", $maWebsite, $maDanhMuc, $maCuaHang, $tenSP, $linkSP, $gia, $soLuongDaBan, $diem, $moTa);

if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "Thêm sản phẩm thành công ✅"]);
} else {
    echo json_encode(["status" => "error", "message" => $conn->error]);
}

$stmt->close();
$conn->close();
?>
