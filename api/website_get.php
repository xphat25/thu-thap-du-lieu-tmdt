<?php
include "db.php";

$result = $conn->query("SELECT * FROM website");
$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode(["status" => "success", "data" => $data], JSON_UNESCAPED_UNICODE);
?>
