import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Allregister.dart';
import '../Api/api.dart';
import '../loginpage.dart';

class DelReg extends StatefulWidget {
  const DelReg({Key? key}) : super(key: key);

  @override
  State<DelReg> createState() => _DelRegState();
}

class _DelRegState extends State<DelReg> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController delboynameController = TextEditingController();
  TextEditingController delveryidController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    delboynameController.dispose();
    delveryidController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  void registerdeliveryboy()async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      "username": userNameController.text,
      "deliveryboy_name":delboynameController.text,
      "password": passwordController.text,
      "del_id": delveryidController.text,
      "address": addressController.text,
      "Phone_no": phoneNumberController.text,
      "email": emailController.text,
    };
    var res = await Api().authData(data,'/register/delivery-register');
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
                      return 'user Name is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "userName",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller:delboynameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'delboy Name is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "delName",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: delveryidController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'ID is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "ID",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    }
                    // Add email format validation logic if needed
                    return null;
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Email",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: phoneNumberController,
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
                padding: const EdgeInsets.only(
                    left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    // Add password strength validation logic if needed
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
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      registerdeliveryboy();
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
