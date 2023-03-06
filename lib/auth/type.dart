import 'package:fitness/auth/log_in.dart';
import 'package:flutter/material.dart';
import '../Utils/Color.dart';
import 'Values_BMI.dart';
import 'sign_up.dart';

class type extends StatefulWidget {
  type({Key? key}) : super(key: key);

  @override
  State<type> createState() => _typeState();
}

class _typeState extends State<type> {
  TextEditingController emailController = TextEditingController();
  TextEditingController PassController = TextEditingController();
  bool _isHiddenPassword = true;

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
                height: hi / 6,
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image/ui.jpg"),
                    fit: BoxFit.cover,
                  ),
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
                    SizedBox(
                      height: hi / 15,
                    ),
                    Text(
                      'Enter As',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 24, 92, 148),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: hi / 3,
                    ),//sizedbox between Enter As and 2 button
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return login(
                              type: '1',
                            );
                          }));
                        },
                        child: Text(
                          'User',
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
                            primary: Color.fromARGB(255, 24, 92, 148))),
                    SizedBox(
                      height: hi / 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return login(
                              type: '2',
                            );
                          }));
                        },
                        child: Text(
                          'Doctor',
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
                            primary: Color.fromARGB(255, 24, 92, 148))),
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
}
