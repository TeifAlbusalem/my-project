import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fitness/models/consultation_Model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

import '../Utils/general_URL.dart';
import '../auth/Values_BMI.dart';
import '../models/History_doctor_Model.dart';

// ignore: camel_case_types
class Control {
  bool status = false;
  String? result;
  String? resultBot;
  Future calc_bmi(String height, String weight, String bloodpressure,
      String pressure, String temprature, context) async {
    print('calc_bmi');
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final user_id = prefs.get(key);
    String myUrl = "$serverUrl/calc_bmi";
    http.Response response = await http.post(Uri.parse(myUrl), body: {
      'id': user_id,
      'height': height,
      'weight': weight,
      'bloodpressure': bloodpressure,
      'pressure': pressure,
      'temprature': temprature,
    });
    print(myUrl);
    print(response.statusCode);
    print(response.body);

    if (json.decode(response.body)['status'] == "1") {
      print("Parameters are saved");
      bool isnormal =
          json.decode(response.body)['data']['normal'] == 0 ? false : true;
      String id = json.decode(response.body)['data']['id'].toString();

      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return Values_BMI(
          isNormal: isnormal,
          id: id,
        );
      }));
    } else {
      print(response.body);
      // throw "Error While getting Properties";
    }
  }

  Future add_consultation(String content, context) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final user_id = prefs.get(key);
    String myUrl = "$serverUrl/add_consultation";

    http.Response response = await http.post(Uri.parse(myUrl), body: {
      'client_id': user_id,
      'title': 't',
      'content': content,
      'doctor_id': '2',
    });
    print(myUrl);
    print(response.statusCode);
    print(response.body);

    if (json.decode(response.body)['status'] == "1") {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.bottomSlide,
        title: 'Success',
        // btnOkOnPress: () {},
      ).show();
    } else {
      print(response.body);
      // throw "Error While getting Properties";
    }
  }

  Future add_reply(String reply, String ids, context) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final user_id = prefs.get(key);
    String myUrl = "$serverUrl/add_reply";

    print(ids);
    print(reply);
    http.Response response = await http.post(Uri.parse(myUrl), body: {
      'id': ids,
      'reply': reply,
    });
    print(myUrl);
    print(response.statusCode);
    print(response.body);

    if (json.decode(response.body)['status'] == "1") {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.bottomSlide,
        title: 'Success',
        // btnOkOnPress: () {},
      ).show();
    } else {
      print(response.body);
      // throw "Error While getting Properties";
    }
  }

  Future<List<consultation_Model>?> get_consultations() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final user_id = prefs.get(key);
    String myUrl = "$serverUrl/get_consultations";
    http.Response response = await http.get(Uri.parse(myUrl));
    print(myUrl);
    print(response.statusCode);
    print(response.body);

    if (json.decode(response.body)['status'] == "1") {
      List body = jsonDecode(response.body)['data'];

      try {
        List<consultation_Model> orders = body
            .map(
              (dynamic item) => consultation_Model.fromJson(item),
            )
            .toList();
        return orders;
      } catch (error) {
        print(error);

        return null;
      }
    } else {
      print(response.body);
      // throw "Error While getting Properties";
    }
  }

  Future<List<consultation_Model>?> get_consultation() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final user_id = prefs.get(key);
    String myUrl = "$serverUrl/get_client_consultations";
    http.Response response =
        await http.post(Uri.parse(myUrl), body: {'client_id': user_id});
    print(myUrl);
    print(response.statusCode);
    print(response.body);

    if (json.decode(response.body)['status'] == "1") {
      List body = jsonDecode(response.body)['data'];

      try {
        List<consultation_Model> orders = body
            .map(
              (dynamic item) => consultation_Model.fromJson(item),
            )
            .toList();
        return orders;
      } catch (error) {
        print(error);

        return null;
      }
    } else {
      print(response.body);
      // throw "Error While getting Properties";
    }
  }

  Future<List<History_doctor_Model>?> get_doctor_consultations() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final id = prefs.get(key);
    String myUrl = "$serverUrl/get_doctor_consultations";
    http.Response response = await http.post(Uri.parse(myUrl), body: {
      'doctor_id': id,
    });
    print(myUrl);
    print(response.statusCode);
    print(response.body);

    if (json.decode(response.body)['status'] == "1") {
      List body = jsonDecode(response.body)['data'];

      try {
        List<History_doctor_Model> orders = body
            .map(
              (dynamic item) => History_doctor_Model.fromJson(item),
            )
            .toList();
        return orders;
      } catch (error) {
        print(error);

        return null;
      }
    } else {
      print(response.body);
      // throw "Error While getting Properties";
    }
  }

  Future<List<consultation_Model>?> chatboot(String message, context) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final id = prefs.get(key);
    String myUrl = "$serverUrl/add_message";
    http.Response response = await http.post(Uri.parse(myUrl), body: {
      'content': message,
      'client_id': id,
    });
    print(myUrl);
    print(response.statusCode);
    print(response.body);

    if (json.decode(response.body)['status'] == "1") {
      resultBot = jsonDecode(response.body)['data']["result"].toString();
    } else {
      print(response.body);
      // throw "Error While getting Properties";
    }
  }
  // Future<List<consultation_Model>?> get_consultation() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final user_id = prefs.get(key);
  //   String myUrl = "$serverUrl/get_consultation";
  //   http.Response response = await http.post(Uri.parse(myUrl), body: {
  //     'id': user_id,
  //   });
  //   print(myUrl);
  //   print(response.statusCode);
  //   print(response.body);

  //   if (json.decode(response.body)['status'] == "1") {
  //     List body = jsonDecode(response.body)['data'];
  //     try {
  //       List<consultation_Model> orders = body
  //           .map(
  //             (dynamic item) => consultation_Model.fromJson(item),
  //           )
  //           .toList();
  //       return orders;
  //     } catch (error) {
  //       print(error);

  //       return null;
  //     }
  //   } else {
  //     print(response.body);
  //     // throw "Error While getting Properties";
  //   }
  // }
}
