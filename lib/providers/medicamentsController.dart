import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Medicament {
  final String name;
  final String note;
  final int numberOfTimes;
  final String period;

  Medicament(
      {@required this.name,
      @required this.note,
      @required this.numberOfTimes,
      @required this.period});
}

class MedicamentsController with ChangeNotifier {
  List<Medicament> _medicaments = [];

  List<Medicament> get medicaments {
    return _medicaments;
  }

  Future<void> fetchMedicaments() async {
    final result = await FirebaseFirestore.instance
        .collection('Prescriptions')
        .doc('4CaJ8qnZ0KdUyXPlwf7w5S6bOyY2')
        .get();
    if (result == null) {
      return;
    }

    result.data()['medicines'].forEach((key, value) {
      print(value['note']);
      _medicaments.add(Medicament(
          name: key,
          note: value['note'],
          numberOfTimes: value['times'],
          period: value['period']));
    });
    notifyListeners();
  }
}
