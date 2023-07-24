import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trip/Admin/model/coutermodel.dart';
import 'package:trip/Admin/model/deliveryModel.dart';
import 'package:trip/Admin/model/usermodel.dart';
import 'package:trip/Api/api.dart';
import 'package:trip/Api/api_sevices.dart';
import 'cuterdetails.dart';

class AdmDel extends StatelessWidget {
  final List<String> containerImages = [
    'images/rest.png',
    'images/rest.png',
    'images/rest.png',
    'images/rest.png',
  ];
  List _loadprooducts = [];
  ApiService client = ApiService();
  Future approveUser(String deliid) async {
    print("u ${deliid}");
    var response = await Api().getData('/register/approve/'+deliid);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print("approve status${items}");
      Fluttertoast.showToast(
        msg: "Approved",
      );
    } else {
      Fluttertoast.showToast(
        msg: "Error",
      );
    }
  }

  late String deliid;

  final List<String> entries1 = ['Counter1', 'Counter2'];
  final List<String> userIds = ['001', '002'];
  final List<String> entries = ['Counter3', 'Counter5', 'Counter4', 'Counter1'];
  final List<String> userIds2 = ['007', '008', '009', '003'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_left_sharp, color: Colors.black),
          label: const Text(
            'Back',
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Text(
            'Request',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ctrdetails()));
              },
              child: FutureBuilder<List<deliveryModel>>(
                  future: client.fetchdelivery(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<deliveryModel>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          deliid = snapshot.data![index].logid;
                          print(deliid);

                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                              AssetImage(containerImages[index]),
                            ),
                            title: Text(
                              snapshot.data![index].delboyname,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            subtitle: Text(
                              "deliveryid:${(snapshot.data![index].id)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {
                                    // Handle approve button pressed
                                    approveUser(deliid);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    // Handle decline button pressed
                                    _declineUser(index);
                                  },
                                ),
                              ],
                            ),
                            tileColor: Colors.grey.withOpacity(0.4),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
          ),
          Divider(
            thickness: 2,
            color: Colors.black,
          ),
          Text(
            'All deliveryboys',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FutureBuilder<List<deliveryModel>>(
                  future: client.fetchdeliveryap(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<deliveryModel>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index < containerImages.length) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                AssetImage(containerImages[index]),
                              ),
                              title: Text(
                                snapshot.data![index].delboyname,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              subtitle: Text(
                                'ID: ${(snapshot.data![index].id)}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  // Handle delete button pressed
                                  _showDeleteConfirmationDialog(context, index);
                                },
                              ),
                              tileColor: Colors.grey.withOpacity(0.4),
                            );
                          } else {
                            return SizedBox(); // Return an empty container if the index is out of range
                          }
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, int index) async {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete User'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure you want to delete this user?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                // Perform delete operation
                _deleteUser(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteUser(int index) {
    // Perform the actual delete operation here
    // You can remove the user from the 'entries' list or call any delete API
    if (index >= 0 && index < entries.length) {
      entries.removeAt(index);
      if (index < containerImages.length) {
        containerImages.removeAt(index);
      }
    }
  }

  void _declineUser(int index) {
    // Perform the decline operation here
    // For example, delete the user from the database
    print('User ${entries[index]} declined.');
  }
}
