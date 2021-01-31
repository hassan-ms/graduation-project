import 'package:flutter/material.dart';

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
                    onTap: () {},
                    child: HomeItem2(
                      icon: Icon(
                        Icons.local_hospital,
                        color: Colors.white,
                      ),
                      head: 'Covid Test',
                      trail: 'check if you have Covid-19',
                      color: greyColor,
                    ),
                  ),
                  HomeItem2(
                    icon: Icon(
                      Icons.local_hospital,
                      color: Colors.white,
                    ),
                    head: 'Covid Test',
                    trail: 'check if you have Covid-19',
                    color: greyColor,
                  ),
                  HomeItem2(
                    icon: Icon(
                      Icons.local_hospital,
                      color: Colors.white,
                    ),
                    head: 'Covid Test',
                    trail: 'check if you have Covid-19',
                    color: greyColor,
                  ),
                ],
              ),
            )
          ],
        ),
        // bottomNavigationBar: Row(),
      ),
    );
  }
}
