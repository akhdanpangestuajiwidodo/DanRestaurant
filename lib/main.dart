import 'package:flutter/material.dart';
import 'package:dan_resto/screens/home_screen.dart';
import 'package:dan_resto/components/carousel/carouselcard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dan Resto",
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff272B40),
      ),
      home: HomeScreen(),
    );
  }
}