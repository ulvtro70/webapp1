import 'package:flutter/material.dart';
import 'package:webapp1/mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'My WebApp';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MainPage(),
    );
  }
}
