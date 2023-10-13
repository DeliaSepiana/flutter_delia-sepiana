import 'package:competence/model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> contactData = [];
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bumi'),
        backgroundColor: Color.fromARGB(255, 32, 72, 33),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Delia Sepiana"),
              accountEmail: Text("deliasepiana2002@gmail.com"),
              currentAccountPicture: Image.network(
                'https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/female_woman_avatar_portrait_1-512.png', // Ganti dengan path gambar profil yang sesuai
                width:
                    100, // Sesuaikan dengan lebar gambar profil yang diinginkan
                height:
                    100, // Sesuaikan dengan tinggi gambar profil yang diinginkan
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 72, 33),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact Us'),
              onTap: () {
                // Tambahkan aksi ketika "Contact Us" dipilih
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {
                // Tambahkan aksi ketika "About Us" dipilih
              },
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                // Tambahkan aksi ketika "Login" dipilih
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Image.asset(
                    'assets/Univers.jpg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Welcome to The Univers",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 254, 254),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'First Name',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextField(
                        controller: _firstNameController,
                        decoration: const InputDecoration(),
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last Name',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextField(
                        controller: _lastNameController,
                        decoration: const InputDecoration(),
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(),
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Message',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(),
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  ElevatedButton(
                    onPressed: () {
                      String firstName = _firstNameController.text;
                      String lastName = _lastNameController.text;
                      String email = _emailController.text;
                      String message = _messageController.text;

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Form Data'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Name: $firstName'),
                                Text('Name: $lastName'),
                                Text('Email: $email'),
                                Text('Message: $message'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Column(
              children: <Widget>[
                Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  height: 300.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildAboutUsCard(
                        'Bumi itu Bulat',
                        'Bukti ilmiah yang sangat kuat menunjukkan bahwa Bumi memiliki bentuk bulat seperti sebuah bola. Metode Ilmiah: Orang-orang yang setuju bahwa Bumi itu bulat mungkin mengapresiasi pentingnya metode ilmiah, yang melibatkan pengamatan, pengujian, dan validasi teori dengan bukti empiris. Pandangan bulat Bumi telah terbukti berulang kali melalui metode ini.',
                      ),
                      _buildAboutUsCard(
                        'Bumi itu Datar',
                        'Teori konspirasi: Beberapa orang cenderung mempercayai teori konspirasi dan melihat pandangan Bumi datar sebagai rahasia yang disembunyikan oleh pemerintah atau kelompok tertentu. Mereka sering disebut sebagai "flatearthers" (orang yang percaya Bumi datar) dan memiliki pandangan yang berbeda.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutUsCard(String title, String subtitle) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(right: 16.0),
      child: Container(
        width: 200.0,
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
