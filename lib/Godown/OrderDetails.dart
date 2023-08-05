import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/Admin/model/salesModel.dart';
import 'package:trip/Api/api.dart';

import '../Counter/paymentstatus.dart';

class orderdetails extends StatefulWidget {
  const orderdetails({Key? key}) : super(key: key);

  @override
  State<orderdetails> createState() => _orderdetailsState();
}

class _orderdetailsState extends State<orderdetails> {
  List _loadprooducts = [];
  String user_id = '';
  late SharedPreferences prefs;
  final List<String> containerImages = [
    'images/two.jpg',
    'images/three.jpg',
    'images/two.jpg',
    'images/three.jpg',
  ];

  final List<String> imageTitles = ["jaya", "Chicken", "onion", "Mango"];
  final List<String> titles = ["2kg", "5kg", "4kg", "3kg"];
  final List<String> subtitles = ["Rice", "Meat", "vegetable", "fruit"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getId();

  }
  void fetchsales() async {
    var response = await Api().getData('/order/view_orders');

    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));
      setState(() {
        // total =items['totalValue'].toString();

      });


    }
  }

  void getId()async{
    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getString('user_id') ?? '');
    print('User ID ${user_id}');


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Order details",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40),
              ),
            ),
        FutureBuilder <List<salesModel>>(
        future: client.fetchsales(),
    builder: (BuildContext context,
    AsyncSnapshot<List<salesModel>> snapshot) {
    if (snapshot.hasData) {
      return
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 2,
                child: InkWell(
                  onTap: () {

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(containerImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              imageTitles[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              titles[index],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              subtitles[index],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios_outlined),
                          color: Colors.grey[600],
                          onPressed: () {


                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
    }

    return Center(child: CircularProgressIndicator());
    }
    ),
          ],
        ),
      ),
    );
  }
}
