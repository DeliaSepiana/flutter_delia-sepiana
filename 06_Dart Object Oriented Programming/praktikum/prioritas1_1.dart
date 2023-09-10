class Hewan {
  double berat;

  Hewan(this.berat);
}

class Mobil {
  int kapasitas;
  List<Hewan> muatan = [];

  Mobil(this.kapasitas);

  void tambahMuatan(Hewan hewan) {
    if (muatan.length < kapasitas) {
      muatan.add(hewan);
      print('Hewan dengan berat ${hewan.berat} kg ditambahkan ke dalam muatan.');
    } else {
      print('Kapasitas muatan penuh, tidak dapat menambahkan hewan lagi.');
    }
  }

  double totalBeratMuatan() {
    double totalBerat = 0.0;
    for (var hewan in muatan) {
      totalBerat += hewan.berat;
    }
    return totalBerat;
  }
}

void main() {
  Mobil mobil = Mobil(3);  // Membuat mobil dengan kapasitas maksimum 3

  Hewan angsa = Hewan(5.0);
  Hewan bebek = Hewan(4.0);
  Hewan burungPuyuh = Hewan(4.0);
  Hewan burungHantu = Hewan(6.0);

  mobil.tambahMuatan(angsa);
  mobil.tambahMuatan(bebek);
  mobil.tambahMuatan(burungPuyuh);
  mobil.tambahMuatan(burungHantu);  // Kapasitas muatan sudah penuh

  print('Total berat muatan yang diangkut oleh mobil: ${mobil.totalBeratMuatan()} kg');
}