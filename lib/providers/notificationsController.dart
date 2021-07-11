import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Notifications with ChangeNotifier {
  Map<String, dynamic> notifications = {};
  Future<void> fetchNotifications() async {
    final res = await FirebaseFirestore.instance
        .collection('notifications')
        .doc('4CaJ8qnZ0KdUyXPlwf7w5S6bOyY2')
        .get();
    if (res.data() != null) {
      notifications = res.data();
    }
    print(notifications);
    return notifications;
  }
}
