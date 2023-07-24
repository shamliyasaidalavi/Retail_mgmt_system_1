import 'package:flutter/material.dart';
import 'package:trip/Api/api_sevices.dart';
import 'package:trip/Counter/userdtl.dart';

class takawtlist extends StatefulWidget {
  const takawtlist({Key? key}) : super(key: key);

  @override
  State<takawtlist> createState() => _takawtlistState();
}

class _takawtlistState extends State<takawtlist> {
  // final List<String> containerImages = [
  //   'images/two.jpg',
  //   'images/three.jpg',
  //   'images/two.jpg',
  //   'images/three.jpg',
  // ];
  List _loadprooducts = [];
  ApiService client = ApiService();
  final List<String> users = ["User1", "User2", "User3", "User4"];
  final List<String> username = ["sudhee", "vincy", "sanitha", "shana"];
  final List<String> date = ["26th March", "1st june", "11th may", "4 july"];



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
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
                "Users List",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40),
              ),
            ),
    //  FutureBuilder <List<orderModel>>(
        //     future: client.fetchorder(),
        // builder: (BuildContext context,
        // AsyncSnapshot<List<orderModel>> snapshot) {
        // if (snapshot.hasData) {
        // return
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: 4,
              // itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Card(
                    elevation: 2,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Container(
                            //   width: 80,
                            //   height: 80,
                            //   decoration: BoxDecoration(
                            //     shape: BoxShape.circle,
                            //     image: DecorationImage(
                            //       image: AssetImage(containerImages[index]),
                            //       fit: BoxFit.cover,
                            //     ),
                            //   ),
                            // ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   imageTitles[index],
                                //   style: TextStyle(
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 16,
                                //   ),
                                // ),
                                SizedBox(height: 4),
                                Text(
                                  users[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  username[index],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  date[index],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.arrow_forward_ios_outlined),
                              color: Colors.grey[600],
                              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => userdtl()),
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
          ],
        ),
      ),
    );
  }
}
