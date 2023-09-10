class BangunRuang {
  double panjang;
  double lebar;
  double tinggi;

  BangunRuang(this.panjang, this.lebar, this.tinggi);

  double volume() {
    return panjang * lebar * tinggi;
  }
}

class Kubus extends BangunRuang {
  double sisi;

  Kubus(this.sisi) : super(sisi, sisi, sisi);

  @override
  double volume() {
    return sisi * sisi * sisi; 
  }
}

class Balok extends BangunRuang {
  Balok(double panjang, double lebar, double tinggi) : super(panjang, lebar, tinggi);

  @override
  double volume() {
    return panjang * lebar * tinggi; 
  }
}

void main() {
  BangunRuang bangun = BangunRuang(4.0, 3.0, 2.0); 
  print('Volume Bangun Ruang: ${bangun.volume()}');

  Kubus kubus = Kubus(5.0);
  print('Volume Kubus: ${kubus.volume()}');

  Balok balok = Balok(4.0, 3.0, 2.0);
  print('Volume Balok: ${balok.volume()}');
}
