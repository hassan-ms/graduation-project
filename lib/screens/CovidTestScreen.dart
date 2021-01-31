import 'package:GradProject/providers/CovidTest.dart';
import 'package:GradProject/widgets/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/CovidTest.dart';
import './ResultScreen.dart';

class CovidTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            MyAppBar(),
            Center(
              child: TextButton(
                child: Text('machine'),
                onPressed: () async {
                  // await Provider.of<CovidTest>(context, listen: false).check(
                  //     fever: 70,
                  //     age: 80,
                  //     bodypain: 1,
                  //     cough: 1,
                  //     diffbreathing: 1);

                  // print(result);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => TestResultScreen()));
                  //Provider.of<CovidTest>(context, listen: false).x();
                  //await Provider.of<CovidTest>(context, listen: false).test();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
