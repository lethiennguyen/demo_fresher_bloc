# 📦 Demo Fresher BLoC

Dự án Flutter mẫu được xây dựng trong chương trình onboarding **Fresher** tại SoftDreams, nhằm thực hành kiến trúc **Clean Architecture + BLoC** trên một ứng dụng CRUD sản phẩm thực tế.

---

## 🎯 Mục tiêu tuần

| Tuần | Nội dung |
|------|----------|
| **Tuần 1** | Setup dự án, cấu hình FVM, GetIt DI, cấu trúc thư mục Clean Architecture |
|            | Xây dựng tầng Data: API với Dio, Hive local cache, Base Repository, Mapper |
| **Tuần 2** | Xây dựng tầng Domain: Entity, UseCase, Repository interface |
|            | Xây dựng tầng Presentation: BLoC (Event/State), UI màn hình Login & Home |
| **Tuần 3** | Màn hình Detail sản phẩm, CRUD (thêm/xoá/sửa category & product), xử lý lỗi |
|            | Image Picker tích hợp Cloudinary, offline login với Hive, session management |
|            | Code review, refactor, viết README, polish UI |

---

## 🏗️ Kiến trúc

Dự án theo **Clean Architecture** chia làm 3 tầng rõ ràng, cộng với phần core/shared dùng chung:

```
lib/
├── main.dart                  # Entry point, khởi tạo Hive & DI
├── core/
│   ├── base/                  # Base classes: BLoC, Repository, UseCase, Widget
│   ├── router/                # AppRouter (tên route) + RouterPage (generate route)
│   └── values/                # AppColors, AppDimens, AppTextStyle (global)
├── shared/
│   ├── constants/             # ApiUrl, AppConst
│   ├── exceptions/            # Custom Exceptions
│   ├── model/                 # Base models (BaseResponse, BaseResponseList)
│   ├── themes/                # ThemeData
│   ├── utils/                 # Logger, Hive helper, extensions
│   └── widgets/               # TextUtils, LoadingWidget, EmptyWidget, ...
└── feature/
    ├── app/                   # Splash screen + AppBloc (kiểm tra session)
    ├── login/                 # Tính năng đăng nhập
    ├── home/                  # Danh sách sản phẩm & category
    ├── detail/                # Chi tiết sản phẩm, CRUD
    └── image_picker_load/     # Chọn ảnh & upload Cloudinary
```

### Mỗi feature theo cấu trúc:

```
feature/<name>/
├── data/
│   ├── data_sources/          # Gọi API (Dio) hoặc Hive local
│   ├── model/                 # JSON Model (fromJson / toJson)
│   └── repositories_imp/      # Implement Repository interface
├── domain/
│   ├── entity/                # Entity thuần (không phụ thuộc framework)
│   ├── repositories/          # Interface Repository
│   └── use_cases/             # Business logic (UseCase)
├── mapper/                    # Entity ↔ Model mapping
└── presentation/
    ├── bloc/                  # BLoC: Event, State, Bloc class
    └── page/                  # UI (Widget)
```

### Công nghệ sử dụng

| Thư viện | Mục đích |
|----------|----------|
| `flutter_bloc` | State management (BLoC pattern) |
| `get_it` | Dependency Injection |
| `dio` | HTTP client (gọi REST API) |
| `hive` / `hive_flutter` | Local storage (offline login, cache) |
| `envied` | Quản lý biến môi trường an toàn |
| `google_fonts` | Typography (Nunito Sans) |
| `image_picker` + Cloudinary | Chọn ảnh & upload lên cloud |
| `syncfusion_flutter_charts` | Biểu đồ thống kê |
| `skeletonizer` / `shimmer` | Loading skeleton UI |

---

## 🚀 Cách chạy

### Yêu cầu môi trường

