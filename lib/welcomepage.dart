import 'package:flutter/material.dart';
import 'package:trip/loginpage.dart';
import 'package:trip/Register/registration.dart';

import 'Register/Allregister.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("Shazam",style: TextStyle(fontSize: 60,color:Colors.lightBlueAccent)),

                ),
              Center(child: Text("Enjoy your shopping",style:TextStyle(fontSize: 20,color:Colors.lightBlueAccent),)),
           SizedBox(
             height: 60,
           ),
            Container(
    width: double.infinity,
    height: 300,
              decoration: BoxDecoration(

                  image: DecorationImage(
                      image: AssetImage('images/istockphoto-1319625327-1024x1024-transformed-removebg-preview.png')
                      )),
            ),
              SizedBox(height: 100,),
              Row(

    children:[
    Expanded(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlueAccent, // Background color
            ),
          child: Text('Login'),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder:(context)=>Login()));
          },
          ),
      ),
    ),
      Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent, // Background color
              ),
              child: Text('Sign up'),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder:(context)=>Signup1 ()));
              },
            ),
          ),
      )


            ],
          ),
    ]
    ),
        ),
        );

  }
}
