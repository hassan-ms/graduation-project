import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class MyAppBar extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  MyAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Container(
      height: 70,
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
          // StreamBuilder(
          //     stream: db
          //         .collection('notifications')
          //         .doc('4CaJ8qnZ0KdUyXPlwf7w5S6bOyY2')
          //         .snapshots(),
          //     builder: (context, snapshot) {
          //       DocumentSnapshot ss = snapshot.data;
          //       if (ss.data().isEmpty) {
          //         return Icon(
          //           Icons.notifications_none_outlined,
          //           size: 35,
          //           color: Colors.white,
          //         );
          //       }
          //       return PopupMenuButton(
          //         child: Stack(
          //           children: [
          //             Icon(
          //               Icons.notifications_none_outlined,
          //               size: 35,
          //               color: Colors.white,
          //             ),
          //             Container(
          //               decoration: BoxDecoration(
          //                   color: Colors.grey,
          //                   borderRadius: BorderRadius.circular(6)),
          //               // margin: EdgeInsets.only(top: 5, left: 10),
          //               child: Text(ss.data().length.toString(),
          //                   style: TextStyle(color: primaryColor, fontSize: 20),
          //                   textAlign: TextAlign.start),
          //             ),
          //           ],
          //         ),
          //         itemBuilder: (_) => ss.data().entries.map((ent) {
          //           return PopupMenuItem(
          //             child: Text(ent.value),
          //             value: ent.key,
          //           );
          //         }).toList(),
          //         onSelected: (value) async {
          //           // Navigator.of(context).pushNamed(value);
          //           // DocumentSnapshot snapsht;
          //           db
          //               .collection('notifications')
          //               .doc('4CaJ8qnZ0KdUyXPlwf7w5S6bOyY2')
          //               .update({value: FieldValue.delete()});
          //           Navigator.of(context).pushNamed(value);
          //         },
          //       );
          //     }),
        ],
      ),
    );
  }
}
