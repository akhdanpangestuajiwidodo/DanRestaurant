import 'dart:io';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:dan_resto/screens/splashscreen.dart';
import 'package:dan_resto/utils/notificationhelper.dart';
import 'package:flutter/material.dart';
import 'package:dan_resto/screens/home_screen.dart';
import 'package:dan_resto/screens/detail_screen.dart';
import 'package:dan_resto/screens/favorite_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'common/navigation.dart';
import 'data/api/backgroundservice.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }

  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

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
      navigatorKey: navigatorKey,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        DetailScreen.routeName: (context) => DetailScreen(
          id: ModalRoute.of(context)?.settings.arguments as String,
        ),
        FavoriteScreen.routeName: (context) => FavoriteScreen(),
      },
    );
  }
}