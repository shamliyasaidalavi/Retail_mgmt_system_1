import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trip/Admin/maagecategory.dart';
import 'package:trip/Api/api.dart';
import 'package:trip/product/prdt.dart';

class Prdtedit extends StatefulWidget {
  String id;
  Prdtedit({required this.id});

  @override
  State<Prdtedit> createState() => _PrdteditState();
}

class _PrdteditState extends State<Prdtedit> {
  TextEditingController productnameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late String id;
  String product_name = "";
  String category = "";
  String quantity = "";
  String description = "";

  @override
  void initState() {
    super.initState();
    _viewPro();
  }

  Future<void> _viewPro() async {
    String se = widget.id;
    print(widget.id);
    print("user selected id is${se}");
    var res =
    await Api().getData('/product/view-single-product/${widget.id}');
    var body = json.decode(res.body);
    print("body${body}");
    setState(() {
      product_name = body['data']['product_name'];
      category = body['data']['category'];
      quantity = body['data']['quantity'];
      description = body['data']['description'];
      productnameController.text = product_name;
      categoryController.text = category;
      quantityController.text = quantity;
      descriptionController.text = description;
    });
  }

  _update() async {
    setState(() {
      var _isLoading = true;
    });
    String se = widget.id;
    var data = {
      "product_name": productnameController.text,
      "category": categoryController.text,
      "quantity": quantityController.text,
      "description": descriptionController.text,
    };
    print(data);
    var res = await Api().authData(data, '/product/update-single-product/' + se);
    var body = json.decode(res.body);

    if (body['success'] == true) {
      print(body);

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Prdt(
          ),
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  _delete() async {
    setState(() {
      var _isLoading = true;
    });
    String se = widget.id;
    print("id${se}");
    var data = {
      "id":se

    };

    print(data);
    var res = await Api().authData(data,'/product/delete-single-product/' + se.toString());
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      print(body);

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Prdt()),
      );
      print(body['message']);
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/two.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: productnameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'product name',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: categoryController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'category',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: quantityController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'product quantity',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'product Description',
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _update();

                  },
                  child: Text(
                    'UPDATE',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 32,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _delete,
                  child: Text(
                    'DELETE',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 32,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),

    );
  }
}
