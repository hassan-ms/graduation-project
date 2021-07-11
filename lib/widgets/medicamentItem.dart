import 'package:flutter/material.dart';
import '../providers/medicamentsController.dart';

class MedicamentItem extends StatefulWidget {
  final Medicament medicament;
  MedicamentItem(this.medicament);
  @override
  _MedicamentItemState createState() => _MedicamentItemState();
}

class _MedicamentItemState extends State<MedicamentItem> {
  List<int> subtractTime(TimeOfDay time) {
    List<int> list = [];
    int now = TimeOfDay.now().minute + TimeOfDay.now().hour * 60;
    int medtime = time.minute + time.hour * 60;
    int diff = medtime - now;
    int hourdiff = time.hour - TimeOfDay.now().hour;
    int mindiff = time.minute - TimeOfDay.now().minute;
    if (mindiff < 0) {
      hourdiff--;
      mindiff = mindiff + 60;
    }
    list = [diff, hourdiff, mindiff];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          // Expanded(child: ListView.builder(itemBuilder: itemBuilder)),
          ListTile(
            leading: Image.asset('assets/icons/42466.png'),
            title: Text(
              widget.medicament.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Text(
              widget.medicament.note,
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            trailing: Text(
                '${widget.medicament.numberOfTimes} Times \n per ${widget.medicament.period}'),
            isThreeLine: true,
          ),
          // Container(
          //   child: Column(
          //       children: widget.medicament.appointment.map((index) {
          //     return Container(
          //       child: ListTile(
          //         leading: CircleAvatar(
          //           child: Text(
          //             '${index.time.hour}:${index.time.minute}',
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ),
          //         title: index.istacken
          //             ? Text('well done')
          //             : (subtractTime(index.time)[0] > 0
          //                 ? Text(
          //                     'remains:${subtractTime(index.time)[1]} hours and ${subtractTime(index.time)[2]} minutes ')
          //                 : Text(
          //                     'you miss the appointment please take the medicament',
          //                     style: TextStyle(color: Colors.red),
          //                   )),
          //         subtitle: index.note != null ? Text(index.note) : Container(),
          //         trailing: IconButton(
          //             icon: index.istacken
          //                 ? Icon(Icons.done)
          //                 : (subtractTime(index.time)[0] > 0
          //                     ? Icon(Icons.timelapse)
          //                     : Icon(
          //                         Icons.warning,
          //                         color: Colors.red,
          //                       )),
          //             onPressed: () {}),
          //       ),
          //     );
          //   }).toList()),
          // ),
        ],
      ),
    );
  }
}
