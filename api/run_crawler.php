<?php
header("Content-Type: application/json; charset=UTF-8");

// ✅ 1. Đường dẫn tới Python và file cào
$python = "C:\\Users\\ASUS\\AppData\\Local\\Microsoft\\WindowsApps\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\python.exe";
$script = "C:\\xampp\\htdocs\\thuthapdulieutmdt\\crawler\\sieuthiyte.py";

// ✅ 2. Chạy file Python
exec("\"$python\" \"$script\" 2>&1", $output, $return_code);
file_put_contents("log_crawler.txt", implode("\n", $output));

if ($return_code !== 0) {
    echo json_encode([
        "status" => "error",
        "message" => "Không thể chạy script Python. Code: $return_code",
        "log" => $output
    ]);
}


// ✅ 3. Lấy JSON từ Python
$json = implode("\n", $output);
$data = json_decode($json, true);

if (!$data || !isset($data["products"])) {
    echo json_encode([
        "status" => "error",
        "message" => "Không có dữ liệu hợp lệ từ Python."
    ]);
    exit;
}

// ✅ 4. Gửi từng sản phẩm sang API thêm sản phẩm
$added = 0;
foreach ($data["products"] as $sp) {
    $api_url = "http://127.0.0.1/thuthapdulieutmdt/api/sanpham_add.php";
    $payload = json_encode([
        "TenSP" => $sp["title"],
        "GiaBan" => preg_replace("/\D/", "", $sp["price"]),
        "GiaCu" => preg_replace("/\D/", "", $sp["oldPrice"]),
        "SoLuongDaBan" => 0,
        "DiemDanhGia" => 0,
        "TenCuaHang" => "Siêu Thị Y Tế",
        "LinkSP" => $sp["link"]
    ]);

    $ch = curl_init($api_url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, ["Content-Type: application/json"]);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);
    $res = curl_exec($ch);
    curl_close($ch);

    if ($res) $added++;
}

// ✅ 5. Phản hồi kết quả
echo json_encode([
    "status" => "success",
    "message" => "Đã thêm $added sản phẩm từ Siêu Thị Y Tế vào database ✅"
]);
?>
