

// import 'package:flutter/material.dart';
// class InputField extends StatelessWidget {
//   final String? label;
//   final Icon? icon;
//   final  bool obtext;
//   InputField(this.label, this.icon,this.obtext);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width*0.9,
//       child: TextField( 
//         obscuringCharacter:"*",
//         obscureText:obtext,
//         cursorColor: Colors.white,
//         style: TextStyle(color: Colors.white.withOpacity(0.9)),
//         decoration: InputDecoration( 
          
//           hintText: label,
//           hintStyle: TextStyle( color: Colors.white),
//           prefixIcon: icon,
//           filled: true, 
//           fillColor: Colors.white.withOpacity(0.3),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(90.0),borderSide: BorderSide.none),
//           focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),borderSide: BorderSide.none)
//         ),
//       ),
//     );
//   }
// }