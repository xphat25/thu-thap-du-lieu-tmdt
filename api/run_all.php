<?php
header("Content-Type: application/json; charset=utf-8");

// ✅ Đường dẫn Python tuyệt đối (thay bằng đường dẫn Python máy bạn)
$python = "C:\\Users\\<tên_user_của_bạn>\\AppData\\Local\\Programs\\Python\\Python312\\python.exe";

// ✅ Lệnh chạy file crawler_all.py
$command = "\"$python\" \"../crawler/crawler_all.py\" 2>&1";

$output = shell_exec($command);

// Nếu không có kết quả trả về
if ($output === null || trim($output) === "") {
    echo json_encode([
        "status" => "error",
        "message" => "Không có dữ liệu trả về. Kiểm tra lại quyền shell_exec hoặc đường dẫn Python."
    ]);
    exit;
}

// ✅ Trả JSON hợp lệ
echo json_encode([
    "status" => "success",
    "message" => "Đã cào dữ liệu thành công ✅",
    "output" => $output
]);
?>
