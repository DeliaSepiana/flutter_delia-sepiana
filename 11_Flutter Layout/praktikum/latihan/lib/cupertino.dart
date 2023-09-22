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
          middle: Text('CupertinoApp'),
        ),
        child: Center(
          child: Text('This is CupertinoApp'),
        ),
      ),
    );
  }
}
