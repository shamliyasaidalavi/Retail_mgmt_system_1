import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Allregister.dart';
import '../Api/api.dart';
import '../loginpage.dart';

class CntrRegister extends StatefulWidget {
  const CntrRegister({Key? key}) : super(key: key);

  @override
  State<CntrRegister> createState() => _CntrRegisterState();
}

class _CntrRegisterState extends State<CntrRegister> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>(); // Add a form key for validation

  // Define TextEditingController for each text field
  final _userNameController = TextEditingController();
  final _counterNameController = TextEditingController();
  final _counterIdController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _counterNameController.dispose();
    _counterIdController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  void registercounter()async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      "username": _userNameController.text,
      "password":_passwordController.text,
      "counter_name": _counterNameController.text,
      "counter_id": _counterIdController.text,
      "phoneNumber": _phoneNumberController.text,
      "email": _emailController.text,
    };
    var res = await Api().authData(data,'/register/counter-register');
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
        // Overide the default Back button
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_left_sharp, color: Colors.black,),
          label: const Text('Back', style: TextStyle(color: Colors.green)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // other stuff
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey, // Associate the form key with the Form widget
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
                padding: const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    labelText: "User name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a User name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: _counterNameController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    labelText: "Counter name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a counter name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: _counterIdController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    labelText: "Counter id",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a counter id';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }

                    // Regular expression for basic email validation
                    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }

                    // You can add more complex email validation logic here if needed

                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Phone Number",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }

                    // Phone number validation
                    // Adjust the regular expression as per your desired phone number format

                    final phoneRegex = r'^[0-9]{10}$';
                    if (!RegExp(phoneRegex).hasMatch(value)) {
                      return 'Please enter a valid 10-digit phone number';
                    }

                    return null;
                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    labelText: "Password",
                  ),
                  obscureText: true, // Hide the entered password
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    // You can add more complex password validation logic here if needed
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      registercounter();
                      // All fields are valid, perform signup logic
                      // Access the entered values using the controllers


                      // Perform the signup process with the entered values
                      // Here you can implement your signup logic
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
                      text: 'Don\'t have an account?',
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
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
