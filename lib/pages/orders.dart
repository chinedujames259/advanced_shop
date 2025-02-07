//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with TickerProviderStateMixin{
  List<String>assets =[
    'assets/9huvf9.webp',
    'assets/Convert-Your-Image-Into-GIF.webp',
    'assets/realistic-image.webp',
    'assets/gamer-5979004_1280.jpg',
    'assets/panther-7600667_1280.jpg'
   
    ];
  final color = [
    Colors.red,
    Colors.amber,
    Colors.teal,
    Colors.blueGrey,
    Colors.blue,
  ];
  int currentindex =0;
  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
           const SizedBox(
            height: 30,
           ),
           SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemCount: assets.length,
              padEnds: false,
              pageSnapping: false,
              physics: BouncingScrollPhysics(),
              reverse: true,
              controller: PageController(
                initialPage: 3,
                viewportFraction: 0.7
              ),
              
              itemBuilder: (contex,index){
              return Container(
                margin: const EdgeInsets.all(8),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  //color: color[index],
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Image.asset(assets[index]),
              );
            },),
              
            
           ),
           SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemCount: assets.length,
              physics: BouncingScrollPhysics(),
              //reverse: true,
              controller: PageController(
                initialPage: 0,
                viewportFraction: 0.7
              ),
              onPageChanged: (value) {
                currentindex= value;
                setState(() {
                  
                });
              },
              itemBuilder: (contex,index){
              return Container(
                margin: const EdgeInsets.all(8),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  //color: color[index],
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Image.asset(assets[index]),
              );
            },),
              
            
           ),
           TabPageSelector(
            controller: TabController(length: assets.length, vsync: this),
            selectedColor: Colors.red,
            color: Colors.grey,
            borderStyle: BorderStyle.none,
           )
          ],),
        ),
      ),
    );
  }
}
