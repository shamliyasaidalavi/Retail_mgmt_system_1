import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/Api/api.dart';
import 'package:trip/User/homepage2.dart';
import 'package:trip/User/mainscreen.dart';
import 'package:trip/User/paymet.dart';

class Payment extends StatefulWidget {
  final int price;
  Payment({required this.price});

  @override
  State<Payment> createState() => _PaymentState();
}
enum Gender {
  Take_away,Online_delivery, }
Gender? _payment = Gender.Take_away;
int? payment;

String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

class _PaymentState extends State<Payment> {
  DateTime? _selectDate;
  late SharedPreferences prefs;
  bool isLoading = false;
  late String user_id, order_id;
  late int amount;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    amount=widget.price;
    print(amount);
  }
 void pay() async {
    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getString('user_id') ?? '');
    print('login_idupdate ${user_id}');
    var res = await Api()
        .getData('/order/make-payment/' +user_id.replaceAll('"', ''));
    var body = json.decode(res.body);
    Fluttertoast.showToast(
      msg: body['message'].toString(),
      backgroundColor: Colors.grey,
    );
    print(body);
    Navigator.push(
        context , MaterialPageRoute(builder: (context) => mainscreen()));

   /* AlertDialog(
      // title: const Text("payment successfull"),
      content: Image.asset("images/paymnt.jpg"),
      actions: [
        ElevatedButton(onPressed: (){
          Navigator.pushReplacement(
              context as BuildContext, MaterialPageRoute(builder: (context) => Home()));
        }, child: Text("OK"))
      ],
    );*/
  }
 /* Future PlaceOrders() async {
    amount=widget.price;

    print(amount);
    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getInt('user_id') ?? 0);
    print('login_id_complaint ${user_id}');
    setState(() {
      isLoading = true;
    });

    var data = {
      "user": user_id.toString(),
      "amount": amount,
      "date":formattedDate
    };
    print(data);
    var res = await Api().authData(data, '/api/payment');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {

      _showDialog(context);

      print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
    else{
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    TextEditingController datecontroller=TextEditingController();


    return  Scaffold( appBar: AppBar(
        title: Text("Payments"),
        leading:IconButton(
          icon:Icon(Icons.arrow_back),
    onPressed: () => Navigator.of(context).pop(),
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));

        ),
      ),
        body: SingleChildScrollView(
      child: Container(
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("Payment",
              //   style: TextStyle(
              //     fontSize: 20,
              //     color: Colors.green,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Align(
                    alignment: Alignment.centerLeft, child: Text("Suggested for you")),
              ),
              ListTile(
                title: const Text('Take_away'),
                leading: Radio<Gender>(
                  value: Gender.Take_away,
                  groupValue: _payment,
                  onChanged: (Gender? value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Online_delivery'),
                leading: Radio<Gender>(
                  value: Gender.Online_delivery,
                  groupValue: _payment,
                  onChanged: (Gender? value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
              ),

              SizedBox(height: 10),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText:amount.toString() ,
                  hintText:amount.toString() ,
                  hintStyle: TextStyle(
                      color: Colors.green
                  ),
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),

              SizedBox(height: 30),
              SizedBox(height: 30,
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // padding: EdgeInsets.all(20)
                    ),
                    onPressed: (){
                      pay();
                    } ,
                    child: Text("CONTINUE")),
              ),
              SizedBox(height: 30),
            ],
          ),),
      ),
    );
  }
}
