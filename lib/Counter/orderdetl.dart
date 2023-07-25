import 'package:flutter/material.dart';
import 'package:trip/Api/api_sevices.dart';
import 'package:trip/Counter/ordrusers.dart';
import 'package:trip/Counter/takeawylist.dart';

class orderdtl extends StatefulWidget {
  const orderdtl({Key? key}) : super(key: key);

  @override
  State<orderdtl> createState() => _orderdtlState();
}
List _loadprooducts = [];
ApiService client = ApiService();
final List<String> imageTitles = ["take_away"];
final List<String> imageTitless = ["online_ delivery"];

class _orderdtlState extends State<orderdtl> {
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
                "Order details",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40),
              ),
            ),
            SizedBox(
              height: 100, // Adjust the height as needed
              //           FutureBuilder <List<salesModel>>(
              //     future: client.fetchsales(),
              // builder: (BuildContext context,
              // AsyncSnapshot<List<salesModel>> snapshot) {
              // if (snapshot.hasData) {
              // return
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: imageTitles.length,
                // itemCount: snapshot.data!.length,

                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      elevation: 2,
                      child: InkWell(
                        onTap: () {
                          // Add onTap functionality here if needed
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                imageTitles[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios_outlined),
                                color: Colors.grey[600],
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => orderuserss()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20), // Adjust the height as needed
            SizedBox(
              height: 100, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: imageTitless.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      elevation: 2,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => takawtlist()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                imageTitless[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios_outlined),
                                color: Colors.grey[600],
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => takawtlist()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              // }
              // return Center(child: CircularProgressIndicator());
              //     }
              //           ),
            ),
          ],
        ),
      ),
    );
  }
}
