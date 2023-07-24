import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trip/Api/api.dart';


import 'Allregister.dart';
import '../loginpage.dart';

class usersignup extends StatefulWidget {
  const usersignup({Key? key}) : super(key: key);

  @override
  State<usersignup> createState() => _usersignupState();
}

class _usersignupState extends State<usersignup> {

  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>(); // GlobalKey for the form

  // Controller for text fields
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _genderController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
  void registerUser() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      "username": _userNameController.text,
      "password": _passwordController.text,
      "first_name": _firstNameController.text,
      "last_name": _lastNameController.text,
      "phoneNumber": _phoneNumberController.text,
      "email": _emailController.text,
      "address": _addressController.text,
      "gender": _genderController.text,
    };

    var res = await Api().authData(data, '/register/user-register');
    var body = json.decode(res.body);

    if (body['success'] == true) {
      print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context) => Signup1()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }

    setState(() {
      _isLoading = false;
    });
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
          key: _formKey, // Assign the form key
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
                padding: const EdgeInsets.all(20.0),
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
                padding:
                const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    labelText: "user Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your user name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    labelText: "First Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Last Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
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
                padding:
                const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Address",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
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
                padding:
                const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: _genderController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Gender",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your gender';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Confirm Password",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
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
                      registerUser();

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
                      style: TextStyle(color: Colors.lightBlueAccent, fontSize: 18),
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
                        )
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
