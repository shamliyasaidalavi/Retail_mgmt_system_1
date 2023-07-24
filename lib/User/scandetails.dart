import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/Admin/model/productmodel.dart';
import 'package:trip/Api/api.dart';
import 'package:trip/User/cart.dart';


class scandetails extends StatefulWidget {
  const scandetails({
    required this.product,
    Key? key}) : super(key: key);

  final productModel product;

  @override
  State<scandetails> createState() => _scandetailsState();
}

class _scandetailsState extends State<scandetails> {
String qty='';

  bool _isLoading = false;
  String user_id = "";
  late SharedPreferences localstorage;
  Future AddCart() async {
    localstorage = await SharedPreferences.getInstance();
    user_id = (localstorage.getString('user_id') ?? '');
    print('User ID ${user_id}');
    setState(() {
      _isLoading = true;
    });

    var data = {
      "user_id": user_id.replaceAll('"', ''),
      "product_id": widget.product.id.toString(),
      "quantity": "1",
    };
    print(data);
    var res = await Api().authData(data, '/cart/cart');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      //   print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      Navigator.push(context, MaterialPageRoute(builder:(context) => Cart(product: productModel(
        productname: 'test',
        category: 'rice',
        quantity: '1',
        price: '40',
        description: 'its veg ad fresh',
        image: '',
        id:  '2',



      ),),));
      //   Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>View_Comp()));
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
        physics: ScrollPhysics(),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('images/one.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.4),
                          Colors.black.withOpacity(.2),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Product Name: ${widget.product.productname}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            bottom: 8.0,
                          ),
                          child: Text(
                            'Product Category:${widget.product.category}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            bottom: 16.0,
                          ),
                          child: Text(
                            'Price:${widget.product.price}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Product Description: ${widget.product.description}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),


                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    qty=widget.product.quantity;
                    AddCart();

                    // Add your logic for adding to cart here
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
