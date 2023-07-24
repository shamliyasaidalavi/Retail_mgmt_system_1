// //import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// void main() => runApp(const MyApp());
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       home:  BarcodeScannerDemo(),
//     );
//   }
// }
// class BarcodeScannerDemo extends StatefulWidget {
//   const BarcodeScannerDemo({Key? key}) : super(key: key);
//   @override
//   _BarcodeScannerDemoState createState() => _BarcodeScannerDemoState();
// }
// class _BarcodeScannerDemoState extends State<BarcodeScannerDemo> {
//   String _scanBarcode = '';
//   /// For Continuous scan
//   Future<void> startBarcodeScanStream() async {
//     FlutterBarcodeScanner.getBarcodeStreamReceiver(
//         '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
//         .listen((barcode) => print(barcode));
//   }
//   Future<void> barcodeScan() async {
//     String barcodeScanRes;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.QR);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }
//     if (!mounted) return;
//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter Barcode Scanner Demo'),
//           centerTitle: true,
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.cyan,
//         ),
//         body: Builder(builder: (BuildContext context) {
//           return Container(
//               alignment: Alignment.center,
//               child: Flex(
//                   direction: Axis.vertical,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//
//                     const SizedBox(
//                       height: 50,
//                     ),
//
//                     SizedBox(
//                       height: 45,
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.cyan,
//                           ),
//                           onPressed: () => barcodeScan(),
//                           child: const Text('Barcode Scan',
//                               style: TextStyle(
//                                   fontSize: 17, fontWeight: FontWeight.bold))),
//                     ),
//                   ]));
//         }));
//   }
// }//import 'package:flutter/material.dart';
//
// void main(){
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//      return MaterialApp(
//          home: Home()
//       );
//   }
// }
//
// class Home extends  StatefulWidget {
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   String? gender; //no radio button will be selected
//   //String gender = "male"; //if you want to set default value
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: Text("Radio Button in Flutter"),
//             backgroundColor: Colors.deepOrangeAccent,
//         ),
//         body: Container(
//             padding: EdgeInsets.all(20),
//             child:
//           Column(
//             children: [
//
//                 Text("What is your gender?", style: TextStyle(
//                     fontSize: 18
//                 ),),
//
//                 Divider(),
//
//                 RadioListTile(
//                     title: Text("Male"),
//                     value: "male",
//                     groupValue: gender,
//                     onChanged: (value){
//                       setState(() {
//                           gender = value.toString();
//                       });
//                     },
//                 ),
//
//                 RadioListTile(
//                     title: Text("Female"),
//                     value: "female",
//                     groupValue: gender,
//                     onChanged: (value){
//                       setState(() {
//                           gender = value.toString();
//                       });
//                     },
//                 ),
//
//                 RadioListTile(
//                       title: Text("Other"),
//                       value: "other",
//                       groupValue: gender,
//                       onChanged: (value){
//                         setState(() {
//                             gender = value.toString();
//                         });
//                       },
//                 )
//             ],
//           ),
//         ),
//     );
//   }
//




