import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:trip/Admin/model/productmodel.dart';
import 'package:trip/Api/api_sevices.dart';
import 'package:trip/User/scandetails.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({Key? key}) : super(key: key);

  @override
  State<Homepage1> createState() => _Homepage1State();
}

final List<String> containerImages = [
  'images/two.jpg',
  'images/three.jpg',
  'images/two.jpg',
  'images/three.jpg',
  'images/two.jpg',
  'images/three.jpg',
  'images/three.jpg',
];
final List<String> _listText = [
  'Rice',
  'Meat',
];
final List<String> _listItem = [
  'images/two.jpg',
  'images/three.jpg',
  'images/f.jpg',
  'images/five.jpg',
  'images/one.jpg',
  'images/two.jpg',
  'images/three.jpg',
];
final List<String> imageTitles = ["Rice", "Meat", "vegetables", "fruits"];

class _Homepage1State extends State<Homepage1> {
  int _selectedIndex = 0;

  void _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  String _scanBarcode = 'Unknown';
  /// For Continuous scan
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }
  Future<void> barcodeScan() async {
    String? barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      String code = barcodeScanRes.replaceAll("\"", '');






      productModel product = await ApiService().fetchsingleprdt(code);





      Navigator.push(context, MaterialPageRoute(builder: (context) =>scandetails(product: product,) ,));









    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    // if (!mounted) return;
    // setState(() {
    //   _scanBarcode = barcodeScanRes;
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,color: Colors.black,

        ),
        title: Text("Home",
            style: TextStyle(
              color: Colors.black,
            )),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text("0")),
            ),
          )
        ],
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
                                child: ElevatedButton( style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white, // Background color
                                ),onPressed: ()=> barcodeScan(), child: Text("Scan Now",style: TextStyle(fontSize: 24,color: Colors.black),),),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Categories",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      Container(
                        height: 150,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 20,
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 120,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                    child: Image.asset(containerImages[index],
                                        fit: BoxFit.cover,),
                                  ),
                                  Text("${imageTitles[index]}")
                                ]);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Special Deal ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                  fontWeight: FontWeight.bold),
          ),
          ]),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: _listItem.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 50),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(_listItem[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                _listText[index % _listText.length],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )))),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.black,
      //   type: BottomNavigationBarType.shifting,
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'home',
      //     ),
      //
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.trolley),
      //       label: 'cart',
      //     ),
      //
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.history),
      //       label: 'History',
      //     ),
      //
      //   ],
      // ),
    );
  }
}
