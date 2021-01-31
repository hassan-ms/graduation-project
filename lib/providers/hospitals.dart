import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Hospital {
  final String name;
  final String id;
  final Map<String, dynamic> address;
  final int freePlaces;
  Hospital({
    @required this.name,
    this.address,
    @required this.freePlaces,
    this.id,
  });
}

class Hospitals with ChangeNotifier {
  List<Hospital> _hospitals = [];
  List<Hospital> freeHospitals = [];
  List<Hospital> fullHospitals = [];
  List<Hospital> get hospitals {
    return _hospitals;
  }

  Future<List<Hospital>> fetchHospitals() async {
    List<Hospital> hosps = [];
    final res = await FirebaseFirestore.instance.collection('hospital').get();
    res.docs.forEach((document) {
      hosps.add(Hospital(
          id: document.id,
          address: document.data()['address'],
          freePlaces: document.data()['free_places'],
          name: document.data()['name']));
    });
    if (hosps != null) {
      _hospitals = hosps;
      freeHospitals = hosps.where((hosp) => hosp.freePlaces != 0).toList();
      fullHospitals = hosps.where((hosp) => hosp.freePlaces == 0).toList();
    }

    return hosps;
    notifyListeners();
  }

  Future<void> addToWAiting(patientId, hospitalId) async {
    await FirebaseFirestore.instance
        .collection('hospital')
        .doc(hospitalId)
        .update({
      'waiting_patints': FieldValue.arrayUnion([patientId])
    });
    await FirebaseFirestore.instance
        .collection('patients')
        .doc(patientId)
        .update({
      'applied_hospitals': FieldValue.arrayUnion([hospitalId])
    });
  }
}
// FlatButton(
//   child: Text('add Hospital'),
//   onPressed: () {
//     hospitalsToAdd.forEach((hos) async {
//       final response = await FirebaseFirestore.instance
//           .collection('hospital')
//           .add({
//         'name': hos.name,
//         'address': {
//           'lat': hos.address['lat'],
//           'long': hos.address['long']
//         },
//         'free_places': hos.freePlaces
//       });
//       print(response);
//     });
//   },
// ),
