import 'package:flutter/material.dart';

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
