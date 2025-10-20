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

def crawl_lazada(keyword="iphone"):
    print(f"🔵 Cào Lazada: {keyword}")
    url = f"https://ac.cnstrc.com/search/{keyword}?c=ciojs-client-2.33.3"
    data = requests.get(url, headers=HEADERS, timeout=10).json()
    results = data.get("response", {}).get("results", [])
    for r in results[:5]:
        name = r.get("value", "Không tên")
        product = {
            "MaWebsite": 2,
            "MaDanhMuc": 2,
            "MaCuaHang": 2,
            "TenSP": name,
            "LinkSP": f"https://www.lazada.vn/catalog/?q={name.replace(' ', '+')}",
            "GiaHienTai": float(r.get("price", 0)),
            "SoLuongDaBan": 0,
            "DiemDanhGia": 0,
            "MoTa": "Crawler Lazada"
        }
        add_to_db(product)
        time.sleep(0.5)

if __name__ == "__main__":
    crawl_lazada("iphone")
