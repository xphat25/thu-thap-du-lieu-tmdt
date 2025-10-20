<?php
// Chạy Python crawler_tmdt.py và trả kết quả
header("Content-Type: application/json; charset=utf-8");

$cmd = escapeshellcmd("python ../crawler/crawler_tmdt.py");
$output = shell_exec($cmd);

echo json_encode([
    "status" => "success",
    "message" => "Cào dữ liệu hoàn tất!",
    "output" => $output
]);
?>
