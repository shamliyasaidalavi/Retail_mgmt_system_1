
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'homepage2.dart';



class Home extends  StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? gender; //no radio button will be selected
  //String gender = "male"; //if you want to set default value
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
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Payment Method",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30)),

            Divider(),

            RadioListTile(
              title: Text("Cash on delivery"),
              value: "Cash on delivery",
              groupValue: gender,
              onChanged: (value){
                setState(() {
                  gender = value.toString();
                });
              },
            ),

            RadioListTile(
              title: Text("PayUMoney"),
              value: "PayUMoney",
              groupValue: gender,
              onChanged: (value){
                setState(() {
                  gender = value.toString();
                });
              },
            ),

            RadioListTile(
              title: Text("RazorPay"),
              value: "RazorPay",
              groupValue: gender,
              onChanged: (value){
                setState(() {
                  gender = value.toString();
                });
              },
            ),

          Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
        color: Colors. white.withOpacity(0.8),
    elevation: 0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: BorderSide(color: Colors.black.withOpacity(0.3), width: 1),
    ),
    child:
    Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children:[
    Center(
    child: Text(
    "Total Amount:Rs643.50",
    style: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    SizedBox(height: 4.0),

       ElevatedButton(onPressed: (){

         Alert(
           context: context,
           title: "Payment Sucessful",
          content:  Icon(Icons.check_circle),
           buttons: [
             DialogButton(
               child: Text(
                 "OK",
                 style: TextStyle(color: Colors.white, fontSize: 20),
               ),
               onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(context)=>Homepage1 ())),
               color: Color.fromRGBO(0, 179, 134, 1.0),
               radius: BorderRadius.circular(0.0),
             ),
           ],

         ).show();

       }, child: Text(
         "proceed",
         style: TextStyle(
             color: Colors.grey[900],
             fontWeight: FontWeight.bold),),
      /* Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.lightBlueAccent.withOpacity(0.3)),
      child: Center(
      child:  Text(
      "proceed",
      style: TextStyle(
      color: Colors.grey[900],
      fontWeight: FontWeight.bold),
      )),
      ),*/
    ),
          ],
        ),

      ),


    ),
    ),
    ),
      ]
      )
    ),
    );
  }
}
