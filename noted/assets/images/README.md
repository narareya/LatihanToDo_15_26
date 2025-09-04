# 🖼️ Image Assets

Folder ini untuk menyimpan gambar yang akan digunakan di aplikasi.

## 📁 Struktur Folder:
```
assets/
├── images/          # Gambar utama (foto, ilustrasi, dll)
├── icons/           # Icon kustom
└── fonts/           # Font kustom
```

## 📝 Cara Menggunakan Images:

### 1. **Simpan gambar** di folder yang sesuai:
- `assets/images/` - untuk foto, ilustrasi, background
- `assets/icons/` - untuk icon kustom

### 2. **Format yang didukung:**
- PNG (.png) - terbaik untuk icon dan gambar dengan transparansi
- JPG/JPEG (.jpg/.jpeg) - terbaik untuk foto
- SVG (.svg) - untuk icon vektor (perlu package tambahan)
- GIF (.gif) - untuk animasi sederhana

### 3. **Cara menggunakan di kode:**

```dart
// Menggunakan Image.asset()
Image.asset(
  'assets/images/logo.png',
  width: 100,
  height: 100,
)

// Menggunakan AssetImage di dalam decoration
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/background.jpg'),
      fit: BoxFit.cover,
    ),
  ),
)

// Menggunakan untuk icon
ImageIcon(
  AssetImage('assets/icons/custom_icon.png'),
  size: 24,
  color: Colors.blue,
)
```

## ✨ Tips:
1. **Gunakan nama file yang deskriptif:** `logo.png`, `background.jpg`
2. **Optimasi ukuran gambar** sebelum digunakan
3. **Gunakan PNG untuk transparency**
4. **Gunakan JPG untuk foto** (ukuran file lebih kecil)

Setelah menambah gambar, jangan lupa jalankan:
```bash
flutter pub get
```
