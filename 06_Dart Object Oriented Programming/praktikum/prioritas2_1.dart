class Kalkulator {
  
  int tambah(int bilangan1, int bilangan2) {
    return bilangan1 + bilangan2;
  }

  
  int kurang(int bilangan1, int bilangan2) {
    return bilangan1 - bilangan2;
  }

  int kali(int bilangan1, int bilangan2) {
    return bilangan1 * bilangan2;
  }

  double bagi(double bilangan1, double bilangan2) {
    return bilangan1 / bilangan2;
  }

}

void main() {
  var one = Kalkulator();

  print(one.tambah(1, 2));
  print(one.kurang(2, 2));
  print(one.kali(3, 2));
  print(one.bagi(4, 2));
}












