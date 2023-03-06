import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Utils/Color.dart';
import '../controls/control.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});
  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  Control _controller = Control();
  String doctorname = "";
  String sendmessage = "";
  String recivedmessage = "";
  bool changecolor = false;
  TextEditingController message = TextEditingController();
  String resultBot = '';
  @override
  void initState() {
    sendmessage = "old message if exist";
    //هون لازم نحط شرط انو اذا فيه رسالة قديمة كاتبها تنعرض بالاول
    recivedmessage = "text came from backend";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double hi = MediaQuery.of(context).size.height;
    double wi = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Column(
          children: [
            Container(
                height: hi / 8, child: Image.asset("assets/image/sick.png")),
            SizedBox(
              height: hi / 30,
            ),
            SizedBox(
              height: hi / 30,
            ),
            Container(
              height: hi / 2,
              width: wi,
              padding: EdgeInsets.all(10),
              color: Colors.grey[200],
              child: Column(
                children: [
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: wi / 2.3,
                  //     ),
                  //     Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10),
                  //           color: changecolor ? Color(ColorP) : null,
                  //         ),
                  //         width: wi / 3,
                  //         padding: EdgeInsets.symmetric(horizontal: 15),
                  //         alignment: Alignment.topLeft,
                  //         child: Flexible(
                  //           child: Text(
                  //             overflow: TextOverflow.clip,
                  //             sendmessage,
                  //             style: TextStyle(color: Colors.black),
                  //           ),
                  //         )),
                  //     SizedBox(
                  //       width: wi / 30,
                  //     ),
                  //     Container(
                  //       padding: EdgeInsets.all(3),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20),
                  //         color: Color(ColorP),
                  //       ),
                  //       child: Text("me"),
                  //     )
                  //   ],
                  // ),

                  Container(
                      width: wi,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Center(
                        child: Text(
                          resultBot,
                          style: TextStyle(color: Colors.black),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: hi / 15,
            ),
            Container(
                child: form(message, "enter message here", TextInputType.text)),
            MaterialButton(
              child: Container(
                width: wi / 4.9,
                child: Row(
                  children: [
                    Text("send"),
                    SizedBox(
                      width: wi / 20,
                    ),
                    Icon(Icons.send)
                  ],
                ),
              ),
              color: Color(ColorP),
              onPressed: () {
                _controller.chatboot(message.text, context).whenComplete(() {
                  setState(() {
                    resultBot = _controller.resultBot.toString();
                  });
                });
              },
            )
          ],
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
            keyboardType: type,
            cursorColor: Colors.white,
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
              hintStyle: TextStyle(color: Colors.black, fontFamily: 'Cobe'),
            ),
          ),
        ),
      ],
    );
  }
}
