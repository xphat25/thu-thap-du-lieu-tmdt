<?php
include "db.php";

$sql = "SELECT sp.MaSP, sp.TenSP, sp.GiaHienTai, sp.SoLuongDaBan, sp.DiemDanhGia,
               ch.TenCuaHang, w.TenWebsite, sp.LinkSP
        FROM sanpham sp
        JOIN cuahang ch ON sp.MaCuaHang = ch.MaCuaHang
        JOIN website w ON sp.MaWebsite = w.MaWebsite";

$result = $conn->query($sql);
$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode(["status" => "success", "data" => $data], JSON_UNESCAPED_UNICODE);
?>
