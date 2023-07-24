import 'package:flutter/material.dart';
import 'package:trip/Admin/model/productmodel.dart';
import 'package:trip/Admin/model/usermodel.dart';
import 'package:trip/Api/api_sevices.dart';
import 'package:trip/product/editprdt.dart';
import 'prdtdetails.dart';

class Prdt extends StatefulWidget {
  const Prdt({Key? key}) : super(key: key);

  @override
  State<Prdt> createState() => _PrdtState();
}

class _PrdtState extends State<Prdt> {
  final List<String> containerImages = [
    'images/two.jpg',
    'images/three.jpg',
    'images/two.jpg',
    'images/three.jpg',
  ];
  String id="";
  List _loadprooducts = [];
  ApiService client = ApiService();
  final List<String> product_name = ["jaya", "Chicken", "onion", "Mango"];
  final List<String> quantity = ["2kg", "5kg", "4kg", "3kg"];
  final List<String> category = ["Rice", "Meat", "vegetable", "fruit"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  PrdtDtls()),
          );
        },
        child: Icon(Icons.add),
      ),
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
                "Products",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40),
              ),
            ),
            FutureBuilder<List<productModel>>(
              future: client.fetchproduct(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<productModel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: snapshot.data!.length,

                    itemBuilder: (context, index) {
                     var id =snapshot.data![index].id;
                     print("prod id${id}");
                 final imageIndex = index % containerImages.length;
                 return InkWell(
                   onTap: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => Prdtedit(id:id)),
                     );
                   },
                   child: Card(
                          elevation: 2,
                     child: Padding(
                       padding: const EdgeInsets.all(10),
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           CircleAvatar(

                               backgroundImage: AssetImage("server/public/images/"+snapshot.data![index].image),
                             radius: 40,
                           ),
                          /* Container(
                           width: 80,
                           height: 80,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             image: DecorationImage(
                               image: AssetImage("server/public/images/"+snapshot.data![index].image),
                               fit: BoxFit.cover,
                             ),
                           ),
                         ),*/

                           SizedBox(width: 20),
                           Column(
                             crossAxisAlignment:
                             CrossAxisAlignment.start,
                             children: [
                               Text(
                                 " Name:${(snapshot.data![index].productname)}",
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 16,
                                 ),
                               ),
                               SizedBox(height: 4),
                               Text(
                                 " quantity:${(snapshot.data![index].quantity)}",
                                 style: TextStyle(
                                   fontSize: 14,
                                   color: Colors.grey[600],
                                 ),
                               ),
                               SizedBox(height: 4),
                               Text(
                                 " category:${(snapshot.data![index].category)}",
                                 style: TextStyle(
                                   fontSize: 14,
                                   color: Colors.grey[600],
                                 ),
                               ),
                             ],
                           ),
                           Spacer(),
                           IconButton(
                             icon: Icon(Icons.edit),
                             color: Colors.grey[600],
                             onPressed: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                     builder: (context) =>Prdtedit(id: id)),
                               );
                             },
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
    );
  }
}
