<?php
include "db.php";

$sql = "SELECT * FROM sanpham ORDER BY NgayThuThap DESC";
$result = $conn->query($sql);

$data = [];
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data, JSON_UNESCAPED_UNICODE);
?>
