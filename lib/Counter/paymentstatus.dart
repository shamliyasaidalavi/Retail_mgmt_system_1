import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/Admin/model/paymentModel.dart';
import 'package:trip/Admin/model/salesModel.dart';
import 'package:trip/Api/api_sevices.dart';
import 'package:trip/Counter/ordrusers.dart';

class paymentstatus extends StatefulWidget {
  const paymentstatus({Key? key}) : super(key: key);

  @override
  State<paymentstatus> createState() => _paymentstatusState();
}
List _loadprooducts = [];
String user_id = '';
late SharedPreferences prefs;
ApiService client = ApiService();
class _paymentstatusState extends State<paymentstatus> {
  final List<String>username = [
    "Username:shamli",
    "Username:shamli",
    "Username:shamli",
    "Username:shamli"
  ];
  final List<String> order_id = [
    "Order id:114456",
    "Order id:114456",
    "Order id:114456",
    "Order id:114456"
  ];
  final List<String> PaymetMethod = [
    "Take Away",
    "Online Delivery",
    "Take Away",
    "Take Away"
  ];
  final List<String> Amount = [ "Amount:9648", "Amount:648", "Amount:48", "Amount:29648"];
  final List<String> Date = [ "Date:12-1-2023", "Date:12-1-2023", "Date:12-1-2023", "Date:12-1-2023"];
  final List<String> Time = [ "Time:12.00pm", "Time:1.00pm", "Time:2.00pm", "Time:3.00pm"];
  final List<String> phonenumber = [ "9895780059", "9895780059", "9895780059.", "9895780059"];
  bool _isExpanded = false;
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

              Text("Payment Status",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),

    FutureBuilder <List<salesModel>>(
    future: client.fetchsales(),
    builder: (BuildContext context,
    AsyncSnapshot<List<salesModel>> snapshot) {
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
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    // mainAxisSize: MainAxisSize.min,
    children: [
    CircleAvatar(
    backgroundImage: AssetImage("images/two.jpg")


    // child: Image.asset(containerImages[index],fit: BoxFit.cover,),
    ), /*Container(
                                        width: 80,
                                        child: Image.asset(containerImages[index],
                                            fit: BoxFit.cover),
                                      ),*/

    Column(
    children: [
    Text("Username: ${first_name[index]}",
    style: TextStyle(color: Colors.grey[600]),
    ),

    Text(" orderid:${(snapshot.data![index].order_id)}",
    style: TextStyle(color: Colors.grey[600]),
    ),

    Text("paymenttype:${(snapshot.data![index].mode)}",
    style: TextStyle(color: Colors.grey[600]),
    ),
    Text(" date:${(snapshot.data![index].date)}",
    style: TextStyle(color: Colors.grey[500]),
    ),
    // Text(" total:${(snapshot.data![index].total)}",
    // style: TextStyle(color: Colors.grey[500]),
    // ),
    ],
    ),

    // Text("${Amount[index]}",
    // style: TextStyle(color: Colors.lightBlue),
    // ),

    Icon(Icons.check_circle, color: Colors.green,),


    ]),


    ),


    ),
    );
    },
    );
    }
    return Center(child: CircularProgressIndicator());
    }
              ),
            ]
        ),
      ),

    );
  }
}

