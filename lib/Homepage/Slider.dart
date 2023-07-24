import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

class MySliderScreen extends StatefulWidget {
  const MySliderScreen({super.key});

  @override
  State<MySliderScreen> createState() => _MySliderScreenState();
}

class _MySliderScreenState extends State<MySliderScreen> {
  List imageList=[
    {"id":1,"image-src":"images/me1.jpg",},
    {"id":2,"image-src":"images/me2.jpg"},
    {"id":3,"image-src":"images/me3.jpg"},
    {"id":4,"image-src":"images/me4.jpg"},
    
  
  ];
final CarouselController carouselController=CarouselController();
int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 250,
      width: MediaQuery.of(context).size.width*1,
      // decoration: BoxDecoration(border: Border.all(width: 2)),
      child: 
    CarouselSlider(items: imageList.map(
      (e) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
      
      decoration: BoxDecoration(
      // border: Border.all(width: 2,color: Colors.b)
        ),
      width: MediaQuery.of(context).size.width*0.9,
      
      
      
      child: Container(
        // height: double.infinit,
        width: double.infinity,
        child: Image.asset(
        
        e['image-src'],
        fit: BoxFit.fill,
        
             
            ),
      ),
          ),
          
        ],
      )
    ).toList(),
    carouselController: carouselController,
     options: CarouselOptions(
      scrollPhysics: const BouncingScrollPhysics(),
      autoPlay: true,
      aspectRatio: 1080/750,
      viewportFraction: 1,
      onPageChanged: (index,reason){
    setState(() {
      
      currentIndex=index;
    });
      }
     )),
 
        
      
    );
  }
}

