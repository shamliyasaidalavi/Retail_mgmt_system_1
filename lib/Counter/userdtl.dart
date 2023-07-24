import 'package:flutter/material.dart';
import 'package:trip/Counter/ordrusers.dart';

class userdtl extends StatefulWidget {
  const userdtl({Key? key}) : super(key: key);

  @override
  State<userdtl> createState() => _userdtlState();
}

final List<String> deliveryoys = <String>['deliveryBoy1', 'deliveryBoy2', 'deliveryBoy3', 'deliveryBoy4'];


class _userdtlState extends State<userdtl> {

  String dropdownValue2 =deliveryoys.first;
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
      child: Align(
      alignment: Alignment.centerLeft,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("USER1",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
      Divider(),


      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // Add padding around the search bar
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          // Use a Material design search bar

        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          value: dropdownValue2,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.black),


          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue2 = value!;
            });
          },
          items: deliveryoys.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
            Center(
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("OK"),
                ),
                onPressed: () {},

              ),
            ),
          ],
      ),


    )
      )


    );
  }
}
