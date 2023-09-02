void main() {
  int nilaiInput = 5; 

  computeFactorial(nilaiInput).then((result) {
    print("Faktorial dari $nilaiInput adalah $result");
  });
}

Future<int> computeFactorial(int nilaiInput) async {
  if (nilaiInput < 0) {
    throw Exception("Nilai dari nilaiInput tidak boleh negatif.");
  }

  if (nilaiInput == 0) {
    return 1;
  }

  int result = 1;
  for (int i = 1; i <= nilaiInput; i++) {
    result *= i;
  }

  return result;
}
