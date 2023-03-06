import 'package:fitness/auth/type.dart';
import 'package:fitness/screen/Diagnosishistory.dart';
import 'package:flutter/material.dart';
import '../Utils/Color.dart';
import '../screen/History_D.dart';
import '../screen/doctorreports.dart';
import 'sign_up.dart';

class Home_page_Doctor extends StatefulWidget {
  Home_page_Doctor({Key? key}) : super(key: key);

  @override
  State<Home_page_Doctor> createState() => _Home_page_DoctorState();
}

class _Home_page_DoctorState extends State<Home_page_Doctor> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                    borderRadius: BorderRadius.circular(35),
                    color: Color(ColorBG) //rgba(28,200,202,255)
                    ),
                height: hi - (hi / 6),
                width: wi,
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Image.asset("assets/image/doctor.PNG"),
                    SizedBox(
                      height: 50,
                    ),
                    Card(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return DoctorReport();
                            }));
                          },
                          child: Text(
                            'Patient messages',
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
                    SizedBox(
                      height: 15,
                    ),
                    Card(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return History_D();
                            }));
                          },
                          child: Text(
                            'Diagnosis history',
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
                    SizedBox(
                      height: 15,
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
