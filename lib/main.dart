import 'package:dan_resto/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:dan_resto/model/restaurant.dart';
import 'package:dan_resto/screens/home_screen.dart';
import 'package:dan_resto/screens/detail_screen.dart';
import 'package:dan_resto/screens/favorite_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dan Resto",
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff6B45BC),
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        DetailScreen.routeName: (context) => DetailScreen(
          restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant,
        ),
        FavoriteScreen.routeName: (context) => FavoriteScreen(),
      },
    );
  }
}