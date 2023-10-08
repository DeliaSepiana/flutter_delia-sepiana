import 'package:dio/dio.dart';
import 'contact.dart';

void main() {
  postData();
  deserialisasi();
  putData();
}

//Post
Future<void> postData() async {
  final dio = Dio();

  try {
    final response = await dio.post(
      'http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
      data: {
        "name": "Delia Sepiana",
        "phone": "09876543214",
      },
    );

    if (response.statusCode == 201) {
      print('Berhasil melakukan permintaan POST');
      print('Data respons: ${response.data}');
    } else {
      print('Gagal melakukan POST');
      print('Kode status: ${response.statusCode}');
    }
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}

//Deseralisasi

Future<void> deserialisasi() async {
  final dio = Dio();

  try {
    final response = await dio.get(
        'http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');

    if (response.statusCode == 200) {
      List<dynamic> jsonContacts = response.data;

      List<Contact> contacts = jsonContacts.map((jsonContact) {
        return Contact.fromJson(jsonContact);
      }).toList();

      for (var contact in contacts) {
        print('ID: ${contact.id}');
        print('Nama: ${contact.name}');
        print('Nomor: ${contact.phone}');
      }
    } else {
      print('Gagal melakukan permintaan GET');
      print('Kode status: ${response.statusCode}');
    }
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}

//Put

Future<void> putData() async {
  final dio = Dio();
  try {
    final response = await dio.put(
      'https://jsonplaceholder.typicode.com/posts/1',
      data: {
        "title": "foo",
        "body": "bar",
        "userId": 1,
      },
    );

    if (response.statusCode == 200) {
      print('Berhasil melakukan permintaan PUT');
      print('Data respons: ${response.data}');
    } else {
      print('Gagal melakukan permintaan PUT');
      print('Kode status: ${response.statusCode}');
    }
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}
