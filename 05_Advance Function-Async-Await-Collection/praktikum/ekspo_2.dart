void main() {
  List<String> input = ['js', 'js', 'js', 'golang', 'python', 'js', 'js', 'golang', 'rust'];

  Map<String, dynamic> frekuensi = countFrequency(input);

  frekuensi.forEach((key, value) {
    print('$key: $value');
  });
}

Map<String, dynamic> countFrequency(List<String> input) {
  Map<String, dynamic> frekuensi = {};

  for (String item in input) {
    if (frekuensi.containsKey(item)) {
      frekuensi[item]++;
    } else {
      frekuensi[item] = 1;
    }
  }

  return frekuensi;
}