import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Allregister.dart';
import '../Api/api.dart';
import '../loginpage.dart';

class GdwReg extends StatefulWidget {
  const GdwReg({Key? key}) : super(key: key);

  @override
  State<GdwReg> createState() => _GdwRegState();
}

class _GdwRegState extends State<GdwReg> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController godownNameController = TextEditingController();
  TextEditingController godownIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    godownNameController.dispose();
    godownIdController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  void registergodown()async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      "username": userNameController.text,
      "password": passwordController.text,
      "godown_name":godownNameController.text,
      "godow_id": godownIdController.text,

    };
    var res = await Api().authData(data,'/register/godown-register');
    var body = json.decode(res.body);

    if(body['success']==true)
    {
      print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup1()));

    }
    else
    {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_sharp, color: Colors.black),
          label: const Text('Back', style: TextStyle(color: Colors.black)),
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "create an account",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: userNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'user name is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "User name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: godownNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Godown name is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Godown name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: godownIdController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Godown ID is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Godown ID",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Password",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm Password is required';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Confirm Password",
                  ),
                ),
              ),
              Container(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      registergodown();
                      // All fields are valid, proceed with signup logic
                      // You can access the form data using the controller's text properties
                    }
                  },
                  child: Text("Sign Up"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account?',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
