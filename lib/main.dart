import 'package:covid_19_dashboard/Screens/Dashboard.dart';
import 'package:flutter/material.dart';

// IN-APP import
import 'Screens/Tabs/Cases.dart';
import 'Style/Theme.dart';
import 'screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          body2: TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          // elevation: 0,
          color: Colors.white,
          actionsIconTheme: IconThemeData(
            color: AppTheme.defaultBlack,
            size: 25,
          ),
        ),
      ),
      routes: {
        '/first': (context) => Dashboard(),
        '/second': (context) => Cases(),
      },
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
