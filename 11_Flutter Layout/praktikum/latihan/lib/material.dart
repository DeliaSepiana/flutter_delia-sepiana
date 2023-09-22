import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;

  Contact(this.name, this.phone);
}

final List<Contact> contacts = [
  Contact('Putri Diana Hafsyawati', '085790674287'),
  Contact('Nurmala Sari', '081250559303'),
  Contact('Anisa Yuniarti', '088034987474'),
  Contact('Mustika Hairani', '083476590299'),
  Contact('Diah Putri Lestari', '0872093876589'),
  Contact('Nia Lestari', '085098234675'),
  Contact('Baiq Feni', '081567889030')
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0; // Indeks terkini untuk BottomNavigationBar

  // Daftar halaman yang akan ditampilkan sesuai dengan indeks BottomNavigationBar
  final List<Widget> _pages = [
    const Center(
      child: Text('This is Home'),
    ),
    const Center(
      child: Text('This is List'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MaterialApps'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Home'),
              ),
              ListTile(
                title: const Text('List'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('judul 2'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
            final contact = contacts[index];
            final avatarText = contact.name[0];
            return ListTile(
              leading: CircleAvatar(
                child: Text(avatarText),
                backgroundColor: Color.fromARGB(255, 0, 114, 63),
              ), // Ganti dengan ikon yang sesuai
              title: Text(contacts[index].name),
              subtitle: Text(contacts[index].phone),
              onTap: () {
                // Tambahkan aksi ketika item kontak diklik di sini
              },
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
            ),
          ],
        ),
      ),
    );
  }
}
