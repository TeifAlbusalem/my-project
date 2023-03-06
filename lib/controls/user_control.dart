import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

import '../Utils/general_URL.dart';
import '../auth/Home_page_Doctor.dart';
import '../screen/BMI.dart';

// ignore: camel_case_types
class User_Control {
  Future register(String fname, String lname, String email, String password,
      String gender, String bdate, String phone, context) async {
    print(password);
    var myUrl = Uri.parse("$serverUrl/register_client");
    final response = await http.post(myUrl, body: {
      "fname": fname,
      "lname": lname,
      "password": password,
      'email': email,
      'gender': gender,
      'bdate': bdate,
      'phone': phone,
    });
    print(myUrl);
    print(response.statusCode);
    print(response.body);
    if (json.decode(response.body)['status'] == "1") {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Done!',
        // btnOkOnPress: () {},
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'ERROR',
        // btnOkOnPress: () {},
      ).show();
    }
  }

  Future login(String email, String password, context) async {
    var myUrl = Uri.parse("$serverUrl/login_client");
    final response = await http.post(myUrl, body: {
      "email": email,
      "password": password,
    });
    print(myUrl);
    print(response.statusCode);
    print(response.body);
    if (json.decode(response.body)['status'] == "1") {
      _save(json.decode(response.body)['data']['id'].toString());

      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return BMI();
      }));
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'ERROR',
        // btnOkOnPress: () {},
      ).show();
    }
  }

  Future registerDoctor(
      String fname,
      String lname,
      String email,
      String password,
      String gender,
      String bdate,
      String phone,
      String qualification,
      String specialization,
      context) async {
    print(password);
    var myUrl = Uri.parse("$serverUrl/register_doctor");
    final response = await http.post(myUrl, body: {
      "phone": phone,
      "password": password,
      "email": email,
      "fname": fname,
      'lname': lname,
      'qualification': qualification,
      'specialization': specialization,
      'gender': gender,
      'bdate': bdate
    });
    print(myUrl);
    print(response.statusCode);
    print(response.body);
    if (json.decode(response.body)['status'] == "1") {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Done!',
        // btnOkOnPress: () {},
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'ERROR',
        // btnOkOnPress: () {},
      ).show();
    }
  }

  Future loginDoctor(String email, String password, context) async {
    var myUrl = Uri.parse("$serverUrl/login_doctor");
    final response = await http.post(myUrl, body: {
      "email": email,
      "password": password,
    });
    print(myUrl);
    print(response.statusCode);
    print(response.body);
    if (json.decode(response.body)['status'] == "1") {
      _save(json.decode(response.body)['data']['id'].toString());

      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return Home_page_Doctor();
      }));
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'ERROR',
        // btnOkOnPress: () {},
      ).show();
    }
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }
}
