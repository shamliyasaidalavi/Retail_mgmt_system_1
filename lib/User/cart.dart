import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/Admin/model/cartModel.dart';
import 'package:trip/Api/api.dart';
import 'package:trip/Api/api_sevices.dart';

import 'package:trip/User/paymet.dart';
import 'package:trip/User/place.dart';
import 'package:trip/User/plcorder.dart';

import '../Admin/model/productmodel.dart';

class Cart extends StatefulWidget {
  Cart({this.product, Key? key}) : super(key: key);

  productModel? product;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  ApiService client = ApiService();
  late SharedPreferences prefs;
  String user_id = '';
  int? total;

  void initState() {
    // TODO: implement initState
    super.initState();
    fetchcart();
  }

  Future<List<CartModel>> fetchcart() async {
    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getString('user_id') ?? '');
    print("uid${user_id}");
    var response =
        await Api().getData('/cart/view_cart/' + user_id.replaceAll('"', ''));
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print(("items${items}"));

      List<CartModel> products = List<CartModel>.from(
          items['data'].map((e) => CartModel.fromJson(e)).toList());
      return products;
    } else {
      List<CartModel> products = [];
      return products;
    }
  }
  Future AddOrser() async {
    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getString('user_id') ?? '');
    print('User ID ${user_id}');


    var res = await Api().postData('/cart/save-order/'+ user_id.replaceAll('"', ''));
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      //   print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      Alert(
        context: context,
        title: "Added to cart Sucessful",
        content: Icon(Icons.check_circle),
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(
                  color: Colors.white, fontSize: 20),
            ),
            onPressed:
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => placeorder(

                    )),
                  );  }, //Navigator.push(context, MaterialPageRoute(builder:(context)=> Order())),
            color: Colors.blueAccent,
            radius: BorderRadius.circular(0.0),
          ),
        ],
      ).show();
      //   Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>View_Comp()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }
  _deleteData(String id) async {
    var res =
        await Api().getData('/cart/delete_cart/' + id.replaceAll('"', ''));
    if (res.statusCode == 200) {
      setState(() {
        Alert(
          context: context,
          title: "Successfully deleted",
          content: Icon(Icons.check_circle),
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Cart())),
              color: Colors.blueAccent,
              radius: BorderRadius.circular(0.0),
            ),
          ],
        ).show();

        Fluttertoast.showToast(
          msg: "Removed from cart",
          backgroundColor: Colors.grey,
        );
      });
    } else {
      setState(() {
        Fluttertoast.showToast(
          msg: "Currently there is no data available",
          backgroundColor: Colors.grey,
        );
      });
    }
  }

  _increment(String id) async {
  setState(() {
      var _isLoading = true;
    });
  print(id);
    var res = await Api().getData('/cart/increment/' + id.replaceAll('"', ''));
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      print(body);
      setState(() {
        // qty++;
        /*   Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Cart()));*/
      });
      // Fluttertoast.showToast(
      //   msg: body['message'].toString(),
      //   backgroundColor: Colors.grey,
      // );
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  _decrement(String id) async {
    setState(() {
      var _isLoading = true;
    });

    var res = await Api().getData('/cart/decrement/' + id.replaceAll('"', ''));
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      print(body);
      setState(() {});
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "My Cart",
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
                      String img=snapshot.data![index].image;
                      String pe=snapshot.data![index].productname;
                      String ts=snapshot.data![index].total.toString();
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                                   Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                          ),
                                          onPressed: () async {
                                            setState(() {
                                              _deleteData(snapshot.data![index].id);
                                            });
                                          },
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              child: FloatingActionButton(
                                                onPressed: () async {
                                                  setState(() {
                                                    _decrement(
                                                        snapshot.data![index].id);
                                                  });
                                                },
                                                backgroundColor: Colors.white60,
                                                child: Icon(Icons.remove,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              snapshot.data![index].quantity,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              child: FloatingActionButton(
                                                onPressed: () async {
                                                  setState(() {
                                                    _increment(
                                                        snapshot.data![index].id);
                                                  });
                                                },
                                                backgroundColor: Colors.white60,
                                                child: Icon(Icons.add,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),


                                /* QuantityInput(
                            value: simpleIntInput,
                            onChanged: (value) => setState(
                                  () => simpleIntInput = int.parse(value.replaceAll(',', '')),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Implement delete item functionality
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.blue,
                            ),
                          ),*/
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    AddOrser();

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "Place Order",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
