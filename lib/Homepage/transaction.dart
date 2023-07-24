import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {

    List trans=[
      {
        "image":"images/usa.png",
        // "id":"1233",
        "text":"America",
        "Currency":"USD",
        "status":"+2.00%",
        "Value":"130.89"
      },
        {
        "image":"images/uk.png",
        // "id":"1233",
        "text":"England",
        "Currency":"GDP",
        "status":"-1.90%",
        "Value":"167.85"
      },
      {
        "image":"images/fin.png",
        // "id":"1233",
        "text":"Finland",
        "Currency":"Euro",
        "status":"+4.00%",
        "Value":"143.53"
      },
      
      {
        "image":"images/canada.png",
        // "id":"1233",
        "text":"Canada",
        "Currency":"CAD",
        "status":"+2.00%",
        "Value":"98.95"
      },
        {
        "image":"images/aus.png",
        // "id":"1233",
        "text":"Australia",
        "Currency":"AUD",
        "status":"-1.20%",
        "Value":"89.93"
      },
       
    ];
    return Container(
      decoration: BoxDecoration(
        

      ),
    
      // width: MediaQuery.of(context).size.height*0.6,
      width: 400,
      height: 650,
      child: Container(
      // decoration: BoxDecoration(border: Border.all(width: 2)),
        // width: 20,
         
        child: ListView(
          // shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: trans.map((e) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
        
          height: 100,
          // width: MediaQuery.of(context).size.width*0.8,
          // margin: EdgeInsets.only(top: ),
          child:   Card(
          color: Color.fromARGB(255, 248, 248, 248),
            elevation: 6,
          
            child: Row(
              
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          // SizedBox(width: 10,),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(e['image'],),
              
        
              // child: Image.asset(e['image'],width: 80,fit: BoxFit.cover,),
            ),
            // SizedBox(width: 20,),
            Container(
              margin: EdgeInsets.only(top:24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(e['text'],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                  SizedBox(height: 3,),
                  Text(e['Currency'],style: TextStyle(color: Colors.green,fontWeight: FontWeight.w400,fontSize: 15)),
                ],
              ),
            ),
          
          Container(
            // margin: EdgeInsets.only(left: ),
            child: Text(e['Value'],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.blue),),
          )
          ],
          
            ),),
        ),
      );
          }).toList(),
        ),
      ),
      
    );
  }
}