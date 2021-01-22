import 'package:flutter/material.dart';
import './screens/HomeScreen2.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import './constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(primaryColor);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Care',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen2(),
    );
  }
}
