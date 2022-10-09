import 'package:flutter/material.dart';
import 'package:webapp1/page1.dart';
import 'package:webapp1/page2.dart';
import 'package:webapp1/page3.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget _Page = Page1();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tittel'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Meny'),
            ),
            ListTile(
              title: const Text('MenyItem1'),
              onTap: () {
                setState(() {
                  _Page = const Page1();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('MenyItem2'),
              onTap: () {
                setState(() {
                  _Page = const Page2();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('MenyItem3'),
              onTap: () {
                setState(() {
                  _Page = const Page3();
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _Page,
    );
  }
}
