import 'package:flutter/material.dart';

class cancelledorder extends StatefulWidget {
  const cancelledorder({Key? key}) : super(key: key);

  @override
  State<cancelledorder> createState() => _cancelledorderState();
}

class _cancelledorderState extends State<cancelledorder> {
  final List<String> containerImages = [
    'images/two.jpg',
    'images/three.jpg',
    'images/two.jpg',
    'images/three.jpg',
  ];
  final List<String> imageTitles = ["Customername:shamli", "Customername:shamli", "Customername:shamli", "Customername:shamli"];
  final List<String> Titles = ["Address:mangattil (H)tirur", "Address:mangattil (H)tirur", "Address:mangattil (H)tirur", "Address:"];
  final List<String> Titless = ["Phone nmr:9895780059", "Phone nmr:9895780059", "Phone nmr:9895780059", "Phoe nmr:9895780059"];
  final List<String> order_num = ["order no: 84615", "order no: 8468", "order no: 84648", "order no: 829648"];
  final List<String> cancelld_time= ["cancelld time:8.00", "cancelldtime:8.00", "cancelld time:8.00", "cancelld time:8.00"];
  final List<String> cancelld_by= ["DelBoy", "User", "User", "User"];

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      // Overide the default Back button
      automaticallyImplyLeading: false,
      leadingWidth: 100,
      leading: ElevatedButton.icon(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_left_sharp,color: Colors.black,),
        label: const Text('Back',style: TextStyle(color:Colors.green )),
        style: ElevatedButton.styleFrom(

          backgroundColor: Colors.transparent,
          elevation: 0,
        ),

      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      // other stuff


    ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Cancelled Orders",
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
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(backgroundImage:AssetImage("images/two.jpg")



                                    // child: Image.asset(containerImages[index],fit: BoxFit.cover,),
                                  ),/*Container(
                                        width: 80,
                                        child: Image.asset(containerImages[index],
                                            fit: BoxFit.cover),
                                      ),*/

                                  Column(
                                    children: [
                                      Text("${imageTitles[index]}"
                                      ),
                                      Text("${Titles[index]}"
                                      ),
                                      Text("${Titless[index]}"
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("${order_num[index]}",style: TextStyle(color: Colors.grey),
                                      ),
                                      Text("${cancelld_time[index]}",style: TextStyle(color: Colors.grey),

                                      ),
                                      Text("Cancelld by:${cancelld_by[index]}",style: TextStyle(color: Colors.grey),

                                      ),
                                    ],
                                  ),





                                ]),
                            Padding(
                              padding: const EdgeInsets.only(left :50,top: 10),
                              child: Align(alignment:Alignment.centerLeft,child: Text("Reason:customer out of home",style: TextStyle(color: Colors.red),),),
                            ),
                            
                          ],
                        ),
                           
                                                   



                      ),


                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),);
  }
}
