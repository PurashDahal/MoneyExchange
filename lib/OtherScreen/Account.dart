import 'package:flutter/material.dart';
import 'package:moneyexchanger/Homepage/edit.dart';
import 'package:moneyexchanger/Homepage/home.dart';
import 'package:moneyexchanger/Homepage/utils.dart';
import 'package:moneyexchanger/LogSign/user.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  File? img;

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
    print(imageTemporary);
    setState(() {
      img = imageTemporary;
    });

    saveImagePath(imageTemporary.path);
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
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1,
              color: Colors.white,
            ),
            Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  gradient: boxDecor(),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.27,
              left: MediaQuery.of(context).size.width * 0.27,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: img != null ? FileImage(img!) : null,
                  radius: 90,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.06,
              left: MediaQuery.of(context).size.width * 0.06,
              child: IconButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MyFrontScreen();
                  }));
                },
                icon: Icon(Icons.arrow_back, size: 30, color: Colors.white),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.43,
              left: MediaQuery.of(context).size.width * 0.58,
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                        child: AlertDialog(
                          content: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 180,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      pickImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    child: Text("Take a photo"),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: 180,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      pickImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    child: Text("Choose from Gallery"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.add_a_photo,
                  color: Color.fromARGB(255, 44, 3, 225),
                  size: 40,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.53,
              left: 10,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.94,
                decoration: BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 70,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.person, color: Colors.blueGrey),
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "${Cred.fullName}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 70,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: [
                              Icon(Icons.phone, color: Colors.green),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "${Cred.userName}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 70,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.blue),
                              SizedBox(width: 10),
                              Text(
                                "${Cred.location}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 130,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return myProfileScreen();
                              }));
                            },
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
