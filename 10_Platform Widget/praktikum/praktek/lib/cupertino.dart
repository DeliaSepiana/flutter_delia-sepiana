// ignore: unused_import
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const HelloWorld());
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('cupertino'),
        ),
        child: Center(child: Text('cupertino'),),
      ),
    );
  }
}