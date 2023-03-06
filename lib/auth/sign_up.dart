import 'package:fitness/Utils/Color.dart';
import 'package:fitness/auth/log_in.dart';
import 'package:fitness/auth/val.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../controls/user_control.dart';

class sgin_up extends StatefulWidget {
  String type;
  sgin_up({Key? key, required this.type}) : super(key: key);

  @override
  State<sgin_up> createState() => _sgin_upState();
}

class _sgin_upState extends State<sgin_up> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController mnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController QualificationController = TextEditingController();
  TextEditingController SpecializationController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  List<String> Lyear = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
  ];
  bool isChecked = false;

  User_Control _user_control = User_Control();

  var maleOrFemale;
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
        backgroundColor: Colors.white,
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/background1.png"),
                fit: BoxFit.cover),
          ),
          child: Container(
            height: hi,
            width: wi,
            padding: EdgeInsets.all(0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: hi / 5,
                  ),
                  Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color(ColorBG),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35)),
                      ),
                      width: wi,
                      height: hi - (hi / 6),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: hi / 16,
                            ),
                            form(fnameController, 'First Name',
                                TextInputType.name),
                            SizedBox(
                              height: hi / 70,
                            ),
                            form(lnameController, 'Last Name',
                                TextInputType.name),
                            SizedBox(
                              height: hi / 70,
                            ),
                            form(emailController, 'Email',
                                TextInputType.emailAddress),
                            SizedBox(
                              height: hi / 70,
                            ),
                            form(passwordController, 'Password',
                                TextInputType.visiblePassword),
                            SizedBox(
                              height: hi / 70,
                            ),
                            form(phoneController, 'Phone Number',
                                TextInputType.phone),
                            SizedBox(
                              height: hi / 70,
                            ),
                            form(dateController, 'Date Of Birth',
                                TextInputType.text),
                            SizedBox(
                              height: hi / 70,
                            ),
                            widget.type == '2'
                                ? form(QualificationController, 'Qualification',
                                    TextInputType.text)
                                : SizedBox(),
                            widget.type == '2'
                                ? SizedBox(
                                    height: 25,
                                  )
                                : SizedBox(),
                            widget.type == '2'
                                ? form(SpecializationController,
                                    'Specialization', TextInputType.text)
                                : SizedBox(),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Gender: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      activeColor: Color(ColorP),
                                      value: "Female",
                                      groupValue: maleOrFemale,
                                      onChanged: (value) {
                                        setState(() {
                                          maleOrFemale = value;
                                        });
                                      },
                                    ),
                                    Text('Female'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      activeColor: Color(ColorP),
                                      value: "male",
                                      groupValue: maleOrFemale,
                                      onChanged: (value) {
                                        setState(() {
                                          maleOrFemale = value;
                                        });
                                      },
                                    ),
                                    Text('male'),
                                  ],
                                ),
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (passwordController.text.length < 8) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        'Please enter a password of 8 characters',
                                        textAlign: TextAlign.center,
                                      ),
                                      backgroundColor: Colors.red,
                                    ));
                                  } else {
                                    widget.type == '1'
                                        ? _user_control.register(
                                            fnameController.text.toString(),
                                            lnameController.text.toString(),
                                            emailController.text.toLowerCase(),
                                            passwordController.text.toString(),
                                            maleOrFemale.toString(),
                                            dateController.text.toString(),
                                            phoneController.text.toString(),
                                            context)
                                        : _user_control.registerDoctor(
                                            fnameController.text.toString(),
                                            lnameController.text.toString(),
                                            emailController.text.toString(),
                                            passwordController.text.toString(),
                                            maleOrFemale.toString(),
                                            dateController.text.toString(),
                                            phoneController.text.toString(),
                                            QualificationController.text
                                                .toString(),
                                            SpecializationController.text
                                                .toString(),
                                            context);
                                  }
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontFamily: 'Cobe',
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                    primary: Color(ColorP))),
                            SizedBox(
                              height: hi / 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (BuildContext context) {
                                        return login(
                                          type: widget.type,
                                        );
                                      }));
                                    },
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                          // decoration: TextDecoration.underline,
                                          color: Color(ColorP),
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Cobe'),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }

  Column form(controllerText, String Title, TextInputType type) {
    return Column(
      children: [
        Container(
          height: 50,
          child: TextFormField(
            obscureText: type == TextInputType.visiblePassword ? true : false,
            keyboardType: type,
            cursorColor: Colors.black,
            controller: controllerText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(ColorP))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(ColorP))),
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
