import 'package:flutter/material.dart';

import 'admoredtls.dart';

class Admisalesreport extends StatefulWidget {
  const Admisalesreport({Key? key}) : super(key: key);

  @override
  State<Admisalesreport> createState() => _AdmisalesreportState();
}

class _AdmisalesreportState extends State<Admisalesreport> {
  final List<String> containerImages = [
    'images/two.jpg',
    'images/three.jpg',
    'images/two.jpg',
    'images/three.jpg',
  ];
  // List _loadprooducts = [];
  // ApiService client = ApiService();
  final List<String> imageTitles = ["12-5-2023", "12-5-2023", "12-5-2023", "12-5-2023"];
  final List<String> Titles = ["35465767", "354645", "35465767", "35465767"];
  final List<String> Titless = ["9", "5", "3", "2"];
  bool _isExpanded=false;
  // This controller will store the value of the search bar
  final TextEditingController _searchController = TextEditingController();

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
              Text("Sales Report",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // Add padding around the search bar
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  // Use a Material design search bar
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search order by date',
                      // Add a clear button to the search bar
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _searchController.clear(),
                      ),
                      // Add a search icon or button to the search bar
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // Perform the search here
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),

                    ),

                  ),

                ),

              ),

              //           FutureBuilder <List<salesModel>>(
              //     future: client.fetchsales(),
              // builder: (BuildContext context,
              // AsyncSnapshot<List<salesModel>> snapshot) {
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
                              Icon(Icons.shopping_cart_rounded,color: Colors.red,size: 40,),




                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Date : ${imageTitles[index]}"
                                  ),
                                  Text("Order id : ${Titles[index]}"
                                  ),
                                  Text("items : ${Titless[index]}"
                                  ),
                                ],
                              ),


                              Center(child: TextButton(onPressed:(){
                                setState(() {
                                  _isExpanded=!_isExpanded;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => adsalesdtls()),
                                );
                              }, child: Column(
                                children: [
                                 Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
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
