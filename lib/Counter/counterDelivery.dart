import 'package:flutter/material.dart';

class counterdelivery extends StatefulWidget {
  const counterdelivery({Key? key}) : super(key: key);

  @override
  State<counterdelivery> createState() => _counterdeliveryState();
}

class _counterdeliveryState extends State<counterdelivery> {
  final List<String> imageTitles = [
    "Customername:shamli",
    "Customername:shamli",
    "Customername:shamli",
    "Customername:shamli"
  ];
  final List<String> Titles = [
    "Order id:114456",
    "Order id:114456",
    "Order id:114456",
    "Order id:114456"
  ];
  final List<String> Phonenumerber = [
    "9895780059",
    "9895780059",
    "9895780059",
    "9895780059"
  ];

  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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

              Text("Delivery Status",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),

              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 20,
                  );
                },
                //   scrollDirection: Axis.vertical,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "images/two.jpg")


                                // child: Image.asset(containerImages[index],fit: BoxFit.cover,),
                              ), /*Container(
                                    width: 80,
                                    child: Image.asset(containerImages[index],
                                        fit: BoxFit.cover),
                                  ),*/

                              Column(
                                children: [
                                  Text("${imageTitles[index]}",
                                    style: TextStyle(
                                        color: Colors.grey[600]),
                                  ),

                                  Text("${Titles[index]}",
                                    style: TextStyle(
                                        color: Colors.grey[600]),
                                  ),

                                  Text(
                                    "Paymet Method:${ Phonenumerber[index]}",
                                    style: TextStyle(
                                        color: Colors.grey[600]),
                                  ),

                                ],
                              ),
                              Center(child: TextButton(onPressed: () {
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                });
                              }, child: Column(
                                children: [
                                  Text(" To Deliver",
                                    style: TextStyle(fontSize: 18.0),),

                                ],


                              ),


                              ),
                              )


                            ],
                          ),

                        ),
                      )

                  );
                }
    ),
    ]
    )
    )
    );

  }
}
