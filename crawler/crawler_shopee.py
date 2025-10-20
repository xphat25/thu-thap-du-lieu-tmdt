# -*- coding: utf-8 -*-
import requests, time

API_URL = "http://127.0.0.1/thuthapdulieutmdt/api/sanpham_add.php"
HEADERS = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
    "Referer": "https://shopee.vn/",
    "Accept": "application/json, text/plain, */*"
}

def add_to_db(product):
    try:
        res = requests.post(API_URL, json=product)
        print("🟢", product["TenSP"], "→", res.text)
    except Exception as e:
        print("❌ Gửi lỗi:", e)

def crawl_shopee(keyword="iphone"):
    print(f"🟠 Cào Shopee: {keyword}")
    url = f"https://shopee.vn/api/v4/search/search_items?by=relevancy&keyword={keyword}&limit=5&newest=0"
    res = requests.get(url, headers=HEADERS, timeout=10)
    data = res.json()
    for item in data.get("items", []):
        info = item["item_basic"]
        product = {
            "MaWebsite": 1,
            "MaDanhMuc": 1,
            "MaCuaHang": 1,
            "TenSP": info["name"],
            "LinkSP": f"https://shopee.vn/{info['name'].replace(' ', '-')}-i.{info['shopid']}.{info['itemid']}",
            "GiaHienTai": info["price"] / 100000,
            "SoLuongDaBan": info.get("sold", 0),
            "DiemDanhGia": info.get("item_rating", {}).get("rating_star", 0),
            "MoTa": f"ShopID: {info['shopid']}"
        }
        add_to_db(product)
        time.sleep(0.5)

if __name__ == "__main__":
    crawl_shopee("iphone")
