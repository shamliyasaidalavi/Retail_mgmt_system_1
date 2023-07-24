import 'package:flutter/material.dart';
import 'package:trip/Admin/model/salesModel.dart';
import 'package:trip/Api/api_sevices.dart';

class salesmoredetails extends StatefulWidget {
  const salesmoredetails({Key? key}) : super(key: key);

  @override
  State<salesmoredetails> createState() => _salesmoredetailsState();
}

class _salesmoredetailsState extends State<salesmoredetails> {
  final List<String> containerImages = [
    'images/two.jpg',
    'images/three.jpg',
    'images/two.jpg',
    'images/three.jpg',
  ];
  // List _loadprooducts = [];
  // ApiService client = ApiService();
  final List<String> imageTitles = ["Rice", "Meat", "vegetables", "fruits"];
  final List<String> Titles = ["Rs100-2items", "Rs512.10-1item", "Rs50-4item", "Rs60.20-3item"];

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


          children: [

            Align(
              alignment: Alignment.topLeft,
              child: Text("More Details",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
            ),


                Align(
                  alignment: Alignment.topRight,
                  child: Text("Customer name:shamli ",
                      style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20,color: Colors.grey[600]),
                       ),
                ),
            Align(
              alignment: Alignment.topRight,
              child: Text("bill number:123445 ",
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20,color: Colors.grey[600]),
              ),
            ),


    //         FutureBuilder  <List<salesModel>>(
    // future: client.fetchsales(),
    // builder: (BuildContext context,
    // AsyncSnapshot<List<salesModel>> snapshot) {
    // if (snapshot.hasData) {
    //
    // return
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
    CircleAvatar(backgroundImage:AssetImage("images/two.jpg")


    // child: Image.asset(containerImages[index],fit: BoxFit.cover,),
    ),/*Container(
                                    width: 80,
                                    child: Image.asset(containerImages[index],
                                        fit: BoxFit.cover),
                                  ),*/

    Column(
    children: [
    Text("${imageTitles[index]}"
    ),
    Text("${Titles[index]}"
    ),
    ],
    ),


    ]),
    ),

    ),
    );
    },
    ),
    // }
    // return Center(child: CircularProgressIndicator());
    // }
    //         ),

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
                            Text('Offer'),
                            Text("Total Amout"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('  \u{20B9} 10'),

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
    );
  }
}
