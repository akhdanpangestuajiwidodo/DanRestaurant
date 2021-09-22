import 'dart:io';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:dan_resto/data/api/api_service.dart';
import 'package:dan_resto/data/db/databasehelper.dart';
import 'package:dan_resto/provider/databaseprovider.dart';
import 'package:dan_resto/provider/restaurantprovider.dart';
import 'package:dan_resto/provider/reviewprovider.dart';
import 'package:dan_resto/provider/schedulingprovider.dart';
import 'package:dan_resto/screens/splashscreen.dart';
import 'package:dan_resto/utils/notificationhelper.dart';
import 'package:flutter/material.dart';
import 'package:dan_resto/screens/home_screen.dart';
import 'package:dan_resto/screens/detail_screen.dart';
import 'package:dan_resto/screens/favorite_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (_) => RestaurantProvider(apiServices: ApiServices()),
      ),
      ChangeNotifierProvider(
        create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
      ),
      ChangeNotifierProvider(
          create: (_) => SchedulingProvider(),
      ),
      ChangeNotifierProvider<ReviewProvider>(
        create: (_) => ReviewProvider(
          apiService: ApiServices(),
        ),
      ),
    ],
      child: MaterialApp(
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
      ),

    );

  }
}