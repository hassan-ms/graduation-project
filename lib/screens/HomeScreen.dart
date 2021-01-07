import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/TheAppBar.dart';
import '../constants.dart';
import '../widgets/HomeItem.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TheAppBar(),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: FittedBox(
                  child: Text(
                'Welcome Hassan,',
                style: kHeadingextStyle.copyWith(fontSize: 24),
              )),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Be safe and Stay home',
                style: kSubheadingextStyle.copyWith(
                    fontSize: 14, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                HomeItem(
                  title: 'Covid Test',
                  subtitle:
                      'check if you have Covid-19 and \nthedegree of infection',
                  img: SvgPicture.asset('assets/images/undraw_Choose_bwbs.svg'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
