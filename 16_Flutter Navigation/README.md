<h1>Resume”Flutter Navigation”</h1>

Navigation yaitu berpindah dari halaman satu ke halaman lain. Navigation dasar yaitu perpindahan halaman menggunakan Navigator.push(), sedangkan untuk kembali ke halaman sebelumnya menggunakan Navigator.pop().
Untuk mengirim Data ke halaman baru menggunakan parameter pada constructor halaman.
Navigation dengan Named Routes dimana tiap halaman memiliki alamat yang disebut route, yang dimana perpindahan halaman menggunakan Navigator.pushNamed(). Untuk kembali ke halaman sebelumnya menggunakan Navigator.pop().
Untuk mendaftarkan route dengan cara: Tambahkan initialRoute dan routes pada MaterialApp, untuk setiap route adalah sebagai fungsi yang membentuk halaman .
Untuk mengirim data ke halaman baru menggunakan arguments saat melakukan pushNamed.
