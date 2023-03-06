import 'package:fitness/models/consultation_Model.dart';
import 'package:fitness/screen/History_D.dart';
import 'package:flutter/material.dart';

import '../Utils/Color.dart';
import 'Diagnosishistory.dart';

class Diagnosishistory extends StatefulWidget {
  consultation_Model consultation;
  Diagnosishistory({super.key, required this.consultation});

  @override
  State<Diagnosishistory> createState() => _DiagnosishistoryState();
}

class _DiagnosishistoryState extends State<Diagnosishistory> {
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
                      icon: Icon(Icons.arrow_back_ios))
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
                          child: Text(widget.consultation.content.toString())),
                      SizedBox(
                        height: 150,
                      ),
                      Text(
                        'Dr. replied',
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
                          child: Text(widget.consultation.reply.toString())),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
