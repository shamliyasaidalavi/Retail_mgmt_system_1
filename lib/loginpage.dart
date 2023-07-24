import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/Admin/Admin.dart';
import 'package:trip/Counter/Couter.dart';
import 'package:trip/Godown/godown.dart';
import 'package:trip/User/homepage2.dart';
import 'package:trip/User/mainscreen.dart';
import 'package:trip/delivery/M%20delivery.dart';
import 'package:trip/Register/registration.dart';

import 'Api/api.dart';

class Login extends StatefulWidget {
  const  Login({Key? key}) : super(key: key);

  @override
  State< Login> createState() => _LoginState();
}

class _LoginState extends State< Login> {
  bool _isLoading = false;
  String admin = "0";
  String user = "1";
  String counter = "2";
  String godown = "3";
  String delivery = '4';
  String storedvalue = '1';
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late String role;
  late String status;
  late SharedPreferences localStorage;
  _pressLoginButton() async {
    setState(() {
      _isLoading = true;
    });

 
    var data = {
      'username': userController.text.trim(), //username for email
      'password': passwordController.text.trim()
    };
    var res = await Api().authData(data,'/login/login');
    var body = json.decode(res.body);

    if (body['success'] == true) {
      print(body);

      role = json.encode(body['details']['role']);
      status = json.encode(body['details']['status']);
      String id = json.encode(body['user_id']);
      print("id${id}");
      localStorage = await SharedPreferences.getInstance();
      localStorage.setString('role', role.toString());
      localStorage.setString('login_id', json.encode(body['login_id']));
      localStorage.setString('user_id', id.toString());

      print('login_idss ${json.encode(body['login_id'])}');

      if (admin == role.replaceAll('"', '') &&
          storedvalue == status.replaceAll('"', '')) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Admin()));
      }
      else if (user == role.replaceAll('"', '') &&
          storedvalue == status.replaceAll('"', '')) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => mainscreen(),
        ));


      }
      else if ( counter== role.replaceAll('"', '') &&
          storedvalue == status.replaceAll('"', '')) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Couter1(),
        ));


      }
      else if (godown == role.replaceAll('"', '') &&
          storedvalue == status.replaceAll('"', '')) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>godownhome(),
        ));


      }
      else if (delivery == role.replaceAll('"', '') &&
          storedvalue == status.replaceAll('"', '')) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Deliveryguy(),
        ));


      }
      else {
        Fluttertoast.showToast(
          msg: "Please wait for admin approval",
          backgroundColor: Colors.grey,
        );
      }


    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body:
      
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 40,fontWeight: FontWeight.bold,color: Colors.lightBlueAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(
                      "Welcome back!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:Colors.lightBlueAccent,
                      ),
                    ),
                    Text(
                      "Login With Your Credentials ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:Colors.lightBlueAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0,right: 100.0, bottom:50),
                child: TextField(
                  controller:userController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: Colors.lightBlueAccent
                      ),

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),

                      labelText: "Enter username"



                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0,right: 100.0, bottom:50),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: Colors.lightBlueAccent
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      labelText: " Enter password"

                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent, // Background color
                      ),
                      onPressed: (){
                        _pressLoginButton();
                  }, child: Text("login"))
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    text: 'dont have an account?signup ',
                    style: TextStyle(fontSize: 18),
                    children: const <TextSpan>[
                      TextSpan(text: 'signup', style: TextStyle(fontWeight: FontWeight.bold),


                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
