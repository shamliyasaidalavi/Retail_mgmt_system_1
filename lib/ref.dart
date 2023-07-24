import 'package:flutter/material.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({Key? key}) : super(key: key);

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu),
        title: Text("Home"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text("0")),
            ),
          )
        ],
      ), body: SingleChildScrollView(physics: ScrollPhysics(),
          child: SafeArea(
              child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage('images/one.jpg'),
                                  fit: BoxFit.cover
                              )
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    colors: [
                                      Colors.black.withOpacity(.4),
                                      Colors.black.withOpacity(.2),
                                    ]
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text("Free Delivery For Next 3 Orders",
                                  style: TextStyle(color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),),
                                SizedBox(height: 30,),
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 40),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white
                                  ),
                                  child: Center(child: Text("Scan Now",
                                    style: TextStyle(color: Colors.grey[900],
                                        fontWeight: FontWeight.bold),)),
                                ),
                                SizedBox(height: 30,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[ Text("Categories", style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),),

                            ]
                        ),
                        Container(
                          height: 100,
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                  width: 200,
                                  //color: Colors.transparent,
                                  child: const Center(child: Text('Item 1', style: TextStyle(fontSize: 18, color: Colors.white),)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage('images/one.jpg'),
                                        fit: BoxFit.cover
                                    ),
                                  )
                              ),

                              SizedBox(width: 10,),

                              Container(
                                width: 200,
                                color: Colors.transparent,
                                child: const Center(child: Text('Item 2', style: TextStyle(fontSize: 18, color: Colors.white),)),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                width: 200,
                                color: Colors.transparent,
                                child: const Center(child: Text('Item 3', style: TextStyle(fontSize: 18, color: Colors.white),)),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                width: 200,
                                color: Colors.transparent,
                                child: const Center(child: Text('Item 4', style: TextStyle(fontSize: 18, color: Colors.white),)),
                              ),
                              SizedBox(width: 10,),
                            ],
                          ),
                        ),
                      ]
                  )
              )
          )
      ),
    );
  }
}
