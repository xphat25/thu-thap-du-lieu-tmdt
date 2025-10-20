<?php
header("Content-Type: application/json; charset=utf-8");
$output = shell_exec("python ../crawler/crawler_tiki.py 2>&1");
echo json_encode(["status" => "success", "message" => "Đã cào Tiki xong!", "output" => $output]);
?>
