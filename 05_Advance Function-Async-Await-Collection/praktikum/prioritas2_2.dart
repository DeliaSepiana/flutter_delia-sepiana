void main() {
  List<int> nilai = [7, 5, 3, 5, 2, 1];

  int total = 0;
  for (int nilaiSaatIni in nilai) {
    total += nilaiSaatIni;
  }

  double rataRata = total / nilai.length;

  int rataRataBulat = rataRata.ceil();

  print("Rata-rata: $rataRataBulat");
}
