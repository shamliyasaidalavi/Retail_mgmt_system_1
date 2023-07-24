import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trip/Api/api.dart';
import 'package:trip/Counter/addoffers.dart';

class Addoffers extends StatefulWidget {

  const Addoffers({Key? key}) : super(key: key);
  @override
  State<Addoffers> createState() => _AddoffersState();
}

class _AddoffersState extends State<Addoffers> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController product_idController = TextEditingController();
  TextEditingController offer_nameController = TextEditingController();

  @override
  void dispose() {
    product_idController.dispose();
    offer_nameController.dispose();

    super.dispose();
  }
  void registerdeliveryboy()async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      "product_id": dropDownValue,
      "offer_name":offer_nameController.text,

    };print(data);
    var res = await Api().authData(data,'/offer/Addoffer');
    var body = json.decode(res.body);

    if(body['success']==true)
    {
      print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context)=> addoffers()));

    }
    else
    {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

    }
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProducts();
  }

  Future getAllProducts()async{
    var res = await Api().getData('/product/view-product');
    var body = json.decode(res.body);

    setState(() {
      product=body['data'];
      // depart_id = body['data'][0]['_id'];
    });
  }var dropDownValue;
  List product = [];
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
          Text("Add Offers",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
    Divider(),

            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.maxFinite,
                child: DropdownButtonFormField<String>(

                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                    hint: Text('product'),
                    value: dropDownValue,
                    items: product
                        .map((type) => DropdownMenuItem<String>(
                      value: type['_id'].toString(),
                      child: Text(
                        type['product_name'].toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    ))
                        .toList(),
                    onChanged: (type) {
                      setState(() {
                        dropDownValue = type;
                      });
                    }),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // Add padding around the search bar
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                // Use a Material design search bar
                child: TextField(
                  controller: offer_nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'OfferType',
                  ),
                ),
              ),
            ),



            Center(
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Add Offer"),
                ),
                onPressed: () {registerdeliveryboy();},

              ),
            ),
        ],
    ),
      ),
    ),
    );
  }
}
