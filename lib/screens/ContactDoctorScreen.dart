import 'package:GradProject/widgets/MyAppBar.dart';
import 'package:flutter/material.dart';

class ContactDoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(),
          Expanded(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Your test is sent to doctors successfully \nWait for doctor reply.',
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                SizedBox(height: 10),
                Text(
                  'Please stay home and don\'t go outside.',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
