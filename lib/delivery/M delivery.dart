import 'package:flutter/material.dart';
import 'package:trip/loginpage.dart';

import 'cancelledorder.dart';
import 'closedorder.dart';
import 'opendelivery.dart';
class Deliveryguy extends StatefulWidget {
  const Deliveryguy({Key? key}) : super(key: key);
  @override
  State<Deliveryguy> createState() => _DeliveryguyState();
}

class _DeliveryguyState extends State<Deliveryguy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
      leading: IconButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      },icon : Icon(Icons.menu),color: Colors.green,),
      title: Center(
        child: Text(
          "Retail managemnt system",style: TextStyle(color: Colors.blueGrey),
        ),
      ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.notifications),color: Colors.green,)
      ],
      backgroundColor: Colors.white,
    ),
      body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: SafeArea(
          child: Container(
          padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage('images/one.jpg'),
                    fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Free Delivery For Next 3 Orders",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                          "Order Details",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top :30),
                child: Text(
                  "Make order",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),

                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: GestureDetector(onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Openorder()),
                );
              },
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[200]),
                  height: 100,
                  width: double.infinity,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.open_in_browser,color: Colors.red,size: 40,),
                      Text("Open Order",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      )

                    ],
                  ),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => closedorder()),
                  );
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[200]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cancel,color: Colors.red,size: 40,),
                      Text("Closed Order ",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      )

                    ],
                  ),


                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
              child: GestureDetector(onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => cancelledorder()),
    );
    },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[200]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.close,color: Colors.red,size: 40,),
                      Text("Cancelled Order",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      )

                    ],
                  ),


                ),
              ),
            )
          ],


        ),


),
    ),
    ),
    );

  }
}
