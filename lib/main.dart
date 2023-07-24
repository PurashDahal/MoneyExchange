// import 'dart:html';

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:moneyexchanger/Homepage/edit.dart';
import 'package:moneyexchanger/Homepage/home.dart';
// import 'package:moneyexchanger/Homepage/picker.dart';
import 'package:moneyexchanger/LogSign/login.dart';
import'package:moneyexchanger/LogSign/SignUp.dart';
import 'package:moneyexchanger/OtherScreen/Account.dart';
import 'package:moneyexchanger/OtherScreen/Report.dart';
import 'package:moneyexchanger/splashScreen.dart';
import 'package:moneyexchanger/Homepage/home.dart';
// import 'package:moneyexchanger/splashScreen.dart';
import 'OtherScreen/party.dart';
import 'package:moneyexchanger/OtherScreen/Report.dart';
void main(){
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Money Exchanger",
    theme: ThemeData(  
      primarySwatch: Colors.purple,

    ),home:MySplashScreen(),
    );
  }
}
