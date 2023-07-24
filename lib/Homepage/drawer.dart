import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moneyexchanger/Homepage/DrawerCircleAvatar.dart';
import 'package:moneyexchanger/Homepage/drawerText.dart';
import 'package:moneyexchanger/Homepage/edit.dart';
import 'package:moneyexchanger/Homepage/home.dart';
import 'package:moneyexchanger/LogSign/login.dart';
import 'package:moneyexchanger/OtherScreen/Account.dart';
import 'package:moneyexchanger/OtherScreen/Customer.dart';
import 'package:moneyexchanger/OtherScreen/Report.dart';
import 'package:moneyexchanger/OtherScreen/party.dart';
import 'package:moneyexchanger/OtherScreen/setting.dart' as OtherScreenSetting;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moneyexchanger/splashScreen.dart';
import 'dart:io';
import 'utils.dart';
import 'package:moneyexchanger/LogSign/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  File? img;
  Icon ics = Icon(
    Icons.person,
    size: 60,
    color: const Color.fromARGB(255, 46, 46, 46),
  );
  bool is_Visible = true;

  Future<void> saveImagePath(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('imagePath', imagePath);
  }

  Future<String?> getImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('imagePath');
  }

  Future<void> pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      img = imageTemporary;
    });

    saveImagePath(imageTemporary.path);
  }

  Future<void> clearImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('imagePath');
  }

  @override
  void initState() {
    super.initState();
    getImagePath().then((path) {
      if (path != null) {
        setState(() {
          img = File(path);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List options = [
      {
        "name": "Party",
        "icon": "images/supplier.png",
      },
      {
        "name": "Customer",
        "icon": "images/customer.png",
      },
      {
        "name": "Report",
        "icon": "images/report.png",
      },
      {
        "name": "Settings",
        "icon": "images/setting.png",
      },
      {
        "name": "My account",
        "icon": "images/myac.png",
      },
      {
        "name": "Log Out",
        "icon": "images/logout.png",
      },
    ];

    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.height * 0.4,
        color: Colors.white,
        child: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          DrawerCircleAvatar(ics, is_Visible, img),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${Cred.fullName}",
                        style: t1(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${Cred.location}",
                        style: t1(),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 5),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    gradient: boxDecor(),
                  ),
                ),
                Container(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          if (index == 0) {
                            print("object");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return EmptyScreen();
                              }),
                            );
                          }
                          if (index == 4) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return MyAccount();
                              }),
                            );
                          }
                          if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return EmptyScreen2();
                              }),
                            );
                          }
                          if (index == 2) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MyReport();
                            }));
                          }

                          if (index == 5) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Container(
                                  child: AlertDialog(
                                    title: Text("Are you sure?"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          SharedPreferences sc =
                                              await SharedPreferences
                                                  .getInstance();
                                          sc.setBool(
                                              MySplashScreenState.KEY, false);
                                          clearImagePath(); // Clear the image path from shared preference
                                          setState(() {
                                            img =
                                                null; // Remove the image from the screen
                                          });
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return MyLogIn();
                                          }));
                                        },
                                        child: Text("Yes"),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("No"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                          if (index == 3) {
                            print("object");
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return OtherScreenSetting.MySetting();
                            }));
                          }
                        },
                        child: Container(
                          height: 100,
                          margin: EdgeInsets.only(top: 2),
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    child: Container(
                                      width: 50,
                                      child:
                                          Image.asset(options[index]['icon']),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    options[index]['name'],
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
