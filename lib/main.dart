import 'package:flutter/material.dart';
import 'package:webapp1/mainpage.dart';
import 'package:webapp1/page1.dart';
import 'package:webapp1/page2.dart';
import 'package:webapp1/page3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'My WebApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/page1': (context) => Page1(),
        '/page2': (context) => const Page2(),
        '/page3': (context) => const Page3(),
      },
      title: _title,
    );
  }
}
