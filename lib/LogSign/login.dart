import 'package:flutter/material.dart';
import 'package:moneyexchanger/Homepage/home.dart';
import 'package:moneyexchanger/LogSign/SignUp.dart';
import 'package:moneyexchanger/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moneyexchanger/LogSign/user.dart';

class MyLogIn extends StatefulWidget {
  const MyLogIn({super.key});

  @override
  State<MyLogIn> createState() => _MyLogInState();
}

class _MyLogInState extends State<MyLogIn> {
  // String emaill="dfhdkvf";
  // String pw="sidh";

  bool obs = true;
  bool isVisible = false;
  String cred = "";
  bool flag = true;
  String loc = "Enter Location";
  String txt = "Phone Number";
  String txt2 = "Enter Password";
  Icon ico = Icon(Icons.remove_red_eye, color: Colors.white.withOpacity(0.9));
  // Icon iconFir= Icon(Icons.remove_red_eye,color:Colors.white.withOpacity(0.9),);
  // Icon iconSec= Icon(Icons.javascript,color:Colors.white.withOpacity(0.9),);
  var email = TextEditingController();
  var password = TextEditingController();
  var location = TextEditingController();
  Icon icon2 = Icon(
    Icons.key,
    color: Colors.white.withOpacity(0.6),
  );
  Icon icon = Icon(
    Icons.person_outline,
    color: Colors.white.withOpacity(0.6),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFFC82893),
          Color(0xFF9546C4),
          Color(0XFF5E61F4)
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                Image.asset('images/newLogo.png'),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    controller: email,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    decoration: InputDecoration(
                        hintText: txt,
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90.0),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    // keyboardType: TextInputType.number,
                    controller: password,
                    obscuringCharacter: "*",
                    obscureText: obs,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                          child: ico,
                          onTap: () {
                            if (flag) {
                              obs = false;
                              ico = Icon(Icons.remove_red_eye,
                                  color: Colors.white.withOpacity(0.9));
                              flag = false;
                              setState(() {});
                            } else {
                              ico = Icon(
                                Icons.visibility_off,
                                color: Colors.white.withOpacity(0.9),
                              );
                              flag = true;

                              setState(() {
                                obs = true;
                              });
                            }
                          },
                        ),
                        hintText: txt2,
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: icon2,
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90.0),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    controller: location,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    decoration: InputDecoration(
                        hintText: loc,
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90.0),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Forget password ?",
                        style: TextStyle(color: Colors.cyanAccent),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Visibility(
                    visible: isVisible,
                    child: Text(
                      cred,
                      style:
                          TextStyle(color: Color.fromARGB(255, 238, 140, 133)),
                    )),
                SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent),
                        onPressed: () async {
                          SharedPreferences sc =
                              await SharedPreferences.getInstance();
                          sc.setBool(MySplashScreenState.KEY, true);
                          SharedPreferences sp1 =
                              await SharedPreferences.getInstance();
                          var val1 = sp1.getString(MySignUpState.KEY2);
                          SharedPreferences sp2 =
                              await SharedPreferences.getInstance();
                          var val2 = sp2.getString(MySignUpState.KEY3);
                          SharedPreferences sp3 =
                              await SharedPreferences.getInstance();
                          var val3 = sp3.getString(MySignUpState.KEY4);
                          print('${val1}');
                          if (email.text == "${Cred.userName}" &&
                              password.text == "${Cred.password}" &&
                              location.text == "${Cred.location}") {
                            cred = "";
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MyFrontScreen();
                            }));
                          } else {
                            isVisible = true;
                            cred = "Invalid Credentials";
                            setState(() {});
                          }
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      child: Text(
                        "Sign up here",
                        style: TextStyle(color: Colors.cyanAccent),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MySignUp();
                        }));
                      },
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
