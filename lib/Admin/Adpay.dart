import 'package:flutter/material.dart';

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
  // List _loadprooducts = [];
  // ApiService client = ApiService();
  final List<String> Billnumber= ["232445", "556", "4345", "45667"];
  final List<String> Userid = ["3445", "45466", "34590", "123489"];
  final List<String> Username = ["sudhee", "shamli", "vicy", "Aju"];
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
            //           FutureBuilder <List<salesModel>>(
            //     future: client.fetchsales(),
            // builder: (BuildContext context,
            // AsyncSnapshot<List<salesModel>> snapshot) {
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
                                Text("Billnumber: ${Billnumber[index]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text("Userid:${Userid[index]}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text("Username:${
                                    Username[index]}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.edit),
                              color: Colors.grey[600],
                              onPressed: () {

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