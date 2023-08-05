import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trip/Admin/model/salesModel.dart';
import 'package:trip/Api/api.dart';
import 'package:trip/Api/api_sevices.dart';

class adsalesdtls extends StatefulWidget {
  const adsalesdtls({Key? key}) : super(key: key);

  @override
  State<adsalesdtls> createState() => _adsalesdtlsState();
}

class _adsalesdtlsState extends State<adsalesdtls> {
  final List<String> containerImages = [
    'images/two.jpg',
    'images/three.jpg',
    'images/two.jpg',
    'images/three.jpg',
  ];
  List _loadprooducts = [];
  ApiService client = ApiService();
  String totalValue = '';
  String total = '';
  final List<String> productname = ["Rice", "Meat", "vegetables", "fruits"];
  final List<String> Titles = ["100", "490", "50", "60"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchsales() ;

  }
  void fetchsales() async {
    var response = await Api().getData('/order/view_orders');

    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));
      setState(() {
         total =items['totalValue'].toString();

      });


    }
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text("More Details",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
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
              itemCount:snapshot.data!.length,
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
                          CircleAvatar(backgroundImage:AssetImage("server/public/images/"+snapshot.data![index].image)



                            // child: Image.asset(containerImages[index],fit: BoxFit.cover,),
                          ),/*Container(
                                  width: 80,
                                  child: Image.asset(containerImages[index],
                                      fit: BoxFit.cover),
                                ),*/

                          Column(
                            children: [
                              Text("${(snapshot.data![index].productname)}",
                              ),
                              Text("${(snapshot.data![index].price)}"
                              ),
                            ],
                          ),


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
          Container(
            height: 200,
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text("Total Amout"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text('\u{20B9} 10,019',style: TextStyle(color: Colors.green),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
      bottomNavigationBar: Material(
        color: const Color(0xffff8906),
        child: SizedBox(
          height: kToolbarHeight,
          width: double.infinity,
          child: Center(
            child: Text(
           "Total Amout  ${total} ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
