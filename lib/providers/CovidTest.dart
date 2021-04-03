import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Covid {
  final gender;
  final age;
  final bodypain;

  final fever;
  final diffbreathing;
  final dryCough;
  final contact_infected;
  final runny_nose;
  final nasal_congestion;

  Covid({
    @required this.dryCough,
    @required this.fever,
    @required this.age,
    @required this.bodypain,
    @required this.gender,
    @required this.diffbreathing,
    @required this.contact_infected,
    @required this.nasal_congestion,
    @required this.runny_nose,
  });
}

class CovidTest with ChangeNotifier {
  int testResult = 0;
  Covid covid;
  Future<dynamic> check(Covid covid) async {
    this.covid = covid;
    try {
      final res = await http.post('http://10.0.2.2:5000/covid',
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            'fever': covid.fever,
            'age': covid.age,
            'bodypain': covid.bodypain,
            'cough': covid.dryCough,
            'diffbreathing': covid.diffbreathing - 1,
            'Gender': covid.gender,
            'contect': covid.contact_infected - 1,
            'Runnynose': covid.runny_nose,
            'NasalCongestion': covid.nasal_congestion,
          }));
      testResult = json.decode(res.body).round();
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  Future<dynamic> addToWaiting() async {
    try {
      await FirebaseFirestore.instance
          .collection('patients_waiting_test')
          .doc('ssa124')
          .set({
        'fever': covid.fever,
        'age': covid.age,
        'bodypain': covid.bodypain,
        'cough': covid.dryCough,
        'diffbreathing': covid.diffbreathing - 1,
        'Gender': covid.gender,
        'contect': covid.contact_infected - 1,
        'Runnynose': covid.runny_nose,
        'NasalCongestion': covid.nasal_congestion,
        'result': testResult
      });

      // await FirebaseFirestore.instance
      //     .collection('patients_waiting_test')
      //     .doc('ssa124')
      //     .set({
      //   'fever': 50,
      //   'age': 80,
      //   'bodypain': 1,
      //   'cough': 1,
      //   'diffbreathing': 0,
      //   'Gender': 1,
      //   'contect': 0,
      //   'Runnynose': 1,
      //   'NasalCongestion': 1,
      //   'result': 1,
      // });
    } catch (e) {
      throw e;
    }
  }
}
