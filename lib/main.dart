import 'package:flutter/material.dart';
import 'package:trip/Admin/Admicouter.dart';
import 'package:trip/Counter/offersaddofrs.dart';
import 'package:trip/Counter/todaysale.dart';
import 'package:trip/Counter/todaysalesmoredetails.dart';
import 'package:trip/Counter/Couter.dart';
import 'package:trip/Register/Allregister.dart';
import 'package:trip/Godown/OrderDetails.dart';
import 'package:trip/Counter/counterDelivery.dart';
import 'package:trip/Counter/addoffers.dart';
import 'package:trip/User/mainscreen.dart';
import 'package:trip/Register/cunterRegister.dart';
import 'package:trip/delivery/M%20delivery.dart';
import 'package:trip/delivery/cancelledorder.dart';
import 'package:trip/User/cart.dart';
import 'package:trip/delivery/closedorder.dart';
import 'package:trip/User/delivery.dart';
import 'package:trip/User/history.dart';
import 'package:trip/User/historydetails.dart';
import 'package:trip/Godown/godown.dart';

import 'package:trip/homepage.dart';

import 'package:trip/Godown/offerdetails.dart';
import 'package:trip/Counter/paymentstatus.dart';
import 'package:trip/product/prdt.dart';
import 'package:trip/Register/registration.dart';
import 'package:trip/splash.dart';
import 'package:trip/User/homepage2.dart';
import 'package:trip/loginpage.dart';
import 'package:trip/delivery/opendelivery.dart';
import 'package:trip/trial.dart';
import 'package:trip/welcomepage.dart';

import 'Admin/Admin.dart';
import 'User/barcode.dart';

void main() {
  runApp(const retail());


}
  class retail extends StatelessWidget {
  const retail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splash(),);
  }


}

