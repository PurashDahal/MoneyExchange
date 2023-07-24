import 'package:flutter/material.dart';

Color c1(){
return Color(0xffA021F1);
// return Colors.blueGrey; 
}
TextStyle t1(){
  return TextStyle(
    color: Colors.white.withOpacity(0.8),
    fontWeight: FontWeight.w800,
    fontSize: 23,
    fontFamily: 'Mainfont3'
    
  );
}

LinearGradient boxDecor() {
return  LinearGradient(colors: [Color(0xFFC82893),Color(0xFF9546C4),Color(0XFF5E61F4)]);}
 String fontFamily(){
  return'Mainfont3';
 }