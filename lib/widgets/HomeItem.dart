import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final title;
  final subtitle;
  final img;
  final Function onpressed;
  const HomeItem({
    @required this.title,
    @required this.subtitle,
    @required this.img,
    @required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 0.2),
            borderRadius: BorderRadius.circular(15)),
        height: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.contain,
                child: img,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(right: 30, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            IconButton(
              iconSize: 40,
              icon: Icon(Icons.arrow_right),
              onPressed: onpressed,
            )
          ],
        ));
  }
}
