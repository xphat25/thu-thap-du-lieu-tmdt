# -*- coding: utf-8 -*-
import requests, time

API_URL = "http://127.0.0.1/thuthapdulieutmdt/api/sanpham_add.php"
HEADERS = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"}

def add_to_db(product):
    try:
        res = requests.post(API_URL, json=product)
        print("🟢", product["TenSP"], "→", res.text)
    except Exception as e:
        print("❌ Gửi lỗi:", e)

def crawl_tiki(keyword="iphone"):
    print(f"🟢 Cào Tiki: {keyword}")
    url = f"https://tiki.vn/api/v2/products?limit=5&q={keyword}"
    data = requests.get(url, headers=HEADERS, timeout=10).json()
    for item in data.get("data", []):
        product = {
            "MaWebsite": 3,
            "MaDanhMuc": 3,
            "MaCuaHang": 3,
            "TenSP": item["name"],
            "LinkSP": f"https://tiki.vn/{item['url_path']}",
            "GiaHienTai": item.get("price", 0),
            "SoLuongDaBan": item.get("quantity_sold", {}).get("value", 0),
            "DiemDanhGia": item.get("rating_average", 0),
            "MoTa": item.get("short_description", "")
        }
        add_to_db(product)
        time.sleep(0.5)

if __name__ == "__main__":
    crawl_tiki("iphone")
