import 'package:flutter/material.dart';
import 'package:trip/Admin/model/salesModel.dart';
import 'package:trip/Api/api_sevices.dart';
import 'package:trip/Counter/userdtl.dart';

class takawtlist extends StatefulWidget {
  const takawtlist({Key? key}) : super(key: key);

  @override
  State<takawtlist> createState() => _takawtlistState();
}

class _takawtlistState extends State<takawtlist> {
  ApiService client = ApiService();
  final List<String> users = ["User1", "User2", "User3", "User4"];

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
                "Users List",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40),
              ),
            ),
            FutureBuilder<List<salesModel>>(
              future: client.fetchsales(),
              builder: (BuildContext context, AsyncSnapshot<List<salesModel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Card(
                          elevation: 2,
                          child: InkWell(
                            onTap: () {
                              // Handle the tap on the card if needed.
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 4),
                                      Text(
                                        users[index], // Assuming users list is used correctly here.
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "${snapshot.data![index].first_name}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "Date: ${snapshot.data![index].date}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "orderid: ${snapshot.data![index].order_id}",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Spacer(),
                                  // IconButton(
                                  //   icon: Icon(Icons.arrow_forward_ios_outlined),
                                  //   color: Colors.grey[600],
                                  //   onPressed: () {
                                  //     Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(builder: (context) => userdtl(snapshot.data![index].id,orderid:snapshot.data![index].order_id,)), // Assuming userdtl is implemented.
                                  //     );
                                  //   },
                                  // ),
                                ],
                              ),
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
