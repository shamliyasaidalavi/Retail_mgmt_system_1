import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'AdmDel.dart';

class Deldetails extends StatefulWidget {
  const Deldetails({Key? key}) : super(key: key);

  @override
  State<Deldetails> createState() => _DeldetailsState();
}

class _DeldetailsState extends State<Deldetails> {
  @override
  Widget build(BuildContext context) {
    final List<String> containerImages = [
      'images/60111.jpg',
      'images/60111.jpg',
      'images/60111.jpg',
      'images/60111.jpg',
    ];

    final List<String> Name = ["shamli"];
    final List<String> Userid = ["233"];
    final List<String> Gender = ["Female"];
    final List<String> phonenumber = ["9895780059"];
    final List<String> Address = ["magattil house"];
    final List<String> Email = ["shamli@gmail.com"];
    final List<String> Password = ["2334556@55"];
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
                itemCount: 1,
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
                                              "Name:${(Name[index])}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "Userid:${(Userid[index])}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "Gender:${(Gender[index])}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "phonenumber:${(phonenumber[index])}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "Email:${(Email[index])}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "Address:${(Address[index])}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "Password:${(Password[index])}",
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
                                            }

                                        ),
                                        Spacer(),
                                        IconButton(
                                            icon: Icon(Icons.delete),
                                            color: Colors.grey[600],
                                            onPressed: () {  Alert(
                                              context: context,
                                              title: "Are You sure To Delete",
                                              content:  Icon(Icons.delete),
                                              buttons: [
                                                DialogButton(
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                                  ),
                                                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(context)=>AdmDel ())),
                                                  color: Color.fromRGBO(0, 179, 134, 1.0),
                                                  radius: BorderRadius.circular(0.0),
                                                ),
                                              ],

                                            ).show();

                                            }

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
