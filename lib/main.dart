import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.plus_one)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.exposure_minus_1)),
        ],
      ),
      body: Center(
        child: Text(
          '0',
          style: TextStyle(fontSize: 33),
        ),
      ),
    );
  }
}
