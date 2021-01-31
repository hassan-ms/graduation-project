import 'package:GradProject/providers/CovidTest.dart';
import 'package:GradProject/providers/hospitals.dart';
import 'package:GradProject/screens/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/HomeScreen2.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import './constants.dart';
import './screens/CovidTestScreen.dart';
import './screens/GetHospitalScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(primaryColor);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CovidTest(),
        ),
        ChangeNotifierProvider.value(
          value: Hospitals(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Health Care',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen2(),
        routes: {
          'covid-test-screen': (ctx) => CovidTestScreen(),
          'get-hospital-screen': (ctx) => GetHospitalScreen(),
        },
      ),
    );
  }
}
