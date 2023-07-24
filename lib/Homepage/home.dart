import 'package:flutter/material.dart';
import 'package:moneyexchanger/Homepage/Balance.dart';
import 'package:moneyexchanger/Homepage/Slider.dart';
import 'package:moneyexchanger/Homepage/drawer.dart';
import 'package:moneyexchanger/Homepage/transaction.dart';
// import 'package:moneyexchanger/Homepage/utils.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'appBar.dart';

class MyFrontScreen extends StatelessWidget {
  const MyFrontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Colors.purple, Colors.pink,Color(0xFF5E61F4)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)
    );

    return Scaffold(
      drawer: MyDrawer(),
      body: Container(
        height: double.infinity, 
        color: Colors.white70,
        child: SingleChildScrollView(
          child: Container( 
            // height: double.infinity, 
            child: Column(children: [
           MyAppBar(),
          //  SizedBox(height:   20,),
      BalancePage(),
      // Text("data"),
          //  SizedBox(height:   2,),
           MySliderScreen(),
           RichText(
        text: TextSpan(
          text: "Today's Rate",
          style:TextStyle(fontSize: 26,fontWeight: FontWeight.bold,foreground: Paint()..shader=linearGradient),
          
        ),
             ),
          //  SizedBox(height: 10,),
           Transaction()
           
           
      
           
            ]),
          ),
        ),
      ),
    );
  }
}