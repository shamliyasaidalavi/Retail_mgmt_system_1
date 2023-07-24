import 'package:flutter/material.dart';
import 'package:trip/Admin/model/usermodel.dart';
import 'package:trip/Api/api_sevices.dart';

class ctrdetails extends StatefulWidget {
  const ctrdetails({Key? key}) : super(key: key);

  @override
  State<ctrdetails> createState() => _ctrdetailsState();
}

class _ctrdetailsState extends State<ctrdetails> {
  final List<String> containerImages = [
    'images/60111.jpg',
    'images/60111.jpg',
    'images/60111.jpg',
    'images/60111.jpg',
  ];

  final List<String> Name = ["shamli"];
  final List<String> Userid = ["233"];
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
                                onTap: () {

                                },
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
                                              Text(
                                                "CounterName:${([index])}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                "Counterid:${([index])}",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey[600],
                                                ),
                                              ),

                                            ],
                                          ),

                                        ]
                                    )
                                )
                            )
                        )
                    );
                  }

              ),

          ],
        ),
      ),


          );
  }
}
