import 'package:flutter/material.dart';
import 'package:trip/Api/api_sevices.dart';

class Openorder extends StatefulWidget {
  const Openorder({Key? key}) : super(key: key);

  @override
  State<Openorder> createState() => _OpenorderState();
}

class _OpenorderState extends State<Openorder> {

  final List<String> containerImages = [
    'images/two.jpg',
    'images/three.jpg',
    'images/two.jpg',
    'images/three.jpg',
  ];
  final List<String> imageTitles = ["Customer name:shamli", "Customer name:shamli", "Customer name:shamli", "Customer name:shamli"];
  final List<String> Titles = ["Address:mangattil (H) tirur", "Address:mangattil (H) tirur", "Address:mangattil (H) tirur", "Address:"];
  final List<String> Titless = ["Phone nmr:9895780059", "Phone nmr:9895780059", "Phone nmr:9895780059", "Phoe nmr:9895780059"];
  final List<String> orderid = ["orderid:98957", "orderid:0059", "orderid:9895780059", "orderid:989059"];
   bool _isExpanded=false;
  List _loadprooducts = [];
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
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

      Text("Open Order",
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
        //           FutureBuilder <List<deliveryModel>>(
        //     future: client.fetchdeliveryy(),
        // builder: (BuildContext context,
        // AsyncSnapshot<List<deliveryModel>> snapshot) {
        // if (snapshot.hasData) {
        // return
      ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) {
      return SizedBox(
      width: 10,
      );
      },
        scrollDirection: Axis.vertical,
      itemCount: 4,
        // itemCount: snapshot.data!.length,
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
        Text("${orderid[index]}"
        ),
      ],
      ),


        Center(child: TextButton(onPressed:(){setState(() {
          _isExpanded=!_isExpanded;
        });

        }, child: Column(
          children: [
            Text("Action",style:TextStyle(fontSize: 18.0) ,),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _isExpanded ? 100 : 0, // Adjust the desired expanded height
              child: _isExpanded
                  ? Column(
                children: [
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Perform action for the first expanded button
                  //   },
                  //   child: Text('Cancel'),
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      // Perform action for the second expanded button
                    },
                    child: Text('Deliverd'),
                  ),
                ],
              )
                  : null,
            ),
          ],
        ))),



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
