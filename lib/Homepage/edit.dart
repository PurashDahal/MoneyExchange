import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:moneyexchanger/Homepage/home.dart';
import 'package:moneyexchanger/Homepage/utils.dart';
import 'package:moneyexchanger/OtherScreen/Account.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'drawerText.dart';
import 'package:moneyexchanger/LogSign/user.dart';

class myProfileScreen extends StatefulWidget {
  @override
  State<myProfileScreen> createState() => _myProfileScreenState();
}

class _myProfileScreenState extends State<myProfileScreen> {
  File? img;
  final _formKey = GlobalKey<FormState>();

  bool is_Visible = true;
  bool visibility = false;
  var updateName = TextEditingController();
  var updateNumber = TextEditingController();
  var updateAddress = TextEditingController();

  Icon ics = Icon(Icons.person, size: 60, color: Colors.white);

  // Future pickImage(ImageSource source) async {
  //   final image = await ImagePicker().pickImage(source: source);
  //   SharedPreferences sc = await SharedPreferences.getInstance();
  //   sc.setString("image", image!.path);
  //   if (image == null) return;
  //   final imageTemporary = File(image.path);
  //   setState(() {
  //     this.img = imageTemporary;
  //   });
  // }

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   initialPicture();
  // }
  // void initialPicture() async {
  //   SharedPreferences sc = await SharedPreferences.getInstance();
  //   sc.get("image");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text("Edit profile"),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // Container(

              //   height: MediaQuery.of(context).size.height*0.1,

              //   width: MediaQuery.of(context).size.width,

              //   decoration: BoxDecoration(

              //     gradient: boxDecor(),

              //   ),

              // ),

              // SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width * 0.64,
                child: TextFormField(
                  maxLength: 20,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                  controller: updateName,
                  decoration: InputDecoration(
                    // enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(34),borderSide: BorderSide(color: Colors.purple)),
                    // focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(34),borderSide: BorderSide(color: Colors.purple)),

                    hintText: " Name",
                    // hintStyle: TextStyle(textBaseline: textBas)
                  ),
                ),
              ),
              // SizedBox(
              //   height: 5,
              // ),
              Container(
                width: MediaQuery.of(context).size.width * 0.64,
                child: TextFormField(
                  maxLength: 20,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                  controller: updateNumber,
                  decoration: InputDecoration(
                    // enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(34),borderSide: BorderSide(color: Colors.purple)),
                    // focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(34),borderSide: BorderSide(color: Colors.purple)),

                    hintText: "Number",
                    // hintStyle: TextStyle(textBaseline: textBas)
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.64,
                child: TextFormField(
                  maxLength: 20,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                  // key: _formKey,
                  controller: updateAddress,
                  decoration: InputDecoration(
                    // enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(34),borderSide: BorderSide(color: Colors.purple)),
                    // focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(34),borderSide: BorderSide(color: Colors.purple)),

                    hintText: " Address",
                    // hintStyle: TextStyle(textBaseline: textBas)
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  backgroundColor: Colors.black,
                                  content: Text(
                                    "Edited!",
                                  )));
                          print('true');
                          setState(() {
                            visibility = false;
                          });
                          Cred.fullName = updateName.text;
                          Cred.userName = updateNumber.text;
                          Cred.location = updateAddress.text;
                          SharedPreferences sc1 =
                              await SharedPreferences.getInstance();
                          SharedPreferences sc2 =
                              await SharedPreferences.getInstance();
                          SharedPreferences sc3 =
                              await SharedPreferences.getInstance();
                          sc1.setString("KEYVALUE", Cred.fullName);
                          sc2.setString("KEYVALUE", Cred.userName);
                          sc3.setString("KEYVALUE", Cred.location);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyAccount();
                          }));
                        }
                      },
                      child: Text("EDIT"))),
              SizedBox(
                height: 10,
              ),
              // Visibility(
              //   visible: visibility,
              //   child: Text(
              //     "All fields are required",
              //     style: TextStyle(color: Colors.red),
              //   ),
              // )
            ]),
          ),
        ),
      ),
    );
  }
}
