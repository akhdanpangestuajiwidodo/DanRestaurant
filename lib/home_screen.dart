import 'package:flutter/material.dart';
import 'package:dan_resto/main_screen.dart';
import 'package:dan_resto/chart_screen.dart';

class HomeScreen extends StatefulWidget{
  HomeScreen();

  @override
  _HomeScreen createState() =>_HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int selectedIndex = 0;
  final widgetOptions = [
    MainScreen(),
    ChartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text("Bookmark"),
          ),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}