import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_store/pages/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), (){
      var route = MaterialPageRoute(builder: (b)=>Welcome());
      Navigator.pushReplacement(context, route);
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(child: Text("WELCOME TO ADVANCE STORES",style: TextStyle(color: Colors.white,fontSize: 30),),),
    );
  }
}