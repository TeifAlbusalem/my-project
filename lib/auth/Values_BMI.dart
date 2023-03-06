import 'package:fitness/screen/report.dart';
import 'package:flutter/material.dart';
import '../Utils/Color.dart';
import 'sign_up.dart';

class Values_BMI extends StatefulWidget {
  Values_BMI({Key? key, required this.isNormal, required this.id})
      : super(key: key);
  final bool isNormal;
  final String id;

  @override
  State<Values_BMI> createState() => _Values_BMIState();
}

class _Values_BMIState extends State<Values_BMI> {
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
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                ],
              ),
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
                    Image.asset(
                      "assets/image/sick.png",
                      height: 200,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    // Container(
                    //   width: wi / 2,
                    //   child: TextFormField(
                    //     enabled: false,
                    //     textAlign: TextAlign.center,
                    //     keyboardType: TextInputType.phone,
                    //     cursorColor: Colors.black,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(30),
                    //       ),
                    //       filled: true,
                    //       fillColor: Colors.white,
                    //       enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(30),
                    //           borderSide:
                    //               BorderSide(color: Colors.transparent)),
                    //       focusedBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(30),
                    //           borderSide:
                    //               BorderSide(color: Colors.transparent)),
                    //       hintText: 'Title',
                    //       hintStyle: TextStyle(
                    //           color: Color(0xff8c9289), fontFamily: 'Cobe'),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 80,
                    ),
                    widget.isNormal
                        ? Column(
                            children: [
                              Container(
                                height: 60,
                                width: wi / 2,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                    child: Text(
                                  'Normal',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                )),
                              ),
                              SizedBox(
                                height: 80,
                              ),
                              Text(
                                'you have little of high \n temprutre , eat suger less',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ],
                          )
                        : Container(
                            height: 60,
                            width: wi / 2,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: MaterialButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return Report(
                                    id: widget.id.toString(),
                                  );
                                }));
                              },
                              child: Text(
                                "send report to doctor",
                                style: TextStyle(fontSize: 17),
                              ),
                            )),
                          )
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
