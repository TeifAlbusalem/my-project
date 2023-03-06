import 'package:fitness/controls/user_control.dart';
import 'package:flutter/material.dart';
import '../Utils/Color.dart';
import '../screen/BMI.dart';
import 'Home_page_Doctor.dart';
import 'Values_BMI.dart';
import 'sign_up.dart';

class login extends StatefulWidget {
  String type;
  login({Key? key, required this.type}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController PassController = TextEditingController();
  bool _isHiddenPassword = true;

  User_Control _user_control = User_Control();
  bool isRemember = false;

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
                height: hi / 7,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                  color: Color.fromARGB(
                      255, 245, 245, 245), //rgba(245,245,245,255)
                ),
                height: hi - (hi / 6),
                width: wi,
                // padding: EdgeInsets.all(2),
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(children: [
                      Image.asset(
                        "assets/image/doctorpatient.jpg",
                        height: 170,
                      ),
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              //color: Colors.red,
                              margin: EdgeInsets.only(left: hi / 50),
                              height: 80,
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/image/logo.PNG",
                                //height: 250,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            form(emailController, 'email', TextInputType.name),
                            SizedBox(
                              height: hi / 50,
                            ),
                            form(PassController, 'password',
                                TextInputType.visiblePassword),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: hi / 50,
                      ),
                      button('Sign In'),
                      SizedBox(
                        height: hi / 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account ?",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return sgin_up(
                                    type: widget.type,
                                  );
                                }));
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    // decoration: TextDecoration.underline,
                                    color: Colors.red,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cobe'),
                              )),
                        ],
                      ),
                    ]),
                  ),
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
            // textAlign: TextAlign.center,
            obscureText: type == TextInputType.visiblePassword
                ? _isHiddenPassword
                : false,
            keyboardType: type,
            cursorColor: Colors.black,
            controller: controllerText,
            decoration: InputDecoration(
              suffixIcon: type != TextInputType.visiblePassword
                  ? SizedBox()
                  : InkWell(
                      onTap: () {
                        setState(() {
                          _isHiddenPassword = !_isHiddenPassword;
                        });
                      },
                      child: Icon(
                        _isHiddenPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Color(ColorP),
                      ),
                    ),
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

  Column button(String title) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              loginUser();
            },
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18,
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

  void loginUser() async {
    String _Phone = emailController.text.trim();
    String _password = PassController.text.trim();

    if (_Phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'EMAIL MUST BE REQUIRED',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
      ));
    } else if (_password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'PASSWORD MUST BE REQUIRED',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
      ));
    } else {
      if (widget.type == '1') {
        _user_control.login(emailController.text.toString(),
            PassController.text.toString(), context);
      } else {
        _user_control.loginDoctor(emailController.text.toString(),
            PassController.text.toString(), context);
      }
    }
  }
}
