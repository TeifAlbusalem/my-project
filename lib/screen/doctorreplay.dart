import 'package:fitness/controls/control.dart';
import 'package:fitness/models/History_doctor_Model.dart';
import 'package:fitness/screen/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/consultation_Model.dart';

class DoctoeReplay extends StatefulWidget {
  consultation_Model consultation;
  DoctoeReplay({super.key, required this.consultation});

  @override
  State<DoctoeReplay> createState() => _ReportState();
}

TextEditingController report = TextEditingController();

class _ReportState extends State<DoctoeReplay> {
  Control _control = Control();
  @override
  Widget build(BuildContext context) {
    double hi = MediaQuery.of(context).size.height;
    double wi = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: hi / 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'patient name: ',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.consultation.client_fname.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                ],
              ),
              Container(
                  //color: Colors.red,
                  height: hi / 4,
                  child: Image.asset("assets/image/sick.png")),
              SizedBox(
                height: hi / 15,
              ),
              Center(
                  child: Text(
                "your patients  " +
                    widget.consultation.client_fname.toString() +
                    " Bmi: " +
                    widget.consultation.client_bmi.toString(),
                style: TextStyle(fontSize: 25, color: Colors.red),
              )),
              SizedBox(
                height: hi / 20,
              ),
              Center(
                  child: Text(
                widget.consultation.content.toString(),
                style: TextStyle(fontSize: 15, color: Colors.red),
              )),
              SizedBox(
                height: hi / 20,
              ),
              form(report, "write replay and diagnosis here",
                  TextInputType.text),
              SizedBox(
                height: hi / 15,
              ),
              Container(
                width: wi / 3,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.red,
                ),
                child: MaterialButton(
                  onPressed: () {
                    _control.add_reply(report.text.toString(),
                        widget.consultation.id.toString(), context);
                  },
                  child: Text("Send"),
                ),
              )
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
          //color: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 30),
          //height: 400,
          width: double.infinity,
          child: TextFormField(
            maxLines: 8,
            keyboardType: type,
            cursorColor: Colors.black,
            controller: controllerText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: Colors.grey[300],
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
}
