import 'package:dan_resto/data/db/databasehelper.dart';
import 'package:dan_resto/provider/databaseprovider.dart';
import 'package:dan_resto/screens/favorite_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Widget createFavoriteScreen() => ChangeNotifierProvider<DatabaseProvider>(
  create: (context) => DatabaseProvider(databaseHelper: DatabaseHelper()),
  child: MaterialApp(
    home: FavoriteScreen(),
  ),
);

void main() {
  group('Favorite Screen Widget Tests', () {
    testWidgets('Testing SingleChildScrollView Widget is Available', (tester) async {
      await tester.pumpWidget(createFavoriteScreen());
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });
    testWidgets('Testing Scroll of SingleChildScrollView Widget', (tester) async {
      await tester.pumpWidget(createFavoriteScreen());
      await tester.fling(find.byType(SingleChildScrollView), Offset(0, -200), 2000);
      await tester.pump();
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });
  });
}