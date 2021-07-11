import 'package:GradProject/providers/AwarnessProvider.dart';
import 'package:GradProject/widgets/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AwarenessScreen extends StatefulWidget {
  const AwarenessScreen({Key key}) : super(key: key);

  @override
  _AwarenessScreenState createState() => _AwarenessScreenState();
}

class _AwarenessScreenState extends State<AwarenessScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await Provider.of<AwarenessProvider>(context, listen: false)
          .fetchAwarnesses();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _awareness =
        Provider.of<AwarenessProvider>(context, listen: true).awarenesses;

    return Scaffold(
      body: Column(
        children: [
          MyAppBar(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Aware(
                    title: _awareness[index].title,
                    description: _awareness[index].data);
              },
              itemCount: _awareness.length,
            ),
          )
        ],
      ),
    );
  }
}

class Aware extends StatefulWidget {
  final String title;
  final List description;
  const Aware({@required this.title, @required this.description});

  @override
  _AwareState createState() => _AwareState();
}

class _AwareState extends State<Aware> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 0.4, color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      widget.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    })
              ],
            ),
          ),
          // Divider(),
          Container(
              height: _isExpanded ? widget.description.length * 50.0 : 0,
              child: ListView.builder(
                itemBuilder: (ctx, index) => ListTile(
                  leading: Text('#${index + 1}'),
                  title: Text(widget.description[index]),
                ),
                itemCount: widget.description.length,
              )),
        ],
      ),
    );
  }
}
