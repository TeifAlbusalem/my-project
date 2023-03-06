import 'package:fitness/models/History_doctor_Model.dart';
import 'package:fitness/models/consultation_Model.dart';
import 'package:fitness/screen/History_D.dart';
import 'package:flutter/material.dart';

import '../Utils/Color.dart';
import 'Diagnosishistory.dart';

class DiagnosishistoryD extends StatefulWidget {
  History_doctor_Model History_doctor;
  DiagnosishistoryD({super.key, required this.History_doctor});

  @override
  State<DiagnosishistoryD> createState() => _DiagnosishistoryDState();
}

class _DiagnosishistoryDState extends State<DiagnosishistoryD> {
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
                      icon: Icon(Icons.arrow_back_ios_new))
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
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        'My Message',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Container(
                          width: 250,
                          child: Divider(
                            thickness: 2,
                          )),
                      Container(
                          width: 250,
                          child:
                              Text(widget.History_doctor.content.toString())),
                      SizedBox(
                        height: 150,
                      ),
                      Text(
                        'Patient message',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Container(
                          width: 250,
                          child: Divider(
                            thickness: 2,
                          )),
                      Container(
                          width: 250,
                          child: Text(widget.History_doctor.reply.toString())),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
