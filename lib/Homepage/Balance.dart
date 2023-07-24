import 'package:flutter/material.dart';
import 'package:moneyexchanger/Homepage/utils.dart';
import 'package:moneyexchanger/Homepage/balanceDetails.dart';
class BalancePage extends StatelessWidget {
  const BalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      margin: EdgeInsets.only(right: 7),
        height: MediaQuery.of(context).size.height*0.27,
        decoration: BoxDecoration(
          gradient: boxDecor(),
        // color: c1(),
         borderRadius: BorderRadius.circular(11)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Padding(
            padding: const EdgeInsets.only(left:4.0,right: 1.0),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Current Balance : ",style: t1(),)),
                      // SizedBox(width: 10,),
                      Container(
                        child: Text("${BalanceDetails.CurrentBalance}",style: t1(),),
                      )
                  
                    // Container(
                      
                    //   width: MediaQuery.of(context).size.width*0.4,
                    //   height: 30,
                    //   decoration: BoxDecoration(  
                    //   border: Border.all(width: 2,color: Colors.white),
                    //     borderRadius: BorderRadius.circular(5),
                    //   ),
                    // )
                  ],
              
                ),
                
              ),
            ),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            
              Column(
                children: [
                  Text("Balance In",style: t1(),),
                  SizedBox(height: 5,),
                  Text("${BalanceDetails.balanceIn}",style: t1(),),
            
                ],
              ),
                 SizedBox(width: 10,),
              Column(
                children: [
                  Text("Balance Out",style: t1(),),
                  SizedBox(height: 5,),
                  Text("${BalanceDetails.balanceOut}",style: t1(),),
            
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}