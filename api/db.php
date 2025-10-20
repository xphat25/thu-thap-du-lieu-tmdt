<?php
$host = "localhost";
$port = 3307;       
$user = "root";
$pass = "";            
$dbname = "thuthapdulieutmdt";

// Kết nối MySQL với port chỉ định
$conn = @new mysqli($host, $user, $pass, $dbname, $port);

if ($conn->connect_errno) {
    die("❌ Lỗi kết nối MySQL: " . $conn->connect_error);
}

$conn->set_charset("utf8mb4");

// echo "✅ Kết nối thành công";
?>
