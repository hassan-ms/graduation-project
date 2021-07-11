import 'package:GradProject/providers/medicamentsController.dart';
import 'package:GradProject/widgets/MyAppBar.dart';
import 'package:GradProject/widgets/medicamentItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MedicamentsScreens extends StatefulWidget {
  @override
  _MedicamentsScreensState createState() => _MedicamentsScreensState();
}

class _MedicamentsScreensState extends State<MedicamentsScreens> {
  bool _isLoading = false;
  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    try {
      Future.delayed(Duration.zero, () async {
        await Provider.of<MedicamentsController>(context, listen: false)
            .fetchMedicaments();
      });
    } catch (e) {
      throw e;
    }
    setState(() {
      _isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final medicaments = Provider.of<MedicamentsController>(context).medicaments;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          MyAppBar(),
          Expanded(
              child: _isLoading
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: medicaments.length,
                      itemBuilder: (ctx, index) => MedicamentItem(Medicament(
                          name: medicaments[index].name,
                          note: medicaments[index].note,
                          numberOfTimes: medicaments[index].numberOfTimes,
                          period: medicaments[index].period))))
        ],
      )),
    );
  }
}
