import 'package:flutter/material.dart';
import 'package:trip/Counter/orderdetl.dart';
import 'package:trip/loginpage.dart';

import 'addoffers.dart';
import 'paymentstatus.dart';
import 'todaysale.dart';

class Couter1 extends StatefulWidget {
  const Couter1({Key? key}) : super(key: key);

  @override
  State<Couter1> createState() => _Couter1State();
}

class _Couter1State extends State<Couter1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        },icon : Icon(Icons.menu),color: Colors.green,),
        title: Center(
          child: Text(
            "Counter",style: TextStyle(color: Colors.blueGrey),
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
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('images/one.jpg'),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(.4),
                                Colors.black.withOpacity(.2),
                              ])),
                    )
                ),

                Padding(
                  padding: const EdgeInsets.only( top:20,left: 20,right: 20),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => addoffers()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[200]),
                      height: 90,
                      width: double.infinity,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(" Add offers",
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_sharp),

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
    MaterialPageRoute(builder: (context) => todaysales()),
    );
                    },
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => todaysales()),
                        );

                      }
                      ,
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[200]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Today sales ",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_sharp),

                          ],
                        ),


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
                        MaterialPageRoute(builder: (context) => paymentstatus()),
                      );
                    },

                    child: Container(
                      height: 100,
                      width: double.infinity,

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[200]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("payment status ",
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_sharp),

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
                        MaterialPageRoute(builder: (context) => orderdtl()),
                      );
                    },

                    child: Container(
                      height: 100,
                      width: double.infinity,

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[200]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Orders ",
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_sharp),

                        ],
                      ),


                    ),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
