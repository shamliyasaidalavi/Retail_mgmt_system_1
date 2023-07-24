import 'package:flutter/material.dart';

class Retail extends StatefulWidget {
  const Retail({Key? key}) : super(key: key);

  @override
  State<Retail> createState() => _RetailState();
}

class _RetailState extends State<Retail> {

  final List<String> _listText  = ['Rice','Meat',];
  final List<String> _listItem = [
  'images/two.jpg',
  'images/three.jpg',
  'images/f.jpg',
  'images/five.jpg',
  'images/one.jpg',
  'images/two.jpg',
  'images/three.jpg',
  'images/f.jpg',

];
  int _selectedIndex = 0;

  void _onItemTapped( index) {
    setState(() {
      _selectedIndex =index;
    });
  }
  @override
        Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey[600],
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
        ),
        body: SingleChildScrollView(
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
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Center(child: Text("Free Delivery For Next 3 Orders", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),)),
                          SizedBox(height: 30,),
                          Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                            ),
                            child: Center(child: Text("Scan Now", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),)),
                          ),
                          SizedBox(height: 30,),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[ Text("Categories", style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),

              Row(
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("two.jpg")
                        )
                      ),

                  ),
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/three.jpg")
                        )
                    ),

                  ),


                ],
              ),

                          SizedBox(height: 20,),
                      ],
                  ),


                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: _listItem.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 50),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(_listItem[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _listText[index % _listText.length],
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ), );
                    },
                  ),



          ],
          ),
          ),
          )
        ),
      //
       bottomNavigationBar: BottomNavigationBar(
         selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
         type: BottomNavigationBarType.shifting,
         currentIndex: _selectedIndex,
         onTap: _onItemTapped,
         items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
           ),
           BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'store',
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.trolley),
             label: 'cart',
           ),
           BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
           BottomNavigationBarItem(
             icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
       ),

          );
        }
}




