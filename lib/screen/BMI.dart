import 'package:fitness/auth/Values_BMI.dart';
import 'package:fitness/controls/control.dart';
import 'package:fitness/screen/History_user.dart';
import 'package:flutter/material.dart';
import '../Utils/Color.dart';
import '../auth/Home_page_Doctor.dart';
import '../auth/type.dart';

class BMI extends StatefulWidget {
  BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool isNormal = true;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bloodpressureController = TextEditingController();
  TextEditingController pressureController = TextEditingController();
  TextEditingController tempratureController = TextEditingController();

  Control _control = Control();

  @override
  Widget build(BuildContext context) {
    double hi = MediaQuery.of(context).size.height;
    double wi = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/background1.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              SizedBox(
                height: hi / 6,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                  color: Color(ColorBG),
                ),
                height: hi - (hi / 6),
                width: wi,
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.height,
                          size: 35,
                          color: Colors.red,
                        ),
                        Container(
                          height: hi / 13,
                          margin: EdgeInsets.all(8),
                          width: wi / 2,
                          child: TextFormField(
                            controller: heightController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.phone,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              hintText: 'Height',
                              hintStyle: TextStyle(
                                  color: Color(0xff8c9289), fontFamily: 'Cobe'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.line_weight_rounded,
                          size: 35,
                          color: Colors.red,
                        ),
                        Container(
                          height: hi / 13,
                          margin: EdgeInsets.all(8),
                          width: wi / 2,
                          child: TextFormField(
                            controller: weightController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.phone,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              hintText: 'Weight',
                              hintStyle: TextStyle(
                                  color: Color(0xff8c9289), fontFamily: 'Cobe'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sunny,
                          size: 35,
                          color: Colors.red,
                        ),
                        Container(
                          height: hi / 13,
                          margin: EdgeInsets.all(8),
                          width: wi / 2,
                          child: TextFormField(
                            controller: tempratureController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.phone,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              hintText: 'Temperature',
                              hintStyle: TextStyle(
                                  color: Color(0xff8c9289), fontFamily: 'Cobe'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bloodtype,
                          size: 35,
                          color: Colors.red,
                        ),
                        Container(
                          height: hi / 13,
                          margin: EdgeInsets.all(8),
                          width: wi / 2,
                          child: TextFormField(
                            controller: bloodpressureController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.phone,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              hintText: 'Diabetes',
                              hintStyle: TextStyle(
                                  color: Color(0xff8c9289), fontFamily: 'Cobe'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.present_to_all,
                          size: 35,
                          color: Colors.red,
                        ),
                        Container(
                          height: hi / 13,
                          margin: EdgeInsets.all(8),
                          width: wi / 2,
                          child: TextFormField(
                            controller: pressureController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.phone,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              hintText: 'Pressure',
                              hintStyle: TextStyle(
                                  color: Color(0xff8c9289), fontFamily: 'Cobe'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (int.parse(
                                      heightController.text.toString()) <
                                  100 ||
                              int.parse(heightController.text.toString()) >
                                  300 ||
                              heightController.text.toString() == '') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'height : 100 - 300',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.red,
                            ));
                          } else if (int.parse(
                                      weightController.text.toString()) <
                                  0 ||
                              int.parse(weightController.text.toString()) >
                                  300 ||
                              weightController.text.toString() == '') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'weight: 0 - 300',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.red,
                            ));
                          } else if (int.parse(
                                      tempratureController.text.toString()) <
                                  20 ||
                              int.parse(tempratureController.text.toString()) >
                                  50 ||
                              tempratureController.text.toString() == '') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'temprature: 20 - 50',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.red,
                            ));
                          } else if (int.parse(
                                      bloodpressureController.text.toString()) <
                                  30 ||
                              int.parse(
                                      bloodpressureController.text.toString()) >
                                  700 ||
                              pressureController.text.toString() == '') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Diabetes: 30 - 700',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.red,
                            ));
                          } else if (int.parse(
                                      pressureController.text.toString()) <
                                  5 ||
                              int.parse(pressureController.text.toString()) >
                                  250 ||
                              pressureController.text.toString() == '') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'pressure: 5 - 250',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.red,
                            ));
                          } else {
                            _control.calc_bmi(
                                heightController.text.toString(),
                                weightController.text.toString(),
                                bloodpressureController.text.toString(),
                                pressureController.text.toString(),
                                tempratureController.text.toString(),
                                context);
                          }
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(ColorP),
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                // side: BorderSide(width: 1.0, color: Colors.black),
                                borderRadius: BorderRadius.circular(25)),
                            minimumSize: const Size(250, 60),
                            primary: Colors.white)),
                    SizedBox(
                      height: 35,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return History_user();
                          }));
                        },
                        child: Text(
                          'History',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(ColorP),
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                // side: BorderSide(width: 1.0, color: Colors.black),
                                borderRadius: BorderRadius.circular(25)),
                            minimumSize: const Size(250, 60),
                            primary: Colors.white)),
                    SizedBox(
                      height: 25,
                    ),
                    Card(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return type();
                            }), (route) => false);
                          },
                          child: Text(
                            'Log Out',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(ColorP),
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  // side: BorderSide(width: 1.0, color: Colors.black),
                                  borderRadius: BorderRadius.circular(8)),
                              minimumSize: const Size(250, 60),
                              primary: Colors.white)),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column form(controllerText, String Title, TextInputType type) {
    return Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          child: TextFormField(
            keyboardType: type,
            cursorColor: Colors.black,
            controller: controllerText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent)),
              hintText: Title,
              hintStyle:
                  TextStyle(color: Color(0xff8c9289), fontFamily: 'Cobe'),
            ),
          ),
        ),
      ],
    );
  }

  Column button(String title) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {},
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    // side: BorderSide(width: 1.0, color: Colors.black),
                    borderRadius: BorderRadius.circular(25)),
                minimumSize: const Size(250, 60),
                primary: Color(ColorP))),
      ],
    );
  }
}
