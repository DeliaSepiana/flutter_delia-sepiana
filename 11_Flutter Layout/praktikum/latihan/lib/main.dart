import 'package:flutter/material.dart';

class Study {
  final String name;

  Study(this.name);
}

final List<Study> Studys = [
  Study('Learn Flutter'),
  Study('Learn RaectJS'),
  Study('Learn VueJS'),
  Study('Learn Tailwind CSS'),
  Study('Learn UI/UX'),
  Study('Learn Figma'),
  Study('Laern Digital Marketing'),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// Indeks terkini untuk BottomNavigationBar

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('My Flutter App')),
          backgroundColor: const Color(0xFF6200EE),
          iconTheme: const IconThemeData(color: Colors.grey),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: ListView.builder(
            itemCount: Studys.length,
            itemBuilder: (BuildContext context, int index) {
              final Study = Studys[index];
              return ListTile(
                title: Text(Studys[index].name),
                onTap: () {},
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            backgroundColor: const Color(0xFF03DAC5)),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF6200EE),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Information',
            ),
          ],
        ),
      ),
    );
  }
}
