import 'package:covid_tracker/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeData.light().textTheme.apply(
              fontFamily: 'Spartan',
            ),
        primaryTextTheme: ThemeData.light().textTheme.apply(
              fontFamily: 'Spartan',
            ),
        accentTextTheme: ThemeData.light().textTheme.apply(
              fontFamily: 'Spartan',
            ),
      ),
      home: LoadingScreen(),
    );
  }
}
