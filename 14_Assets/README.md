<h1>Resume"Assets"</h1>

Assets, File yang di bundled dan di deployed bersamaan dengan aplikasi. Ada beberapa tipe Assets yaitu :

- Static Data (JSON files)
- Icons
- Images
- Font file (ttf)
  untuk Menentukan Assets, yaitu:
- Menggunakan pubspec.yaml
- Pubspec.yaml terletak pada root project untuk mengidentifikasi assets yang dibutuhkan aplikasi
- Gunakan karakter "/" untuk memasukkan semua assets dibawah satu directory name

IMAGES, Membuat tampilan lebih menarik, Mendukung format JPEG, WebP, GIF, Animaed Web/GIF, PNG, BMP dan WBMP dan Menampilkan gambar dari project asset dan internet

Loading Images

- menggunakan widget Image
- Membutuhkan property image dengan class AssetImage()
- Menambahkan image ke folder assets (lebih CPU friendly & cepat)
- Menggunakan method Image.asset, mendapatkan image yang sudah ditambahkan dalam project
- Menggunakan method Image.network, mendapatkan data image melalui internet dengan menggunakan string URLnya
  FONT, Penentuan oleh UI Designer, Keunikan pada apk dan Penerapan font menggunakan custom font atau dari package
