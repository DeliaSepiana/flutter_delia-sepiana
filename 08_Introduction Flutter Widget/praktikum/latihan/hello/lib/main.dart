
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Delia App'),
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
              //Membuat Drawer Header

              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                child: Text('drawerheader'),
              ),
              ListTile(
                title: const Text('judul'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('deskripsi'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: const Center(
          child: Text('Material'),
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc),
          label: 'abc'),
          BottomNavigationBarItem(icon: Icon(Icons.abc),
          label: 'abc')
        ], ),
      ),
      
    );
  }
}