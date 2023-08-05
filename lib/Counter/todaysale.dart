import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/Admin/model/salesModel.dart';
import 'package:trip/Api/api.dart';
import 'package:trip/Api/api_sevices.dart';

import 'todaysalesmoredetails.dart';

class todaysales extends StatefulWidget {
  const todaysales({Key? key}) : super(key: key);

  @override
  State<todaysales> createState() => _todaysalesState();
}

class _todaysalesState extends State<todaysales> {
  final List<String> containerImages = [
    'images/two.jpg',
    'images/three.jpg',
    'images/two.jpg',
    'images/three.jpg',
  ];
  List _loadprooducts = [];
  String user_id = '';
  late SharedPreferences prefs;
  ApiService client = ApiService();
  final List<String> imageTitles = ["12-5-2023", "12-5-2023", "12-5-2023", "12-5-2023"];
  final List<String> Titles = ["35465767", "354645", "35465767", "35465767"];
  final List<String> Titless = ["9", "5", "3", "2"];
  bool _isExpanded=false;
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
              Text("Today Sales",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // Add padding around the search bar
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  // Use a Material design search bar


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
    separatorBuilder: (context, index) {
    return SizedBox(
    width: 20,
    );
    },
    //   scrollDirection: Axis.vertical,
    itemCount: 4,
    itemBuilder: (context, index) {
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
    child: Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    // mainAxisSize: MainAxisSize.min,
    children: [
    Icon(Icons.shopping_cart_rounded,color: Colors.red,size: 40,),


    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(" date:${(snapshot.data![index].date)}",
    ),
    Text(" orderid:${(snapshot.data![index].order_id)}",
    ),
    // Text("items : ${Titless[index]}"
    // ),
    ],
    ),


    Center(child: TextButton(onPressed:(){setState(() {

    _isExpanded=!_isExpanded;
    });
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => salesmoredetails()),
    );

    }, child: Column(
    children: [
    Text("More Details",style:TextStyle(fontSize: 18.0) ,),

    ],
    ))),


    ]),


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
      ),
    );
  }
}


