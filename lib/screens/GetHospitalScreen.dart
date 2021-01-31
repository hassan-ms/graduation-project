import 'package:GradProject/constants.dart';
import 'package:GradProject/providers/hospitals.dart';
import 'package:GradProject/widgets/MyAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class GetHospitalScreen extends StatefulWidget {
  @override
  _GetHospitalScreenState createState() => _GetHospitalScreenState();
}

class _GetHospitalScreenState extends State<GetHospitalScreen> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress = "";
  bool _isLoading = false;
  String _nHospital = "";
  List<String> addedHospitals = [];
  final patientId = "7fxeB0eVX8Vw9sGKzj9J";
  Future _getCurrentLocation() {
    return geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      throw e;
    });
  }

  Future _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  Future<double> getDistance(hospitalLat, hospitalLang) async {
    final distance = await Geolocator().distanceBetween(
        _currentPosition.latitude,
        _currentPosition.longitude,
        hospitalLat,
        hospitalLang);
    return distance;
  }

  Future<Hospital> getNearestHospital(hosps) async {
    double minDistance = 100000000;
    Hospital nHospital;
    for (var hospital in hosps) {
      final dis =
          await getDistance(hospital.address['lat'], hospital.address['long']);
      if (dis < minDistance) {
        nHospital = hospital;
        minDistance = dis;
      }
    }
    return nHospital;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      setState(() {
        _isLoading = true;
      });
      await Firebase.initializeApp();
      await Provider.of<Hospitals>(context, listen: false).fetchHospitals();
      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hospitals = Provider.of<Hospitals>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            MyAppBar(),
            Expanded(
              child: _currentPosition == null || hospitals.hospitals.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                'Please open GPS then press button below to get available hospital.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF0D47A1)),
                              ),
                            ),
                            _isLoading
                                ? CircularProgressIndicator()
                                : FlatButton(
                                    child: Image.asset(
                                      'assets/icons/—Pngtree—location travel marker hospital icon_3664286.png',
                                      height: 100,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _isLoading = true;
                                      });

                                      await _getCurrentLocation();
                                      final hospital = await getNearestHospital(
                                          hospitals.freeHospitals);

                                      _nHospital = hospital.id;
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    },
                                  )
                          ],
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(top: 10, left: 10, bottom: 10),
                          child: Text(
                            'Available Hospitals',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.4,
                          endIndent: 100,
                        ),
                        Flexible(
                          flex: 1,
                          child: ListView.builder(
                              itemBuilder: (ctx, index) => ListTile(
                                  title:
                                      Text(hospitals.freeHospitals[index].name),
                                  leading: hospitals.freeHospitals[index].id ==
                                          _nHospital
                                      ? Container(
                                          padding: EdgeInsets.all(5),
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Text('nearest'),
                                        )
                                      : Image.asset(
                                          'assets/icons/—Pngtree—location travel marker hospital icon_3664286.png',
                                          height: 100,
                                        ),
                                  trailing: FlatButton(
                                      child: Text(
                                        'register',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 15),
                                      ),
                                      onPressed: () {
                                        hospitals.addToWAiting(patientId,
                                            hospitals.freeHospitals[index].id);
                                        Navigator.of(context).pop();
                                      })),
                              itemCount: hospitals.freeHospitals.length),
                        ),
                        // Divider(color: Colors.grey, thickness: 0.8),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 10, left: 10, bottom: 10),
                          child: Text(
                            'Full Hospitals',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.4,
                          endIndent: 100,
                        ),
                        Flexible(
                          flex: 1,
                          child: ListView.builder(
                              itemBuilder: (ctx, index) => ListTile(
                                  title:
                                      Text(hospitals.fullHospitals[index].name),
                                  leading: Image.asset(
                                    'assets/icons/—Pngtree—location travel marker hospital icon_3664286.png',
                                    height: 100,
                                  ),
                                  trailing: addedHospitals.contains(
                                          hospitals.fullHospitals[index].id)
                                      ? Icon(Icons.done)
                                      : FlatButton(
                                          child: Text(
                                            'register',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 15),
                                          ),
                                          onPressed: () async {
                                            await hospitals.addToWAiting(
                                                patientId,
                                                hospitals
                                                    .fullHospitals[index].id);
                                            setState(() {
                                              addedHospitals.add(hospitals
                                                  .fullHospitals[index].id);
                                            });
                                          })),
                              itemCount: hospitals.fullHospitals.length),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
