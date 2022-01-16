import 'package:flutter/material.dart';
import 'package:app_frontend/src/constants/main_navigation.dart'
    as main_navigation;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedPage = 0;

  void setPage(int index) {
    setState(() => _selectedPage = index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          child: BottomNavigationBar(
            elevation: 0,
            // TODO: Extract nav widget.
            selectedItemColor: const Color(0xFFFFC34E),
            unselectedItemColor: const Color(0xFFADADAD),
            iconSize: 30,
            items: main_navigation.pages
                .map((page) => BottomNavigationBarItem(
                    icon: page['icon'], label: page['label']))
                .toList(),
            currentIndex: _selectedPage,
            onTap: setPage,
          ),
        ),
        body: main_navigation.pages[_selectedPage]['widget'],
      ),
    );
  }
}
