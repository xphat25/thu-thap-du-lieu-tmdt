<?php
header("Content-Type: application/json; charset=utf-8");
$output = shell_exec("python ../crawler/crawler_lazada.py 2>&1");
echo json_encode(["status" => "success", "message" => "Đã cào Lazada xong!", "output" => $output]);
?>
