import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
                Navigator.popAndPushNamed(context, '/page1');
              },
            ),
            ListTile(
              title: const Text('MenyItem2'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/page2');
              },
            ),
            ListTile(
              title: const Text('MenyItem3'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/page3');
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Hovedside'),
      ),
    );
  }
}
