import 'package:flutter/material.dart';
import 'package:moneyexchanger/Homepage/home.dart';
import 'package:moneyexchanger/LogSign/login.dart';
import 'package:moneyexchanger/LogSign/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moneyexchanger/splashScreen.dart';


class MySignUp extends StatefulWidget {
  const MySignUp({super.key});

  @override
  State<MySignUp> createState() => MySignUpState();
}

class MySignUpState extends State<MySignUp> {
  static const KEY2="userCredential";
  static const KEY3="userCredential";
  static const KEY4="userCredential";

  // String emaill="dfhdkvf";
  // String pw="sidh";
  var location=TextEditingController();
  bool obs=true;
  bool obs2=true;
  bool isVisible=false;
  String cred="";
  bool flag=true;
  String txt="Full Name";
  String txt2="Enter Password";
  Icon ico2=Icon(Icons.remove_red_eye,color:Colors.white.withOpacity(0.9));
  Icon ico=Icon(Icons.remove_red_eye,color:Colors.white.withOpacity(0.9));
  // Icon iconFir= Icon(Icons.remove_red_eye,color:Colors.white.withOpacity(0.9),);
  // Icon iconSec= Icon(Icons.javascript,color:Colors.white.withOpacity(0.9),);
  var email=TextEditingController();
  var name=TextEditingController();
  var confirmPassword=TextEditingController();
  var password=TextEditingController();
Icon icon2=Icon(Icons.key,color: Colors.white.withOpacity(0.6),);
  Icon icon=Icon(Icons.person_outline,color: Colors.white.withOpacity(0.6),);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: double.infinity,
         decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFFC82893),Color(0xFF9546C4),Color(0XFF5E61F4)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
            SizedBox(height: 30,),
           Image.asset('images/newLogo.png'),
            SizedBox(height: 10,),
            
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              child: TextField( 
          controller: email,
          
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white.withOpacity(0.9)),
          decoration: InputDecoration( 
          
          hintText: txt,
          hintStyle: TextStyle( color: Colors.white),
          prefixIcon: icon,
          filled: true, 
          fillColor: Colors.white.withOpacity(0.3),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(90.0),borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),borderSide: BorderSide.none)
          ),
              ),
            ),
             SizedBox(height: 10,),
            
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              child: TextField( 
          controller: name,
          
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white.withOpacity(0.9)),
          decoration: InputDecoration( 
          
          hintText: "Phone Number",
          hintStyle: TextStyle( color: Colors.white),
          prefixIcon: Icon(Icons.phone,color: Colors.white,),
          filled: true, 
          fillColor: Colors.white.withOpacity(0.3),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(90.0),borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),borderSide: BorderSide.none)
          ),
              ),
            ),
            
            
            SizedBox(height: 10,),
            
          Container(
              width: MediaQuery.of(context).size.width*0.9,
              child: TextField( 
          
          controller: password,
          obscuringCharacter:"*",
          obscureText:obs,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white.withOpacity(0.9)),
          decoration: InputDecoration( 
          suffixIcon: InkWell(
            child:ico,
            onTap: (){
              if(flag){
                obs=false;
          ico=Icon(Icons.remove_red_eye,color:Colors.white.withOpacity(0.9));
          flag=false;
          setState(() {
          
          });
            
              }
              else{
                ico=Icon(Icons.visibility_off,color:Colors.white.withOpacity(0.9),);
                flag=true;
                
                setState(() {
                  obs=true;
                });
              }
          },
            ),
          hintText: txt2,
          hintStyle: TextStyle( color: Colors.white),
          prefixIcon: icon2,
          filled: true, 
          fillColor: Colors.white.withOpacity(0.3),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(90.0),borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),borderSide: BorderSide.none)
          ),
              ),
            ),
            SizedBox(height: 10,),
             Container(
              width: MediaQuery.of(context).size.width*0.9,
              child: TextField( 
          
          controller: confirmPassword,
          obscuringCharacter:"*",
          obscureText:obs2,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white.withOpacity(0.9)),
          decoration: InputDecoration( 
          suffixIcon: InkWell(
            child:ico2,
            onTap: (){
              if(flag){
                obs2=false;
          ico2=Icon(Icons.remove_red_eye,color:Colors.white.withOpacity(0.9));
          flag=false;
          setState(() {
          
          });
            
              }
              else{
                ico2=Icon(Icons.visibility_off,color:Colors.white.withOpacity(0.9),);
                flag=true;
                
                setState(() {
                  obs2=true;
                });
              }
          },
            ),
          hintText: "Confirm Password",
          hintStyle: TextStyle( color: Colors.white),
          prefixIcon: icon2,
          filled: true, 
          fillColor: Colors.white.withOpacity(0.3),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(90.0),borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),borderSide: BorderSide.none)
          ),
              ),
            ),
            SizedBox(height: 10,),
           Container(
              width: MediaQuery.of(context).size.width*0.9,
              child: TextField( 
          controller:location,
          
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white.withOpacity(0.9)),
          decoration: InputDecoration( 
          
          hintText: "Location",
          hintStyle: TextStyle( color: Colors.white),
          prefixIcon: Icon(Icons.location_on,color: Colors.white,),
          filled: true, 
          fillColor: Colors.white.withOpacity(0.3),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(90.0),borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),borderSide: BorderSide.none)
          ),
              ),
            ),
          
            SizedBox(height: 15,),
            ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.width*0.15,
                
                decoration: BoxDecoration(   
                  
                ),
                child: ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.blueAccent
                  ),
                  onPressed: ()async{
                    print("${Cred.userName}");
                    Cred.userName=name.text.toString(); // phoneNumber
                    Cred.password=password.text.toString();
                    Cred.fullName=email.text.toString();
                    Cred.location=location.text.toString();
                  
                    SharedPreferences sp1=await SharedPreferences.getInstance();
                    SharedPreferences sp2=await SharedPreferences.getInstance();
                    SharedPreferences sp3=await SharedPreferences.getInstance();
                     SharedPreferences sc= await SharedPreferences.getInstance();

                    sp1.setString(KEY2, Cred.userName);
                    sp2.setString(KEY3, Cred.password);
                    sp3.setString(KEY4, Cred.location);  
                    sc.setBool(MySplashScreenState.KEY, true);

                    Navigator.push(context, MaterialPageRoute(builder: (context){

                      return MyFrontScreen();
                    }));
                  }, child: Text("Sign Up",style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            ),)),
              ),
            ),
            SizedBox(height: 15,),
          
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ",style: TextStyle(color: Colors.white),),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return MyLogIn();
                    }));
                  },
                  child: Text("Log In here",style: TextStyle(color: Colors.cyanAccent),))
              ],
            ),
          
          
          ]),
        ),
      ),
      
    );
  }
  
}