| Công cụ | Phiên bản |
|---------|-----------|
| Flutter | `3.29.x` (quản lý qua FVM) |
| Dart SDK | `^3.6.2` |
| FVM | [Cài đặt FVM](https://fvm.app/documentation/getting-started/installation) |
| Backend API | Server REST chạy tại `http://<YOUR_IP>:8080/api/v1/` |

### Cài đặt

```bash
# 1. Clone project
git clone <repo-url>
cd demo_fresher_bloc

# 2. Cài đúng phiên bản Flutter qua FVM
fvm install
fvm use

# 3. Cài dependencies
fvm flutter pub get

# 4. Chạy ứng dụng
fvm flutter run
```

### Cấu hình API Base URL

Mở file `lib/shared/constants/api_url.dart` và thay `<YOUR_IP>` bằng địa chỉ máy chủ backend:

```dart
class ApiUrl {
  static const baseUrl = 'http://<YOUR_IP>:8080/api/v1/';
  // ...
}
```

> **Lưu ý:** Nếu chạy trên Android Emulator, dùng `http://10.0.2.2:8080/api/v1/`.  
> Nếu chạy trên thiết bị thật, dùng IP LAN của máy chủ (cùng mạng WiFi).

### Sample Data – Tài khoản đăng nhập

Tài khoản mẫu được đồng bộ từ backend. Đảm bảo backend đã seed dữ liệu trước khi chạy:

```
Email:    admin@example.com
Password: 123456
```

> Sau lần đăng nhập đầu tiên, tài khoản sẽ được lưu vào **Hive** để hỗ trợ offline login.

---

## 🔄 Flow chính

### 1. Khởi động (Splash)

```
App start
  └─▶ main() — Hive.initFlutter() + moduleDIApp() (GetIt register)
        └─▶ SplashPage
              └─▶ AppBloc(AppStarted)
                    ├─▶ [Có session] ──▶ Authenticated ──▶ /home
                    └─▶ [Không có]  ──▶ Unauthenticated ──▶ /login
```

### 2. Đăng nhập (Login)

```
LoginPage
  └─▶ User nhập email + password
        └─▶ LoginBloc(LoginSubmitted)
              ├─▶ Validate đầu vào
              ├─▶ LoginUseCase.call(LoginRequestEntity)
              │     └─▶ LoginRepository
              │           ├─▶ [Online]  — Gọi POST /api/v1/login (Dio)
              │           └─▶ [Offline] — Kiểm tra Hive local
              ├─▶ Lưu token + thông tin user vào Hive (session)
              └─▶ Navigate ──▶ /home
```

### 3. Màn hình Home (Product List)

```
HomePage
  └─▶ HomeBloc(HomeFetched)
        ├─▶ GET /api/v1/categories  — danh sách category
        ├─▶ GET /api/v1/products    — danh sách sản phẩm (kèm filter/page)
        ├─▶ Skeleton loading ──▶ render danh sách
        ├─▶ Xoá category  — DELETE /api/v1/categories/:id
        └─▶ Xoá sản phẩm  — DELETE /api/v1/products/:id
```

### 4. Chi tiết sản phẩm (Detail)

```
Home ──[tap sản phẩm]──▶ /detail (truyền ProductEntity)
  └─▶ DetailProductPage
        └─▶ DetailProductBloc
              ├─▶ Hiển thị thông tin sản phẩm
              ├─▶ Chỉnh sửa category — PUT /api/v1/categories/:id
              └─▶ Upload ảnh
                    └─▶ image_picker ──▶ Cloudinary (multipart POST)
                          └─▶ Cập nhật URL ảnh vào sản phẩm
```

### 5. Sơ đồ tổng quát

```
Splash ──▶ Login ──▶ Home ──▶ Detail
                      │
                      └──▶ Image Picker (upload ảnh)
```

---

## 📁 Cấu trúc DI (Dependency Injection)

Các dependency được đăng ký tập trung qua `GetIt` trong `lib/feature/app/di.dart` và các `DIModule` tương ứng của từng feature. Thứ tự khởi tạo:

```
main() ──▶ moduleDIApp()
              ├─▶ AppDI.register()      — AppBloc
              ├─▶ LoginDI.register()    — LoginBloc, LoginUseCase, LoginRepository, LoginDataSource
              ├─▶ HomeDI.register()     — HomeBloc, HomeUseCase, HomeRepository, HomeDataSource
              └─▶ DetailDI.register()   — DetailProductBloc, ...
```

---

## 📝 Ghi chú

- Dự án **không có file `.env`** — URL API được cấu hình trực tiếp trong `ApiUrl`.  
- Hive được khởi tạo trước khi `runApp()` để đảm bảo local storage sẵn sàng.  
- BLoC được inject qua `BlocProvider` tại Router, không dùng `MultiBlocProvider` global.
