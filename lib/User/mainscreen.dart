

import 'package:trip/User/cart.dart';
import 'package:trip/User/history.dart';
import 'package:trip/User/homepage2.dart';
import 'package:flutter/material.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  List<Widget> pageList = [
  const Homepage1(),
     Cart(),
    const History(),
  ];
  int selectedIndex =0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pageList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.trolley),
            label: 'cart',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),

        ],
      ),
    );
  }
}