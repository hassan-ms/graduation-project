import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CovidTest with ChangeNotifier {
  int testResult = 50;
  Future<dynamic> check({fever, age, bodypain, cough, diffbreathing}) async {
    final res = await http.post('http://10.0.2.2:5000/covid',
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'fever': 80,
          'age': 12,
          'bodypain': 1,
          'cough': 1,
          'diffbreathing': 1
        }));
    testResult = json.decode(res.body).round();
    notifyListeners();
  }
}
