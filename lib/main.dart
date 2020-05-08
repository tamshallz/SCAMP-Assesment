import 'package:covid_19_dashboard/Screens/Dashboard.dart';
import 'package:flutter/material.dart';

// IN-APP import
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
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 30,
          ),
          color: Colors.white,
          actionsIconTheme: IconThemeData(
            color: AppTheme.defaultBlack,
            size: 30,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/first': (context) => Dashboard(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
