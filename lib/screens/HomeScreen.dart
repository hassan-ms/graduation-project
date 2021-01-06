import 'package:flutter/material.dart';
import '../widgets/TheAppBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TheAppBar(),
          ],
        ),
      ),
    );
  }
}
