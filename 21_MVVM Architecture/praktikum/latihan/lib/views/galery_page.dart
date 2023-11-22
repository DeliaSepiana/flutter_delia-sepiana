import 'package:flutter/material.dart';
import 'bottomsheet_page.dart';

class GaleryPage extends StatefulWidget {
  const GaleryPage({super.key});

  @override
  State<GaleryPage> createState() => _GaleryPageState();
}

class _GaleryPageState extends State<GaleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galery Delia'),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/Aot1.jpg', width: 200, height: 200),
                        const Text('Gambar 1'),
                        const Text('Apakah ingin melihat lebih detail'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return const BottomPage();
                                      },
                                    ),
                                  );
                                },
                                child: const Text('Yes')),
                            const SizedBox(
                              width: 70,
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: const Text('No'))
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Image.asset('assets/Aot1.jpg'),
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/Aot1.jpg', width: 200, height: 200),
                        const Text('Gambar 2'),
                        const Text('Apakah ingin melihat lebih detail'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return const BottomPage();
                                      },
                                    ),
                                  );
                                },
                                child: const Text('Yes')),
                            const SizedBox(
                              width: 70,
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: const Text('No'))
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Image.asset('assets/Aot2.jpg'),
            ),
          )
        ],
      ),
    );
  }
}
