
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/Admin/model/ordermodel.dart';
import 'package:trip/Api/api.dart';
import 'package:trip/Api/api_sevices.dart';
import 'package:trip/User/payment.dart';
import 'package:trip/User/paymet.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({Key? key}) : super(key: key);

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  List order = [];
  ApiService client = ApiService();
  bool isLoading = false;
  late SharedPreferences localStorage;
  String user_id='';
  int price=0;
  bool _isLoading=false;
  List images = ['images/disc.webp', 'images/sale.png', 'images/sofaoff.jpg'];
/*  Future<List<OrderModel>> fetchorder() async {
    localStorage = await SharedPreferences.getInstance();
    user_id = (localStorage.getString('user_id') ??'');

    var response = await Api().getData('/order/view_order/'+user_id);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));
      setState((){
        price=items['totalValue'];
        print("TotalAmount${price}");
      });
      List<OrderModel> products = List<OrderModel>.from(
          items['data'].map((e) => OrderModel.fromJson(e)).toList());
      return products;
    } else {
      List<OrderModel> products = [];
      return products;
    }
  }*/
  fetchorder() async {
    localStorage = await SharedPreferences.getInstance();
    user_id = (localStorage.getString('user_id') ??'');
    print("id${user_id}");
    var response = await Api().getData('/order/view_order/'+user_id.replaceAll('"', ''));
    if (response.statusCode == 200) {
      print("heklo");
      var items = json.decode(response.body);
      print((items));
      setState((){
        price=items['totalValue'];
        print("TotalAmount${price}");
      });

    } else {
      order = [];
      Fluttertoast.showToast(
        msg:"Currently there is no data available",
        backgroundColor: Colors.grey,
      );
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
print("fetched");
    fetchorder();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
          },icon: Icon(Icons.arrow_back),
        ),
      ),
      body:/* FutureBuilder<List<OrderModel>>(
      future: client.fetchOrder(),
    builder: (BuildContext context,
    AsyncSnapshot<List<OrderModel>> snapshot) {
        print(snapshot);
    if (snapshot.hasData) {
    return */ ListView.builder(
          shrinkWrap: true,
          itemCount:order.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                CircleAvatar(
                backgroundImage: AssetImage(
                "server/public/images/" +
                order[index]['image'])),

                Column(
                  children: [
                    Text(order[index]['total']),
                    Text(order[index]['product_image']),

                  ],
                        /*  Container(
                            height: 90,
                            child: Image(image: NetworkImage(Api().url+ order[index]['image'])),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(firstWord),
                                Text("Quantity : "+order[index]['quantity'].toString()),
                                Text("Rs : "+order[index]['total_price'].toString()),
                                // Text("Qty : "+order[index].quantity),
                              ],*/

                          ),
                        ],
                      ),


                      /*  GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment()));
                  },
                )*/
                    ]
                ),
              ),
            );
          }),
      /*  }
    return Center(child: CircularProgressIndicator());
    }),*/

      bottomNavigationBar: Row(
        children: [
          Material(
            color:  Color(0xffff8989),
            child:  SizedBox(
              height: kToolbarHeight,
              width: 100,
              child: Center(
                child: Text(price.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.green,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment(price:price)));
                },
                child: const SizedBox(
                  height: kToolbarHeight,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),


    );
  }
}
