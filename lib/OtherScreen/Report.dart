import 'package:flutter/material.dart';
import 'package:moneyexchanger/Homepage/utils.dart';
import 'package:moneyexchanger/Homepage/balanceDetails.dart';

class MyReport extends StatefulWidget {
  const MyReport({super.key});

  @override
  State<MyReport> createState() => _MyReportState();
}

class _MyReportState extends State<MyReport>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation circleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation = Tween(begin: 180.0, end: 190.0).animate(controller);
    controller.addListener(() {
      // print(animation.value);
      setState(() {});
    });
    controller.repeat(reverse: true);
  }

  TextStyle t3() {
    return TextStyle(color: Colors.white, fontWeight: FontWeight.w600);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void statusCalculation(int balIn, int balOut) {
    if (balIn > balOut) {
      var st = balIn - balOut;
      (st / balIn) * 100;
    } else {
      var st2 = balOut - balIn;
      (st2 / balIn) * 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            // Navigator.pop(context);
          },
        ),
        title: Text("Report"),
        backgroundColor: Color.fromARGB(255, 39, 36, 192),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 230,
              child: Container(
                height: animation.value,
                width: animation.value,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: boxDecor(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Current Balance",
                      style: t3(),
                    ),
                    Text(
                      "${BalanceDetails.CurrentBalance}",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Container(
                  child: Column(children: [
                    SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.58,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(255, 39, 36, 192),
                        ),
                        // color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SizedBox(height: 5,),
                                Text(
                                  "Current Balance ",
                                  style: TextStyle(
                                      fontFamily: 'MainFont3',
                                      fontSize: 36,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 10),
                                Center(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(23)),
                                        height: 50,
                                        width: 170,
                                        child: Center(
                                            child: Text(
                                          "${BalanceDetails.CurrentBalance}",
                                          style: TextStyle(
                                              fontFamily: 'Mainfont3',
                                              color: Color.fromARGB(
                                                  255, 39, 36, 192),
                                              fontSize: 25),
                                        )))),
                                SizedBox(
                                  height: 70,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        width: 150,
                                        child: Text(
                                          "Balance In :",
                                          style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.white,
                                              fontFamily: fontFamily()),
                                        )),
                                    // SizedBox(width: 10,),
                                    Container(
                                      // color: Colors.white,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Colors.white),
                                      height: 40,
                                      width: 120,
                                      child: Center(
                                          child: Text(
                                        '${BalanceDetails.balanceIn}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        width: 150,
                                        child: Text(
                                          "Balance Out :",
                                          style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.white,
                                              fontFamily: fontFamily()),
                                        )),
                                    Container(
                                      // color: Colors.white,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Colors.white),
                                      height: 40,
                                      width: 120,
                                      child: Center(
                                          child: Text(
                                        '${BalanceDetails.balanceOut}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                    )
                                  ],
                                ),

                                SizedBox(
                                  height: 35,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        width: 150,
                                        child: Text(
                                          "Status :",
                                          style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.white,
                                              fontFamily: fontFamily()),
                                        )),
                                    Container(
                                      // color: Colors.white,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Colors.white),
                                      height: 40,
                                      width: 120,
                                      child: Center(
                                        child: int.parse(
                                                    BalanceDetails.balanceOut) >
                                                int.parse(
                                                    BalanceDetails.balanceIn)
                                            ? Text(
                                                "${(((int.parse(BalanceDetails.balanceOut) - int.parse(BalanceDetails.balanceIn))) / int.parse(BalanceDetails.balanceIn) * 100).toStringAsFixed(1)}%",
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )
                                            : Text(
                                                "${(((int.parse(BalanceDetails.balanceOut) - int.parse(BalanceDetails.balanceIn)) / int.parse(BalanceDetails.balanceIn)) * 100).toStringAsFixed(1)}%",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                      ),
                                    )
                                  ],
                                ),
                              ]),
                        ),
                      ),

                      // GridView.count(crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 3,
                      // children: [
                      //   Container(
                      //     color: Colors.red,
                      //   )
                      // ],
                      // )
                    )
                  ]),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
