import 'package:fitness/controls/control.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Report extends StatefulWidget {
  String id;
  Report({super.key, required this.id});

  @override
  State<Report> createState() => _ReportState();
}

TextEditingController report = TextEditingController();
Control _control = Control();

class _ReportState extends State<Report> {
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
                "tell your doctor what do you feel",
                style: TextStyle(fontSize: 25, color: Colors.red),
              )),
              SizedBox(
                height: hi / 10,
              ),
              form(report, "write report here", TextInputType.text),
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
                    _control.add_consultation(report.text.toString(), context);
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
