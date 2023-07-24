
import 'dart:async';

import 'package:google_fonts/google_fonts.dart';
import 'package:trip/homepage.dart';
import 'package:flutter/material.dart';
import 'package:trip/loginpage.dart';
import 'package:trip/welcomepage.dart';

import 'User/homepage2.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Welcome())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Padding(  padding: const EdgeInsets.all(8.0),
          child: Text(
           '" Lets order fresh items"',
            style: TextStyle(fontSize:30,fontFamily: 'RobotoMono',color: Colors.lightBlueAccent),

          ),
        ),
          Center(

            child: Container(
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/istockphoto-1319625327-1024x1024-transformed-removebg-preview.png"),fit: BoxFit.cover),
              ),
            ),
          ),

        ],
        ),

    );
  }
}