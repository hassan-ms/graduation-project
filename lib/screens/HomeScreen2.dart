import 'package:GradProject/providers/AwarnessProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../widgets/MyAppBar.dart';
import '../widgets/HomeItem2.dart';

class HomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            MyAppBar(),
            Container(
              padding: EdgeInsets.only(left: 40, top: 10),
              alignment: Alignment.centerLeft,
              child: FittedBox(
                  child: Text(
                'Hello Hassan,',
                style: kHeadingextStyle.copyWith(
                  fontSize: 35,
                ),
              )),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 40),
              child: Text(
                'HOW CAN WE TAKE \nCARE OF YOURSELF ?',
                style: kSubheadingextStyle.copyWith(
                    fontSize: 30,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.only(top: 40, left: 15, right: 15),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                children: [
                  InkWell(
                    child: HomeItem2(
                      icon: Icon(
                        Icons.local_hospital,
                        color: Colors.white,
                      ),
                      head: 'Covid Test',
                      trail: 'check if you have Covid-19',
                      color: greyColor,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('covid-test-screen');
                    },
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('medicaments-screen');
                    },
                    child: HomeItem2(
                      icon: Icon(
                        Icons.local_hospital,
                        color: Colors.white,
                      ),
                      head: 'Treatment prototcol',
                      trail: 'medicaments and \n its times',
                      color: greyColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('developer');
                    },
                    child: HomeItem2(
                      icon: Icon(
                        Icons.local_hospital,
                        color: Colors.white,
                      ),
                      head: 'Tests\n results',
                      trail: 'medical tests results',
                      color: greyColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('get-hospital-screen');
                    },
                    child: HomeItem2(
                      icon: Icon(
                        Icons.local_hospital,
                        color: Colors.white,
                      ),
                      head: 'Status',
                      trail: 'measurements and tests during quarantine',
                      color: greyColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('awareness-screen');
                    },
                    child: HomeItem2(
                      icon: Icon(
                        Icons.local_hospital,
                        color: Colors.white,
                      ),
                      head: 'Awareness',
                      trail:
                          'Information about Covid-19 and how to interact with patients',
                      color: greyColor,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await Provider.of<AwarenessProvider>(context,
                              listen: false)
                          .fetchAwarnesses();
                    },
                    child: HomeItem2(
                      icon: Icon(
                        Icons.local_hospital,
                        color: Colors.white,
                      ),
                      head: 'First Aids',
                      trail: 'First Aids information',
                      color: greyColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // bottomNavigationBar: Row(),
      ),
    );
  }
}
