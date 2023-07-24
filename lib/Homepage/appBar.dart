import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneyexchanger/Homepage/utils.dart';
import 'package:moneyexchanger/OtherScreen/Account.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  
   final Shader linearGradient = LinearGradient(
      colors: <Color>[Colors.purple, Colors.pink,Color(0xFF5E61F4)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)
    );
  Widget build(BuildContext context) {
    return           Container(
      decoration: BoxDecoration(  
        // gradient: boxDecor()
      ),
            
            margin: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                IconButton(onPressed: (){
                  Scaffold.of(context).openDrawer();
                }, icon:
                Icon(Icons.menu),iconSize: 50,color:Colors.black, ),
                // Container(
                //   margin: EdgeInsets.only(top: 10),
                //   width: 220,
                //   child:Image.asset('images/nobg.png',fit: BoxFit.cover),
                // ),
                Container(
                  child:Row(
                    children: [
                      RichText(text: TextSpan(text: "Money",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,foreground: Paint()..shader=linearGradient))),
                      // Text("Money",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,),),
                      SizedBox(width: 3,),
                      Container(
                        decoration: BoxDecoration(  
                          gradient: boxDecor(),
                        borderRadius:BorderRadius.circular(11) ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("Exchanger",style: TextStyle(color:Colors.white,fontSize:20,fontWeight: FontWeight.w600),),
                        ))
                    ],
                  )
                 ),
                 CircleAvatar(
                  backgroundColor: Colors.white,
                  
                  // foregroundColor: Colors.white,
                  radius: 20,
                   child: Container(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                      return MyAccount();
                    }));
                      },
                      child: FaIcon(FontAwesomeIcons.user,color: Colors.black,)),
                   ),
                 )
              ],
            ),
          );
  }
}