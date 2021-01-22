import 'package:flutter/material.dart';

import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(75, 102, 235, 1).withOpacity(0.5),
                    spreadRadius: 7,
                    blurRadius: 8,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.only(top: 15, bottom: 2, right: 10, left: 10),
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  Text(
                    'Health Care',
                    style: kHeadingextStyle.copyWith(
                        color: Colors.white, fontSize: 20),
                  ),
                  IconButton(
                      icon: Image.asset(
                        'assets/images/125745-200.png',
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
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
                  HomeItem2(
                    color: primaryColor,
                    head: 'Covid Test',
                    trail: 'check if you have Covid-19',
                    icon: FaIcon(
                      FontAwesomeIcons.clinicMedical,
                      color: Colors.white,
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

class HomeItem2 extends StatelessWidget {
  final icon;
  final head;
  final trail;
  final color;
  const HomeItem2({
    Key key,
    @required this.icon,
    @required this.head,
    @required this.trail,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      color: Colors.transparent,
      elevation: 15,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
        ),
        padding: EdgeInsets.only(top: 10, left: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/questionnaire.png',
              width: 25,
              color: Colors.white,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    head,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    trail,
                    style: TextStyle(color: Colors.white54, fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
