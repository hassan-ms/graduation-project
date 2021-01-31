import 'package:flutter/material.dart';
import '../constants.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: kHeadingextStyle.copyWith(color: Colors.white, fontSize: 20),
          ),
          IconButton(
              icon: Image.asset(
                'assets/images/125745-200.png',
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
