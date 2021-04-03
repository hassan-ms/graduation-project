import 'package:GradProject/constants.dart';
import 'package:GradProject/widgets/MyAppBar.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import '../providers/CovidTest.dart';

Map<String, dynamic> test = {
  'age': 0,
  'gender': 0,
  'fever': 0,
  'bodyPain': 0,
  'dryCough': 0,
  'diff_breathing': 0,
  'contact_infected': 0,
  'runny_nose': 0,
  'nasal_congestion': 0
};

class CovidTestScreen extends StatefulWidget {
  @override
  _CovidTestScreenState createState() => _CovidTestScreenState();
}

class _CovidTestScreenState extends State<CovidTestScreen> {
  List<String> _bodyPain = ['no pain', 'severe pain'];
  List<String> _noYes = ['no', 'yes'];
  List<String> _diffBreathing = [
    'no difficulty',
    'little difficulty',
    'severe difficulty'
  ];
  List<String> _contactIncfected = ['don\'t know', 'no', 'yes'];
  List<String> _gender = ['male', 'female'];
  final snackBar = SnackBar(
    content: Text('error! check network and try again'),
  );
  final _formKey = GlobalKey<FormState>();
  bool is_loading = false;
  Future<void> _saveForm(ctx) async {
    final isvalid = _formKey.currentState.validate();
    if (!isvalid) {
      return;
    }
    setState(() {
      is_loading = true;
    });
    final Covid covid = new Covid(
        dryCough: test['dryCough'],
        fever: test['fever'],
        age: test['age'],
        bodypain: test['bodyPain'],
        gender: test['gender'],
        diffbreathing: test['diff_breathing'],
        contact_infected: test['contact_infected'],
        nasal_congestion: test['nasal_congestion'],
        runny_nose: test['runny_nose']);
    try {
      await Provider.of<CovidTest>(ctx, listen: false).check(covid);
      setState(() {
        is_loading = false;
      });
      Navigator.of(context).pushNamed('test-result-screen');
    } catch (e) {
      setState(() {
        is_loading = false;
      });
      ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(),
              Container(
                child: Text(
                  'Covid Test',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              is_loading
                  ? Container(
                      padding: EdgeInsets.all(80),
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Age', style: TextStyle(fontSize: 20)),
                                  Container(
                                    width: 50,
                                    child: TextFormField(
                                      onChanged: (val) {
                                        setState(() {
                                          test['age'] = val;
                                        });
                                      },
                                      keyboardType: TextInputType.number,
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'age can\'t be empty';
                                        }
                                        if (int.parse(val) > 100 ||
                                            int.parse(val) <= 0) {
                                          return 'invalid age';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Question(
                              qn: 'Gender',
                              st: _gender,
                              txt: 'gender',
                            ),
                            Question(
                              qn: 'Tiredness & bodypain',
                              st: _bodyPain,
                              txt: 'bodyPain',
                            ),
                            Question(
                              qn: 'dry cough',
                              st: _noYes,
                              txt: 'dryCough',
                            ),
                            Question(
                              qn: 'difficulty breathing',
                              st: _diffBreathing,
                              txt: 'diff_breathing',
                            ),
                            Question(
                              qn: 'runny nose',
                              st: _noYes,
                              txt: 'runny_nose',
                            ),
                            Question(
                              qn: 'nasal congestion',
                              st: _noYes,
                              txt: 'nasal_congestion',
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Fever effect',
                                      style: TextStyle(fontSize: 20)),
                                  Container(
                                    width: 50,
                                    child: TextFormField(
                                      onChanged: (val) {
                                        setState(() {
                                          test['fever'] = val;
                                        });
                                      },
                                      keyboardType: TextInputType.number,
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'this field can\'t be empty';
                                        }
                                        if (int.parse(val) > 100 ||
                                            int.parse(val) < 0) {
                                          return 'must be between 0 and 100';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Question(
                              qn: 'contact infected person?',
                              st: _contactIncfected,
                              txt: 'contact_infected',
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: 110,
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(20),
                                // border:
                                //     Border.all(color: primaryColor, width: 2),
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    _saveForm(context);
                                  },
                                  child: Text('Result',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),

              // Center(
              //   child: TextButton(
              //     child: Text('machine'),
              //     onPressed: () async {
              //       await Provider.of<CovidTest>(context, listen: false).check(
              //           fever: 70,
              //           age: 80,
              //           bodypain: 1,
              //           cough: 1,
              //           diffbreathing: 1);

              //       // print(result);
              //       Navigator.of(context).push(MaterialPageRoute(
              //           builder: (BuildContext context) => TestResultScreen()));
              //       //Provider.of<CovidTest>(context, listen: false).x();
              //       //await Provider.of<CovidTest>(context, listen: false).test();
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class Question extends StatefulWidget {
  const Question({
    @required this.txt,
    @required this.st,
    @required this.qn,
  });
  final String txt;
  final List<String> st;
  final qn;

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(widget.qn, style: TextStyle(fontSize: 20)),
          Container(
            margin: EdgeInsets.only(right: 30),
            child: DropdownButton<String>(
              items: widget.st.map((value) {
                return DropdownMenuItem<String>(
                  child: new Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  test[widget.txt] = widget.st.indexOf(value);
                });
              },
              elevation: 10,
              value: widget.st[test[widget.txt]],
              underline: Container(
                height: 2,
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
