import 'package:GradProject/constants.dart';
import 'package:GradProject/widgets/MyAppBar.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';
import '../providers/CovidTest.dart';
import '../constants.dart';

class TestResultScreen extends StatefulWidget {
  @override
  _TestResultScreenState createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
  static var chartDisplay;
  var percent;
  String infectionDegree = "no infection";
  bool needHospital = false;
  bool contactDoctor = false;
  bool _isLoading = false;

  void setInfectionDegree(per) {
    if (per < 50) {
      infectionDegree = 'Mild Infecion';
    } else if (per >= 50 && per < 60) {
      infectionDegree = 'Moderate Infection';
      contactDoctor = true;
    } else {
      infectionDegree = 'severe Infection';
      needHospital = true;
    }
    // else {
    //   infectionDegree = 'Critical Infection';
    // }
  }

  @override
  void initState() {
    Firebase.initializeApp();
    Future.delayed(Duration.zero, () {
      final res = Provider.of<CovidTest>(context, listen: false).testResult;
      final restOfRes = 100 - res;
      setState(() {
        percent = res;
        setInfectionDegree(res);
      });
      var data = [
        addcharts('5', res, charts.Color(r: 228, g: 18, b: 29)),
        addcharts('0', restOfRes, charts.Color(r: 255, g: 255, b: 255, a: 0))
      ];

      var series = [
        charts.Series(
            domainFn: (addcharts add, _) => add.label,
            measureFn: (addcharts add, _) => add.value,
            data: data,
            id: 'ss',
            colorFn: (addcharts add, _) => add.cl)
      ];
      chartDisplay = charts.PieChart(series,
          animationDuration: Duration(milliseconds: 1000),
          defaultRenderer: new charts.ArcRendererConfig(
              arcWidth: 30,
              startAngle: 4 / 5 * 22 / 7,
              arcLength: 7 / 5 * 22 / 7));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            MyAppBar(),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Result',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 400,
              width: 400,
              child: chartDisplay,
            ),
            Container(
              child: Text(
                '$percent%',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              infectionDegree,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                contactDoctor
                    ? 'you need to communicate with doctor'
                    : (needHospital ? 'You need to move to hospital' : ""),
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(228, 18, 29, 1)),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            _isLoading
                ? CircularProgressIndicator()
                : Container(
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.bottomRight,
                    child: needHospital
                        ? RaisedButton(
                            onPressed: () async {
                              try {} catch (e) {}
                            },
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFF0D47A1),
                                    Color(0xFF1976D2),
                                    Color(0xFF42A5F5),
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              //margin: EdgeInsets.only(right: 10),
                              child: const Text('Get Hospital',
                                  style: TextStyle(fontSize: 20)),
                            ),
                          )

                        // Container(
                        //     margin: EdgeInsets.only(right: 10),
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10),
                        //         border: Border.all()),
                        //     child: FlatButton(
                        //       child: Text('Get Hospital',
                        //           style: TextStyle(
                        //               fontSize: 18,
                        //               fontWeight: FontWeight.bold,
                        //               color: primaryColor)),
                        //       onPressed: () {},
                        //     ),
                        //   )
                        : contactDoctor
                            ? RaisedButton(
                                onPressed: () async {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        'error! check network and try again'),
                                  );
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  try {
                                    await Provider.of<CovidTest>(context,
                                            listen: false)
                                        .addToWaiting();
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    Navigator.of(context)
                                        .pushNamed('contact-doctor-screen');
                                  } catch (e) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  }
                                },
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Color(0xFF0D47A1),
                                        Color(0xFF1976D2),
                                        Color(0xFF42A5F5),
                                      ],
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  //margin: EdgeInsets.only(right: 10),
                                  child: const Text('contact doctor',
                                      style: TextStyle(fontSize: 20)),
                                ),
                              )
                            : (needHospital
                                ? RaisedButton(
                                    textColor: Colors.white,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: <Color>[
                                            Color(0xFF0D47A1),
                                            Color(0xFF1976D2),
                                            Color(0xFF42A5F5),
                                          ],
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(10.0),
                                      //margin: EdgeInsets.only(right: 10),
                                      child: const Text('Get Hospital',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                    onPressed: () => Navigator.of(context)
                                        .pushNamed('get-hospital-screen'))
                                : Container()))
          ],
        ),
      ),
    );
  }
}

class addcharts {
  final String label;
  final int value;
  // final Color color;
  final charts.Color cl;
  addcharts(this.label, this.value, this.cl);
}
