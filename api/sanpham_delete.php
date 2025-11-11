<?php
include "db.php";

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['MaSP'])) {
    echo json_encode(["status" => "error", "message" => "Thiếu mã sản phẩm"]);
    exit;
}

$stmt = $conn->prepare("DELETE FROM sanpham WHERE MaSP = ?");
$stmt->bind_param("i", $data['MaSP']);

if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "Xóa sản phẩm thành công 🗑️"]);
} else {
    echo json_encode(["status" => "error", "message" => "Không thể xóa sản phẩm"]);
}
?>
