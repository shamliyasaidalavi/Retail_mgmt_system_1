import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/Admin/model/salesModel.dart';
import 'package:trip/Api/api_sevices.dart';

class admpaymt extends StatefulWidget {
  const admpaymt({Key? key}) : super(key: key);

  @override
  State<admpaymt> createState() => _admpaymtState();
}

class _admpaymtState extends State<admpaymt> {
  final List<String> containerImages = [
    'images/60111.jpg',
    'images/60111.jpg',
    'images/60111.jpg',
    'images/60111.jpg',
  ];
  List _loadprooducts = [];
  String user_id = '';
  late SharedPreferences prefs;
  ApiService client = ApiService();
  final List<String> Orderid= ["232445", "556", "4345", "45667"];
  final List<String> Username = ["sudhee", "shamli", "vicy", "Aju"];
  final List<String> total = ["sudhee", "shamli", "vicy", "Aju"];

  final List<String> paymenttype= ["online", "Takeaway", "online", "Takeaway"];

  final List<String> date= ["23-2-23", "23-2-23", "23-2-23", "23-2-23"];
  bool _isExpanded=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getId();

  }


  void getId()async{
    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getString('user_id') ?? '');
    print('User ID ${user_id}');


  }
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
                "Payment",
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
              itemCount:snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Card(
                    elevation: 2,
                    child: InkWell(


                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(containerImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Username: ${Username[index]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),

                                SizedBox(height: 4),
                                Text(" orderid:${(snapshot.data![index].order_id)}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),


                    SizedBox(height: 4),
                    Text("paymenttype:${(snapshot.data![index].mode)}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(" date:${(snapshot.data![index].date)}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    // SizedBox(height: 4),
                    // Text("total:${(snapshot.data![index].total)}",
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     color: Colors.grey[600],
                    //   ),
                    // ),
                              ],
                            ),

                            // Spacer(),
                            // IconButton(
                            //   icon: Icon(Icons.edit),
                            //   color: Colors.grey[600],
                            //   onPressed: () {
                            //
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
                }
                      ),

          ],
        ),
      ),
    );
  }
}