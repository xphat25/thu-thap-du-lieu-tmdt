<?php
header("Content-Type: application/json; charset=utf-8");
$python = "C:\\Users\\<tên_user_của_bạn>\\AppData\\Local\\Programs\\Python\\Python312\\python.exe";
$command = "\"$python\" \"../crawler/crawler_shopee.py\" 2>&1";
$output = shell_exec($command);

if ($output === null || trim($output) === "") {
    echo json_encode(["status" => "error", "message" => "Không thể chạy Python hoặc không có dữ liệu trả về."]);
    exit;
}

echo json_encode(["status" => "success", "message" => "Đã cào Shopee thành công ✅", "output" => $output]);
?>
