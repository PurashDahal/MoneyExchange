import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moneyexchanger/Homepage/utils.dart';
import 'dart:convert';

class MySetting extends StatefulWidget {
  @override
  State<MySetting> createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  String? rate;
  final TextEditingController _textFieldController = TextEditingController();
  List<double> savedRates = [];
  bool isListVisible = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _loadRate();
    await _loadSavedRates();
  }

  Future<void> _loadRate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      rate = prefs.getString('rate') ?? '';
    });
  }

  Future<void> _saveRate(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('rate', value);
    setState(() {
      rate = value;
    });
  }

  Future<void> _loadSavedRates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedRatesString = prefs.getString('savedRates');

    if (savedRatesString != null) {
      List<dynamic> savedRatesList = jsonDecode(savedRatesString);
      savedRates = savedRatesList.map((rate) => double.parse(rate.toString())).toList();
    }
  }

  Future<void> _saveRates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedRatesString = jsonEncode(savedRates);
    await prefs.setString('savedRates', savedRatesString);
  }

  void rateDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        _textFieldController.text = rate ?? '';

        return AlertDialog(
          title: Text("Add value"),
          content: TextField(
            controller: _textFieldController,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                String value = _textFieldController.text;
                _saveRate(value);
                _saveRates();
                setState(() {
                  savedRates.add(double.parse(value));
                });
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void toggleListVisibility() {
    setState(() {
      isListVisible = !isListVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    gradient: boxDecor(),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(31),
                      bottomRight: Radius.circular(31),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 90),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "INR",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Mainfont3',
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: Center(
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 74, 8, 230),
                                      fontSize: 23,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 50,
                                width: 100,
                              )
                            ],
                          ),
                          InkWell(
                            onTap: rateDialog,
                            child: Column(
                              children: [
                                Text(
                                  "NPR",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mainfont3',
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: Center(
                                    child: Text(
                                      rate ?? '',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 74, 8, 230),
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 50,
                                  width: 100,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 120,
                        height: 40,
                        margin: EdgeInsets.only(top: 40),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            _saveRate(rate ?? '');
                            _saveRates();
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(
                              color: Color.fromARGB(255, 74, 8, 230),
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.12,
                  left: MediaQuery.of(context).size.width * 0.40,
                  child: Text(
                    "Settings",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(222),
                gradient: boxDecor(),
              ),
              width: MediaQuery.of(context).size.width*0.8,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 74, 8, 230),
                ),
                onPressed: toggleListVisibility,
                child: Text("View Past Rate"),
              ),
            ),
            SizedBox(height: 20),
            if (isListVisible && savedRates.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: savedRates.length,
                  itemBuilder: (BuildContext context, int index) {
                    final rateValue = savedRates[index];
                    final isLatest = index == savedRates.length - 1; 

                    return Card(
                      color:  Color.fromARGB(255, 74, 8, 230),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left:100),
                          child: Text(
                            rateValue.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: isLatest ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                        trailing: isLatest ? Text("new*",style: TextStyle(color: Colors.red),) : null,
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
