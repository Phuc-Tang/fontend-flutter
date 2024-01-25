## Cài đặt và chạy frontend ứng dụng đặt phòng khách sạn flutter
### 1. Cài đặt
* Vào https://github.com/Phuc-Tang/backend-flutter và clone backend của ứng dụng về trước, sau đó làm theo hướng dẫn.
* Tiếp đến clone dự án frontend về máy `git clone https://github.com/Phuc-Tang/fontend-flutter.git`
* Sử dụng câu lệnh `flutter pub get` để cài đặt toàn bộ package có trong tệp __pubspec.yaml__.
### 2. Cấu hình lại địa chỉ IPv4
* Mở terminal và sử dụng `ipconfig` để lấy địa chỉ IPv4 đang sử dụng.
* Mở dự án frontend bằng vscode, vào thư mục config.dart trong lib/network.
* Thay đổi cấu hình địa chỉ phù hợp với địa chỉ IPv4 đang sử dụng.
### 3. Chạy dự án
* Sau khi cài đặt và cấu hình địa chỉ IP, chạy dự án frontend bằng `flutter run`
## Lưu ý
 - Cài đặt flutter SDK, Dart SDK và nodejs trước
 - Chạy frontend song song với backend https://github.com/Phuc-Tang/backend-flutter
