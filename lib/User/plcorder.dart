import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/Admin/model/cartModel.dart';
import 'package:trip/Admin/model/ordermodel.dart';
import 'package:trip/Admin/model/placeorderModel.dart';
import 'package:trip/Api/api.dart';
import 'package:trip/Api/api_sevices.dart';
import 'package:trip/User/payment.dart';

import 'paymet.dart';
class placeorder extends StatefulWidget {

  const placeorder({Key? key}) : super(key: key);
  @override

  State<placeorder> createState() => _placeorderState();
}

class _placeorderState extends State<placeorder> {
  ApiService client = ApiService();
  late SharedPreferences localStorage;
  late String user_id,order_id,ration;
  int price=0;
  String totalamount='';
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchcart();
  }
  Future<List<CartModel>> fetchcart() async {
    localStorage = await SharedPreferences.getInstance();
    user_id = (localStorage.getString('user_id') ?? '');
    print("uid${user_id}");
    var response =
    await Api().getData('/order/view_order/' + user_id.replaceAll('"', ''));
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
    //  print("itemsss${json.decode(response.body)}");
      setState(() {
        final Map<String, dynamic> responseData = json.decode(response.body);
        price = responseData['totalValue'];
        print("TotalAmount${price}");

      });


      List<CartModel> products = List<CartModel>.from(
          items['data'].map((e) => CartModel.fromJson(e)).toList());
      return products;
    } else {
      List<CartModel> products = [];
      return products;
    }
  }

 /* Future<List<OrderModel>> fetchorder() async {
    localStorage = await SharedPreferences.getInstance();
    user_id = (localStorage.getString('user_id') ??'');
    print(user_id);

    var response = await Api().getData('/order/view_order/'+user_id.replaceAll('"', ''));
    print("hello");
    print("res${json.decode(response.body)}");
    if (response.success== true){
      print("hello");
      print("hello");
      var items = json.decode(response.body);
      print(("dataaa${items}"));
      setState((){
        totalamount=items['totalValue'];
        print("TotalAmount${totalamount}");
      });
      List<OrderModel> products = List<OrderModel>.from(
          items['data'].map((e) => OrderModel.fromJson(e)).toList());
      return products;
    } else {
      List<OrderModel> products = [];
      return products;
    }
  }
*/
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
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "My orders",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40),
              ),
            ),
            FutureBuilder<List<CartModel>>(
              future: fetchcart(),
              builder: (BuildContext cfetchproductontext,
                  AsyncSnapshot<List<CartModel>> snapshot) {
                if (snapshot.hasData) {

                  return ListView.builder(

                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "server/public/images/" +
                                          snapshot.data![index].image),
                                ),


                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data![index].productname),
                                    Text(snapshot.data![index].total.toString()),
                                  ],
                                ),


                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),

          ],
        ),
      ),
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
              color: Colors.lightBlueAccent,
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
