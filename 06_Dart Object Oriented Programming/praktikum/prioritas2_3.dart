class Kursus {
  String judul;
  String deskripsi;

  Kursus(this.judul, this.deskripsi);
}

class Siswa {
  String nama;
  String kelas;
  List<Kursus> daftarKursus = [];

  Siswa(this.nama, this.kelas);

  // Menambahkan kursus ke daftar kursus
  void tambahKursus(String judul, String deskripsi) {
    Kursus kursus = Kursus(judul, deskripsi);
    daftarKursus.add(kursus);
  }

  // Menghapus kursus dari daftar kursus
  void hapusKursus(String judul) {
    daftarKursus.removeWhere((kursus) => kursus.judul == judul);
  }

  // Melihat semua kursus yang dimiliki
  void lihatDaftarKursus() {
    print('Daftar kursus untuk $nama (Kelas: $kelas):');
    if (daftarKursus.isEmpty) {
      print('Belum ada kursus yang ditambahkan.');
    } else {
      for (var kursus in daftarKursus) {
        print('${kursus.judul}: ${kursus.deskripsi}');
      }
    }
  }
}

void main() {
  Siswa siswa1 = Siswa('Delia Sepiana', '12 MI');
  siswa1.tambahKursus('Pemrograman Web', 'Pemrograman Mobile.');
  siswa1.tambahKursus('Struktur Data', 'Jaringan Komputer');

  Siswa siswa2 = Siswa('M. Diki Iswari', '12 RPL');
  siswa2.tambahKursus('Manajemen Basis Data', 'Pengujian Perangkat Lunak');
  siswa2.tambahKursus('Pemrograman Web', 'Praktikum SBD');

  siswa1.lihatDaftarKursus();
  siswa2.lihatDaftarKursus();

  siswa1.hapusKursus('Jaringan Komputer');
  siswa2.hapusKursus('Pemrograman Web');

  siswa1.lihatDaftarKursus();
  siswa2.lihatDaftarKursus();
}