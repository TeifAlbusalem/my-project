import 'package:fitness/models/History_doctor_Model.dart';
import 'package:fitness/screen/DiagnosishistoryD.dart';
import 'package:fitness/screen/History_D.dart';
import 'package:flutter/material.dart';

import '../Utils/Color.dart';
import '../controls/control.dart';
import '../models/consultation_Model.dart';
import 'Diagnosishistory.dart';

class History_D extends StatefulWidget {
  const History_D({super.key});

  @override
  State<History_D> createState() => _History_DState();
}

class _History_DState extends State<History_D> {
  Control _control = Control();
  List<History_doctor_Model> LHistory_doctors = [];
  bool isloading = true;

  get_doctor_consultations() {
    _control.get_doctor_consultations().then((value) => setState(() {
          LHistory_doctors = value!;
          isloading = false;
        }));
  }

  @override
  void initState() {
    get_doctor_consultations();
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
                      onPressed: (() {
                        Navigator.of(context).pop();
                      }),
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
                padding: EdgeInsets.all(8),
                child: Expanded(
                  child: isloading
                      ? Container(
                          width: double.infinity,
                          child: Center(
                              child: CircularProgressIndicator(
                            color: Color(ColorP),
                          )),
                        )
                      : ListView.builder(
                          itemCount: LHistory_doctors.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(LHistory_doctors[index]
                                    .client_fname
                                    .toString()),
                                subtitle: LHistory_doctors[index].reply == null
                                    ? Text('')
                                    : Text(LHistory_doctors[index]
                                        .content
                                        .toString()),
                                onTap: () {
                                  LHistory_doctors[index].content == null
                                      ? null
                                      : Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                          return DiagnosishistoryD(
                                            History_doctor:
                                                LHistory_doctors[index],
                                          );
                                        }));
                                },
                              ),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
