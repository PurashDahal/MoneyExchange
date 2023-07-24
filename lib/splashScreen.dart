import 'package:flutter/material.dart';
import 'package:moneyexchanger/Homepage/home.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moneyexchanger/Homepage/utils.dart';
import 'package:moneyexchanger/LogSign/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => MySplashScreenState();
}

class MySplashScreenState extends State<MySplashScreen> {
   static const KEY="status";
  
void navigateTo()async{
  SharedPreferences sc=await SharedPreferences.getInstance();

  var isLoggedIn=sc.getBool(KEY);
   Timer(Duration(seconds: 3),(){
    if(isLoggedIn!=null){
      if(isLoggedIn){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
  return MyFrontScreen();
}));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
  return MyLogIn();
}));
      }
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
  return MyLogIn();
}));
    }

    });
}
  void initState() {
    // TODO: implement initState
    super.initState();
    
    navigateTo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: boxDecor()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            
            child: Image.asset('images/newLogo.png'),
          ),
          Container(
            
            child: Image.asset('images/nobg.png'),
          ),
          SizedBox(height: 30,),
          
           SpinKitFoldingCube(
  color: Colors.white,
  size: 50.0,
),
        // CircularProgressIndicator(
        //   color: Colors.white,
          
        // )
        ]),
      ),
    );
  }
}