import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Awareness {
  final title;
  final List data;
  Awareness(this.title, this.data);
}

class AwarenessProvider with ChangeNotifier {
  List<Awareness> _awarenesses = [];
  List<Awareness> get awarenesses {
    return _awarenesses;
  }

  Future<void> fetchAwarnesses() async {
    List<Awareness> awares = [];
    final res = await FirebaseFirestore.instance.collection('awareness').get();
    res.docs.forEach((element) {
      awares.add(Awareness(element['title'], element['des']));
      print('title    ' + element['des'][0]);
    });
    _awarenesses = awares;
    notifyListeners();
  }
}
