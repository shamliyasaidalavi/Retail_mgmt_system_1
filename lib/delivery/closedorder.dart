import 'package:flutter/material.dart';
import 'package:trip/Api/api_sevices.dart';

class closedorder extends StatefulWidget {
  const closedorder ({Key? key}) : super(key: key);

  @override
  State<closedorder> createState() => _closedorderState();
}

class _closedorderState extends State<closedorder > {
  final List<String> containerImages = [
    'images/two.jpg',
    'images/three.jpg',
    'images/two.jpg',
    'images/three.jpg',
  ];
  List _loadprooducts = [];
  ApiService client = ApiService();
  final List<String> imageTitles = ["Customer name:shamli", "Customer name:shamli", "Customer name:shamli", "Customer name:shamli"];
  final List<String> Titles = ["Address:mangattil(H)tirur", "Address:mangattil(H)tirur", "Address:mangattil(H)tirur", "Address:"];
  final List<String> Titless = ["Phone nmr:9895780059", "Phone nmr:9895780059", "Phone nmr:9895780059", "Phoe nmr:9895780059"];
  final List<String> order_num = ["orderno: 846152", "orderno: 8461", "orderno: 84615", "orderno: 84615"];
  final List<String> closed_time= ["closed time: 8.00", "closed time: 8.00", "closed time: 8.00", "closed time: 8.00"];

  bool _isExpanded=false;
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

                Text("Closed Orders",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
                //           FutureBuilder <List<deliveryModel>>(
                //     future: client.fetchdelivery(),
                // builder: (BuildContext context,
                // AsyncSnapshot<List<deliveryModel>> snapshot) {
                // if (snapshot.hasData) {
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
                                    Text("${Titless[index]}"
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("${order_num[index]}",style: TextStyle(color: Colors.grey),
                                    ),
                                    Text("${closed_time[index]}",style: TextStyle(color: Colors.grey),

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
                //     }
                //           ),

              ],
            ),
          ),
        ),

      );
    }
  }

