// Menerima 2 parameter, yaitu listData dan pengali
Future<List<int>> multiplyList(List<int> listData, int pengali) async {
  List<int> result = [];

  for (int data in listData) {
    int multipliedValue = await multiplyAsync(data, pengali);
    result.add(multipliedValue);
  }

  return result;
}
 // Lakukan perulangan pada list data secara asynchronous
Future<int> multiplyAsync(int value, int pengali) async {
  await Future.delayed(Duration(milliseconds: 50));
  return value * pengali;
}

void main() async {
  List<int> listData = [1, 2, 3, 4, 5];
  int pengali = 2;

  List<int> result = await multiplyList(listData, pengali);
  print(result); 
}

