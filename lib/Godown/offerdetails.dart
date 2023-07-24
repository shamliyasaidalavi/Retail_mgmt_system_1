import 'package:flutter/material.dart';
import 'package:trip/Admin/model/offermodel.dart';
import 'package:trip/Api/api_sevices.dart';

class Offer extends StatefulWidget {
  const Offer({Key? key}) : super(key: key);

  @override
  State<Offer> createState() => _OfferState();
}
String id="";
List _loadprooducts = [];
ApiService client = ApiService();
class _OfferState extends State<Offer> {
  final List<String> product_name = [
    'Rice',
    'Meat',
  ];
  final List<String>offer_name = [
    '50%',
    '1 Buy Get 1 ',
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
            Text("Offers", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
            FutureBuilder<List<offerModel>>(
        future: client.fetchoffer(),
        builder: (BuildContext context,
        AsyncSnapshot<List<offerModel>> snapshot) {
         if (snapshot.hasData) {
    return GridView.builder(
    shrinkWrap: true,
    itemCount:  snapshot.data!.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 5,
    mainAxisSpacing: 15,
    ),
    itemBuilder: (BuildContext context, int index) {
    return Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    image: DecorationImage(
    image: AssetImage("server/public/images/"+snapshot.data![index].image), // Use AssetImage to load local images
    fit: BoxFit.cover,
    ),
    ),
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    " ${(snapshot.data![index].product_name)}",

    style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    ),
    ),
    Text(
    " ${(snapshot.data![index].offer_name)}",
    style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    ),
    ),
    ],
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
