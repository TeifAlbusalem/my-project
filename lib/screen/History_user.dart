import 'package:fitness/screen/History_D.dart';
import 'package:flutter/material.dart';

import '../Utils/Color.dart';
import '../controls/control.dart';
import '../models/consultation_Model.dart';
import 'Diagnosishistory.dart';

class History_user extends StatefulWidget {
  const History_user({super.key});

  @override
  State<History_user> createState() => _History_userState();
}

class _History_userState extends State<History_user> {
  Control _control = Control();
  List<consultation_Model> Lconsultations = [];
  bool isloading = true;

  get_consultations() {
    _control.get_consultation().then((value) => setState(() {
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
                          itemCount: Lconsultations.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                    Lconsultations[index].reply.toString()),
                                subtitle: Lconsultations[index].content == null
                                    ? Text('')
                                    : Text(Lconsultations[index]
                                        .content
                                        .toString()),
                                // trailing: Icon(Icons.done),
                                onTap: () {
                                  Lconsultations[index].content == null
                                      ? null
                                      : Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                          return Diagnosishistory(
                                            consultation: Lconsultations[index],
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
