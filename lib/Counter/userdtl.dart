import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trip/Api/api.dart';
import 'package:trip/Counter/ordrusers.dart';
import 'package:trip/Counter/takeawylist.dart';

class userdtl extends StatefulWidget {
  final String orderid;
  final String userid;

  userdtl({ required this.orderid,required this.userid,});

  @override
  State<userdtl> createState() => _userdtlState();
}




class _userdtlState extends State<userdtl> {
  bool _isLoading = false;
  TextEditingController product_idController = TextEditingController();


  @override
  void dispose() {
    product_idController.dispose();


    super.dispose();
  }
  var dropDownValue;
  List del = [];
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProducts();
  }

  Future getAllProducts()async{
    var res = await Api().getData('/register/view-deliveryap');
    var body = json.decode(res.body);

    setState(() {
      del=body['data'];
      print(del);

    });
  }
  void registerUser()async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      "userid": widget.userid,
      "orderid": widget.orderid,
      "delid": widget.orderid,


    };
    var res = await Api().authData(data,'/signup/user');
    var body = json.decode(res.body);

    if(body['success']==true)
    {
      print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

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
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("USER1",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
                  Divider(),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // Add padding around the search bar
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      // Use a Material design search bar

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: DropdownButtonFormField<String>(

                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          hint: Text('Deliveryboys'),
                          value: dropDownValue,
                          items: del
                              .map((type) => DropdownMenuItem<String>(
                            value: type['_id'].toString(),
                            child: Text(
                              type['deliveryboy_name'].toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                          ))
                              .toList(),
                          onChanged: (type) {
                            setState(() {
                              dropDownValue = type;
                            });
                          }),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("OK"),
                      ),
                      onPressed: () {
                        // registerdeliveryboy();
                      },

                    ),
                  ),
                ],
              ),


            )
        )


    );
  }
}