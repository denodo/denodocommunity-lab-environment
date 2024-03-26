conn = new Mongo();
db = conn.getDB("product");

db.products.insert([
                {
                    "_id": "65d4ea7a64dfc6732f5e8c35",
                    "index": 0,
                    "productid":1,
                    "productname":"Onyx O3",
                    "productprice":298.0,
                    "category":{"categoryid":1,"categoryname":"smartphone"},
                    "characteristics":{
                        "characteristic_dimensions":"145.75 x 70.8 x 7.26 mm",
                        "characteristic_weight":"125 gr",
                        "characteristic_details":"CPU Speed Qualcomm Snapdragon 617,Octa-core; 64-bit, 4 x 1.5GHz + 4x,1.2GHz,2G GSM/GPRS/EDGE: 850/900/1800/1900; 3G UMTS",
                        "characteristic_color":"black"},
                    "accessories":[
                        {
                            "productid":16,
                            "productname":"HighSpeed Battery Charger 500",
                            "productprice":19.99
                        },{
                            "productid":18,
                            "productname":"HeadSet Total audio 15",
                            "productprice":25.75
                        },{
                            "productid":30,
                            "productname":"Studio Stereo 2.1 Bluetooth",
                            "productprice":12.25}
                        ]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c36",
                    "index": 1,
                    "productid":2,
                    "productname":"Onyx O4",
                    "productprice":385.0,
                    "category":{"categoryid":1,"categoryname":"smartphone"},
                    "characteristics":{"characteristic_dimensions":"148.25 x 71.8 x 7.56 mm","characteristic_weight":"135 gr","characteristic_details":"CPU Speed Qualcomm Snapdragon 618,Octa-core; 64-bit, 4 x 1.7GHz + 4x,1.3GHz,2G GSM/GPRS/EDGE: 850/900/1800/1900; 3G UMTS","characteristic_color":"grey"},
                    "accessories":[{"productid":15,"productname":"DataP Micro SD card","productprice":19.99},{"productid":16,"productname":"HighSpeed Battery Charger 500","productprice":19.99},{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75},{"productid":28,"productname":"HighSpeed Pro Storage 32GB","productprice":30.5},{"productid":30,"productname":"Studio Stereo 2.1 Bluetooth","productprice":12.25}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c37",
                    "index": 2,
                    "productid":3,
                    "productname":"Onyx O5",
                    "productprice":499.99,
                    "category":{"categoryid":1,"categoryname":"smartphone"},
                    "characteristics":{"characteristic_dimensions":"150.25 x 68.8 x 7.01 mm","characteristic_weight":"115 gr","characteristic_details":"CPU Speed Qualcomm Snapdragon 620,Octa-core; 64-bit, 8 x 2.1GHz,2G GSM/GPRS/EDGE: 850/900/1800/1900; 3G UMTS","characteristic_color":"black"},
                    "accessories":[{"productid":15,"productname":"DataP Micro SD card","productprice":19.99},{"productid":16,"productname":"HighSpeed Battery Charger 500","productprice":19.99},{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75},{"productid":27,"productname":"HighSpeed Pro Storage 64GB","productprice":40.5},{"productid":28,"productname":"HighSpeed Pro Storage 32GB","productprice":30.5},{"productid":30,"productname":"Studio Stereo 2.1 Bluetooth","productprice":12.25}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c38",
                    "index": 3,
                    "productid":4,"productname":"Moonstone M8","productprice":249.99,"category":{"categoryid":2,"categoryname":"tablet"},"characteristics":{"characteristic_dimensions":"228.25 x 153.68 x 7.95 mm","characteristic_weight":"435 gr","characteristic_details":"CPU Speed 64-bit Tigris P1 Pro 2.3GHz, Network 2G/2.5G - GSM/GPRS/EDGE:850/900/1800/1900 MHz 3G - WCDMA","characteristic_color":"white"},"accessories":[{"productid":16,"productname":"HighSpeed Battery Charger 500","productprice":19.99},{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75},{"productid":30,"productname":"Studio Stereo 2.1 Bluetooth","productprice":12.25}]
                },{
                    
                    "_id": "65d4ea7a64dfc6732f5e8c39",
                    "index": 4,
                    "productid":5,"productname":"Moonstone M9","productprice":350.5,"category":{"categoryid":2,"categoryname":"tablet"},"characteristics":{"characteristic_dimensions":"231.25 x 131.68 x 8.35 mm","characteristic_weight":"455 gr","characteristic_details":"CPU Speed 64-bit Tigris P2 Pro 2.4GHz, Network 2G/2.5G - GSM/GPRS/EDGE:850/900/1800/1900 MHz 3G - WCDMA","characteristic_color":"white"},"accessories":[{"productid":15,"productname":"DataP Micro SD card","productprice":19.99},{"productid":16,"productname":"HighSpeed Battery Charger 500","productprice":19.99},{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75},{"productid":30,"productname":"Studio Stereo 2.1 Bluetooth","productprice":12.25}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c40",
                    "index": 5,
                    "productid":6,"productname":"Moonstone M12","productprice":399.0,"category":{"categoryid":2,"categoryname":"tablet"},"characteristics":{"characteristic_dimensions":"275.25 x 180.68 x 7.75 mm","characteristic_weight":"501 gr","characteristic_details":"CPU Speed 64-bit Tigris PX Pro 3GHz, Network 2G/2.5G - GSM/GPRS/EDGE:850/900/1800/1900 MHz 3G - WCDMA","characteristic_color":"white"},"accessories":[{"productid":15,"productname":"DataP Micro SD card","productprice":19.99},{"productid":16,"productname":"HighSpeed Battery Charger 500","productprice":19.99},{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75},{"productid":27,"productname":"HighSpeed Pro Storage 64GB","productprice":40.5},{"productid":28,"productname":"HighSpeed Pro Storage 32GB","productprice":30.5},{"productid":30,"productname":"Studio Stereo 2.1 Bluetooth","productprice":12.25}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c41",
                    "index": 6,
                    "productid":7,"productname":"Quartz 2000","productprice":555.0,"category":{"categoryid":3,"categoryname":"laptop"},"characteristics":{"characteristic_dimensions":"314.25 x 219.25 x 18 mm","characteristic_weight":"1105 gr","characteristic_details":"2.7GHz dual-core Core processor (Turbo Boost up to 3.1GHz) with 3MB shared L3 cache, 128GB Storage","characteristic_color":"white"},"accessories":[{"productid":17,"productname":"DualP Charger","productprice":9.99},{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c42",
                    "index": 7,
                    "productid":8,"productname":"Quartz 3000","productprice":999.99,"category":{"categoryid":3,"categoryname":"laptop"},"characteristics":{"characteristic_dimensions":"354.25 x 234.25 x 20 mm","characteristic_weight":"1450 gr","characteristic_details":"3.2GHz dual-core Core processor (Turbo Boost up to 3.6GHz) with 4MB shared L3 cache, 256GB Storage","characteristic_color":"white"},"accessories":[{"productid":17,"productname":"DualP Charger","productprice":9.99},{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c43",
                    "index": 8,
                    "productid":9,"productname":"Quartz Plus","productprice":1500.0,"category":{"categoryid":3,"categoryname":"laptop"},"characteristics":{"characteristic_dimensions":"360.50 x 235.25 x 18 mm","characteristic_weight":"1205 gr","characteristic_details":"3.3GHz dual-core Core processor, 4MB L3 cache, 512GB Storage","characteristic_color":"white"},"accessories":[{"productid":17,"productname":"DualP Charger","productprice":9.99},{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c44",
                    "index": 9,
                    "productid":10,"productname":"Quartz X GT","productprice":2000.0,"category":{"categoryid":3,"categoryname":"laptop"},"characteristics":{"characteristic_dimensions":"380.50 x 245.25 x 19 mm","characteristic_weight":"1505 gr","characteristic_details":"3.1GHz octa-core Core processor, 8MB L3 cache, 512GB Storage","characteristic_color":"black"},"accessories":[{"productid":17,"productname":"DualP Charger","productprice":9.99},{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c45",
                    "index": 10,
                    "productid":11,"productname":"Rainbow Full LE","productprice":585.0,"category":{"categoryid":4,"categoryname":"television"},"characteristics":{"characteristic_dimensions":"781 x 480.2 x 170.5 mm","characteristic_weight":" 4415 gr","characteristic_details":"Full LED HD5500 Smart - 45' Class P3X","characteristic_color":"black"},"accessories":[{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c46",
                    "index": 11,
                    "productid":12,"productname":"Emerald HD","productprice":800.0,"category":{"categoryid":4,"categoryname":"television"},"characteristics":{"characteristic_dimensions":"741 x 460.2 x 150.5 mm","characteristic_weight":" 4015 gr","characteristic_details":"4K UHD HD7500 Series Smart TV - 40' Class (40.0' Diag.)","characteristic_color":"black"},"accessories":[{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75},{"productid":19,"productname":"Remote Control Emerald","productprice":30.99},{"productid":31,"productname":"Emerald Power","productprice":19.9}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c47",
                    "index": 12,
                    "productid":13,"productname":"Emerald 3D","productprice":1000.0,"category":{"categoryid":4,"categoryname":"television"},"characteristics":{"characteristic_dimensions":"771 x 490.2 x 170.5 mm","characteristic_weight":" 4415 gr","characteristic_details":"4K UHD HD8500 Series Smart TV - 47' Class (47.0' Diag.)","characteristic_color":"black"},"accessories":[{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75},{"productid":19,"productname":"Remote Control Emerald","productprice":30.99},{"productid":31,"productname":"Emerald Power","productprice":19.9}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c48",
                    "index": 13,
                    "productid":14,"productname":"Emerald FX","productprice":1500.0,"category":{"categoryid":4,"categoryname":"television"},"characteristics":{"characteristic_dimensions":"800 x 510.2 x 200.5 mm","characteristic_weight":" 5015 gr","characteristic_details":"4K UHD HD8850 Series Smart TV - 57' Class (57.0' Diag.)","characteristic_color":"black"},"accessories":[{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75},{"productid":19,"productname":"Remote Control Emerald","productprice":30.99},{"productid":31,"productname":"Emerald Power","productprice":19.9}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c49",
                    "index": 14,
                    "productid":15,"productname":"DataP Micro SD card","productprice":19.99,"category":{"categoryid":5,"categoryname":"accessory"},"characteristics":null,"accessories":null
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c50",
                    "index": 15,
                    "productid":16,"productname":"HighSpeed Battery Charger 500","productprice":19.99,"category":{"categoryid":5,"categoryname":"accessory"},"characteristics":null,"accessories":null
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c51",
                    "index": 16,
                    "productid":17,"productname":"DualP Charger","productprice":9.99,"category":{"categoryid":5,"categoryname":"accessory"},"characteristics":null,"accessories":null
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c52",
                    "index": 17,
                    "productid":18,"productname":"HeadSet Total audio 15","productprice":25.75,"category":{"categoryid":5,"categoryname":"accessory"},"characteristics":null,"accessories":null
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c53",
                    "index": 18,
                    "productid":19,"productname":"Remote Control Emerald","productprice":30.99,"category":{"categoryid":5,"categoryname":"accessory"},"characteristics":null,"accessories":null
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c54",
                    "index": 19,
                    "productid":20,"productname":"Onyx O6X","productprice":679.0,"category":{"categoryid":1,"categoryname":"smartphone"},"characteristics":{"characteristic_dimensions":"160.75 x 75.8 x 7.10 mm","characteristic_weight":"130 gr","characteristic_details":"CPU Speed Qualcomm Snapdragon 725,Octa-core; 64-bit, 8 x 2.4GHz 16GB ,2G GSM/GPRS/EDGE: 850/900/1800/1900; 3G UMTS","characteristic_color":"black"},"accessories":[{"productid":15,"productname":"DataP Micro SD card","productprice":19.99},{"productid":16,"productname":"HighSpeed Battery Charger 500","productprice":19.99},{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75},{"productid":27,"productname":"HighSpeed Pro Storage 64GB","productprice":40.5},{"productid":28,"productname":"HighSpeed Pro Storage 32GB","productprice":30.5},{"productid":29,"productname":"Shield total protection 6\"","productprice":5.0},{"productid":30,"productname":"Studio Stereo 2.1 Bluetooth","productprice":12.25}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c55",
                    "index": 20,
                    "productid":21,"productname":"Garnet Sphere 3","productprice":350.0,"category":{"categoryid":2,"categoryname":"tablet"},"characteristics":{"characteristic_dimensions":"380.50 x 255.25 x 19 mm","characteristic_weight":"1305 gr","characteristic_details":"3.0GHz bi-code Core, 8MB L3 cache, 256GB Storage","characteristic_color":"metalic"},"accessories":[{"productid":16,"productname":"HighSpeed Battery Charger 500","productprice":19.99},{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75},{"productid":30,"productname":"Studio Stereo 2.1 Bluetooth","productprice":12.25}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c56",
                    "index": 21,
                    "productid":22,"productname":"Onyx O6X 32GB","productprice":750.0,"category":{"categoryid":1,"categoryname":"smartphone"},"characteristics":{"characteristic_dimensions":"160.75 x 75.8 x 7.10 mm","characteristic_weight":"130 gr","characteristic_details":"CPU Speed Qualcomm Snapdragon 725,Octa-core; 64-bit, 8 x 2.4GHz 64GB ,2G GSM/GPRS/EDGE: 850/900/1800/1900; 3G UMTS","characteristic_color":"ceramic"},"accessories":[{"productid":15,"productname":"DataP Micro SD card","productprice":19.99},{"productid":16,"productname":"HighSpeed Battery Charger 500","productprice":19.99},{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75},{"productid":29,"productname":"Shield total protection 6\"","productprice":5.0},{"productid":30,"productname":"Studio Stereo 2.1 Bluetooth","productprice":12.25}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c57",
                    "index": 22,
                    "productid":23,"productname":"Onyx O6X 64GB","productprice":799.99,"category":{"categoryid":1,"categoryname":"smartphone"},"characteristics":{"characteristic_dimensions":"160.75 x 75.8 x 7.10 mm","characteristic_weight":"130 gr","characteristic_details":"CPU Speed Qualcomm Snapdragon 725,Octa-core; 64-bit, 8 x 2.4GHz 32GB ,2G GSM/GPRS/EDGE: 850/900/1800/1900; 3G UMTS","characteristic_color":"black"},"accessories":[{"productid":15,"productname":"DataP Micro SD card","productprice":19.99},{"productid":16,"productname":"HighSpeed Battery Charger 500","productprice":19.99},{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75},{"productid":29,"productname":"Shield total protection 6\"","productprice":5.0},{"productid":30,"productname":"Studio Stereo 2.1 Bluetooth","productprice":12.25}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c58",
                    "index": 23,
                    "productid":24,"productname":"Emerald FX 50","productprice":1800.0,"category":{"categoryid":4,"categoryname":"television"},"characteristics":{"characteristic_dimensions":"815 x 499.2 x 175.5 mm","characteristic_weight":" 4415 gr","characteristic_details":"4K UHD HD7700 Series Smart TV - 50' Class (50.0' Diag.)","characteristic_color":"white"},"accessories":[{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75},{"productid":19,"productname":"Remote Control Emerald","productprice":30.99},{"productid":31,"productname":"Emerald Power","productprice":19.9}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c59",
                    "index": 24,
                    "productid":25,"productname":"Emerald FX 60","productprice":2100.0,"category":{"categoryid":4,"categoryname":"television"},"characteristics":{"characteristic_dimensions":"855 x 525.2 x 200.5 mm","characteristic_weight":" 5015 gr","characteristic_details":"4K UHD HD775 Series Smart TV - 60' Class ","characteristic_color":"white"},"accessories":[{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75},{"productid":19,"productname":"Remote Control Emerald","productprice":30.99},{"productid":31,"productname":"Emerald Power","productprice":19.9}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c60",
                    "index": 25,
                    "productid":26,"productname":"Coral C1","productprice":99.99,"category":{"categoryid":1,"categoryname":"smartphone"},"characteristics":{"characteristic_dimensions":"115.75 x 55.8 x 9.26 mm","characteristic_weight":"155 gr","characteristic_details":"CPU Dual 550,Dual-core; 32-bit, 2 x 1.2GHz,2G GSM/GPRS/EDGE: 850/900/1800/1900; 3G UMTS","characteristic_color":"black"},"accessories":[{"productid":16,"productname":"HighSpeed Battery Charger 500","productprice":19.99},{"productid":18,"productname":"HeadSet Total audio 15","productprice":25.75},{"productid":30,"productname":"Studio Stereo 2.1 Bluetooth","productprice":12.25}]
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c61",
                    "index": 26,
                    "productid":27,"productname":"HighSpeed Pro Storage 64GB","productprice":40.5,"category":{"categoryid":5,"categoryname":"accessory"},"characteristics":null,"accessories":null
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c62",
                    "index": 27,
                    "productid":28,"productname":"HighSpeed Pro Storage 32GB","productprice":30.5,"category":{"categoryid":5,"categoryname":"accessory"},"characteristics":null,"accessories":null
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c63",
                    "index": 28,
                    "productid":29,"productname":"Shield total protection 6\"","productprice":5.0,"category":{"categoryid":5,"categoryname":"accessory"},"characteristics":null,"accessories":null
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c64",
                    "index": 29,
                    "productid":30,"productname":"Studio Stereo 2.1 Bluetooth","productprice":12.25,"category":{"categoryid":5,"categoryname":"accessory"},"characteristics":null,"accessories":null
                },{
                    "_id": "65d4ea7a64dfc6732f5e8c65",
                    "index": 30,
                    "productid":31,"productname":"Emerald Power","productprice":19.9,"category":{"categoryid":5,"categoryname":"accessory"},"characteristics":null,"accessories":null
                }]);