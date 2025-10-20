# -*- coding: utf-8 -*-
import subprocess, time

def run_script(file):
    print(f"🚀 Đang chạy {file} ...")
    try:
        result = subprocess.run(["python", file], capture_output=True, text=True)
        print(result.stdout)
    except Exception as e:
        print(f"❌ Lỗi khi chạy {file}: {e}")

if __name__ == "__main__":
    print("=== BẮT ĐẦU CÀO DỮ LIỆU TOÀN BỘ ===")
    for f in ["crawler_shopee.py", "crawler_lazada.py", "crawler_tiki.py"]:
        run_script(f)
        time.sleep(1)
    print("✅ Hoàn tất cào dữ liệu từ Shopee, Lazada, Tiki!")
