import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:dan_resto/screens/main_screen.dart';
import 'package:dan_resto/screens/favorite_screen.dart';

class HomeScreen extends StatefulWidget{

  static const routeName = '/home_screen';
  HomeScreen();

  @override
  _HomeScreen createState() =>_HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  int _selectedIndex = 0;

  final widgetOptions = [
    MainScreen(),
    FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Badge(
              badgeContent: Text(
                '${listRestaurants.length}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: Icon(
                Icons.star,
              ),
            ),
            label: "Favorite",
          ),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}