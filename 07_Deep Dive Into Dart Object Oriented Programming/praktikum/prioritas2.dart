class Matematika {
  double hasil() {
    return 0.0; // Metode dasar yang akan diimplementasikan ulang
  }
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x;
  int y;

  KelipatanPersekutuanTerkecil(this.x, this.y);

  @override
  double hasil() {
    int a = x;
    int b = y;
    while (b != 0) {
      final t = b;
      b = a % b;
      a = t;
    }
    return (x * y) / a.toDouble();
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int x;
  int y;

  FaktorPersekutuanTerbesar(this.x, this.y);

  @override
  double hasil() {
    int a = x;
    int b = y;
    while (b != 0) {
      final t = b;
      b = a % b;
      a = t;
    }
    return a.toDouble();
  }
}

void main() {
  Matematika operation = KelipatanPersekutuanTerkecil(8, 18);
  print('Kelipatan Persekutuan Terkecil: ${operation.hasil()}');

  operation = FaktorPersekutuanTerbesar(20, 40);
  print('Faktor Persekutuan Terbesar: ${operation.hasil()}');
}
