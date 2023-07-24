import 'package:flutter/material.dart';
import 'package:trip/Admin/model/offermodel.dart';
import 'package:trip/Api/api_sevices.dart';

import 'offersaddofrs.dart';

class addoffers extends StatefulWidget {
  const addoffers({Key? key}) : super(key: key);

  @override
  State<addoffers> createState() => _addoffersState();
}

class _addoffersState extends State<addoffers> {
  final List<String> containerImages = [
    'images/two.jpg',
    'images/three.jpg',
    'images/two.jpg',
    'images/three.jpg',
  ];
  String id="";
  List _loadprooducts = [];
  ApiService client = ApiService();
  final List<String> Name = ["Tommato", "Onion", "carrot", "chilli"];

  bool _isExpanded=false;
  // This controller will store the value of the search bar
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Addoffers()),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        // Overide the default Back button
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_left_sharp, color: Colors.black,),
          label: const Text('Back', style: TextStyle(color: Colors.green)),
          style: ElevatedButton.styleFrom(

            backgroundColor: Colors.transparent,
            elevation: 0,
          ),

        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // other stuff


      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Offers",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),

              FutureBuilder <List<offerModel>>(
            future: client.fetchoffer(),
           builder: (BuildContext context,
              AsyncSnapshot<List<offerModel>> snapshot) {
            if (snapshot.hasData) {
               return ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                  //   scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
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



              SizedBox(width: 20),
    Column(
    crossAxisAlignment:
    CrossAxisAlignment.start,
    children: [
    Text(
    " Name:${(snapshot.data![index].product_name)}",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    ),
    ),
    SizedBox(height: 4),
    Text(
    " offer:${(snapshot.data![index].offer_name)}",
    style: TextStyle(
    fontSize: 14,
    color: Colors.grey[600],
    ),
    ),

                                Center(child: TextButton(onPressed:(){setState(() {
                                  _isExpanded=!_isExpanded;
                                });
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => Addoffers()),
                                // );

                                }, child:

                                Text("",style:TextStyle(fontSize: 18.0) ,))),



                              ]),


]

                        ),


                      ),
                    )
                    )
                    )

                    );
                  }
                );

    }
    return Center(child: CircularProgressIndicator());
           }
              ),



            ],
          ),
        ),
      ),
    );
  }
}
