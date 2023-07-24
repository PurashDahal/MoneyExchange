import 'package:flutter/material.dart';
import 'dart:io';
class DrawerCircleAvatar extends StatefulWidget {
  const DrawerCircleAvatar(this.ics,this.is_Visible,this.img);
final Icon ics;
final bool is_Visible;
final File? img;
  @override
  State<DrawerCircleAvatar> createState() => _DrawerCircleAvatarState();
}

class _DrawerCircleAvatarState extends State<DrawerCircleAvatar> {
  @override
  void initState() {
    
    super.initState();
  }
  void getIns(){}
  @override

  Widget build(BuildContext context) {
    return  CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 204, 203, 203),
                  backgroundImage: widget.img != null ? FileImage(widget.img!) :null,
                  radius: 60,
                 
                  
                );
  }
}