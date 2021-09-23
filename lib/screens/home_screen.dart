import 'package:badges/badges.dart';
import 'package:dan_resto/screens/detail_screen.dart';
import 'package:dan_resto/screens/settings_page.dart';
import 'package:dan_resto/utils/notificationhelper.dart';
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
  final NotificationHelper _notificationHelper = NotificationHelper();

  void initState() {
    super.initState();
    _notificationHelper.configureSelectedNotificationSubject(DetailScreen.routeName, context);
  }

  int _selectedIndex = 0;

  final widgetOptions = [
    MainScreen(),
    FavoriteScreen(),
    SettingsPage()
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
                '0',
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
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
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

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }
}