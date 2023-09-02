void main() {
  List<List<dynamic>> dataList = [
    ['Hewan1', 'Kucing'],
    ['Hewan2', 'Kelinci'],
    ['Hewan3', 'Kuda'],
  ];

  Map<String, String> resultMap = Map.fromIterable(dataList,
      key: (item) => item[0], value: (item) => item[1]);

  print(resultMap);
}
