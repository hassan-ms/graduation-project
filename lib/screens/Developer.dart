import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Developer extends StatefulWidget {
  @override
  _DeveloperState createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  @override
  void initState() {
    _flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var initSetting = new InitializationSettings(android: android, iOS: ios);
    _flutterLocalNotificationsPlugin.initialize(initSetting,
        onSelectNotification: onSelectNotification);
    super.initState();
  }

  Future onSelectNotification(String note) {
    debugPrint(note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: _showNotification, child: Text('push')),
      ),
    );
  }

  _showNotification() async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel name', 'channelDescription');
    var ios = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: ios);
    await _flutterLocalNotificationsPlugin.show(
        0, 'medicament time', 'this is medicament time ', platform);
  }
}
