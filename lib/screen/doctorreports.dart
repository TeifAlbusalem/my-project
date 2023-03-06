import 'package:fitness/models/History_doctor_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../controls/control.dart';
import '../models/consultation_Model.dart';
import 'doctorreplay.dart';

class DoctorReport extends StatefulWidget {
  const DoctorReport({super.key});

  @override
  State<DoctorReport> createState() => _DoctorReportState();
}

List<String> Lconsultations = [
  "bairak",
  "bairak",
  "bairak",
  "bairak",
];

class _DoctorReportState extends State<DoctorReport> {
  Control _control = Control();
  List<consultation_Model> Lconsultations = [];
  bool isloading = true;

  get_consultations() {
    _control.get_consultations().then((value) => setState(() {
          Lconsultations = value!;
          isloading = false;
        }));
  }

  @override
  void initState() {
    get_consultations();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> items = [
      "patient id",
      "patient name",
      "patient status",
      "IBM",
      "report",
    ];
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
                height: height / 6,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                  color: Colors.white,
                ),
                height: height - (height / 4),
                width: width,
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: Lconsultations.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey[200],
                      child: ListTile(
                        title:
                            Text(Lconsultations[index].client_fname.toString()),
                        subtitle:
                            Text(Lconsultations[index].client_bmi.toString()),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return DoctoeReplay(
                              consultation: Lconsultations[index],
                            );
                          }));
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
