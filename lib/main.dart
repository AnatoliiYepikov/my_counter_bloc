import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(children: [
        IconButton(
          onPressed: (() {}),
          icon: const Icon(Icons.exposure_minus_1),
        ),
        IconButton(
          onPressed: (() {}),
          icon: const Icon(Icons.plus_one),
        ),
      ]),
      body: Center(
        child: Text(
          '0',
          style: TextStyle(fontSize: 33),
        ),
      ),
    );
  }
}
