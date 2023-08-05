import 'package:flutter/material.dart';
import 'package:trip/Admin/model/salesModel.dart';
import 'package:trip/Counter/orderdetl.dart';
import 'package:trip/Counter/userdtl.dart';

class orderuserss extends StatefulWidget {
  const orderuserss({Key? key}) : super(key: key);

  @override
  State<orderuserss> createState() => _orderuserssState();
}

final List<String> user = ["USER1", "USER2"];
final List<String> first_name = ["sani", "sudhee"];

class _orderuserssState extends State<orderuserss> {
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
                      FutureBuilder <List<salesModel>>(
                future: client.fetchsales(),
            builder: (BuildContext context,
            AsyncSnapshot<List<salesModel>> snapshot) {
            if (snapshot.hasData) {
              return
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: imageTitles.length,
                  // Update the itemCount here
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Card(
                        elevation: 2,
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "${(snapshot.data![index].first_name)}",
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
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => userdtl()),
                                    // );
                                  },
                                ),
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
    }
    ),
          ],
        ),
      ),
    );
  }
}
