<?php
include "db.php";

$id = $_GET["id"];
$sql = "DELETE FROM sanpham WHERE MaSP = $id";

if ($conn->query($sql)) {
    echo json_encode(["status" => "success", "message" => "Xóa sản phẩm thành công"]);
} else {
    echo json_encode(["status" => "error", "message" => $conn->error]);
}
?>
